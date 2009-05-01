namespace :db do
  desc "Loads a schema.rb file into the database and then loads the initial database fixtures."
  task :bootstrap => ['db:schema:load', 'db:bootstrap:import']

  # based on Rick Olson's bootstrap rake task.
  namespace :bootstrap do
    desc "Load database fixtures (in db/fixtures/<env>/*.{yml,csv}) into the current environment's database.  Load specific folder using FOLDER=db/foo. Load specific fixtures using FIXTURES=x,y"
    task :import => :environment do
      require 'active_record/fixtures'
      #require 'fastercsv'

      import_folder = ENV['FOLDER'] || "db/fixtures/#{RAILS_ENV}/"
      import_folder += '/' unless import_folder.slice(-1..-1).eql?('/')
  
      rake_start_time = Time.now
      file_count = 0
      ActiveRecord::Base.establish_connection(RAILS_ENV.to_sym)
      (ENV['FIXTURES'] ? ENV['FIXTURES'].split(/,/) : Dir.glob(File.join(RAILS_ROOT,import_folder, '*.{yml,csv}'))).each do |fixture_file|
        table_start_time = Time.now
        puts "Loading #{fixture_file}"
        Fixtures.create_fixtures(import_folder, File.basename(fixture_file, '.*'))
        table_end_time = Time.now
        puts "   -> #{(table_end_time - table_start_time).to_s}s"
        file_count += 1
      end
   
      rake_end_time = Time.now
      puts "-- total files: #{file_count}"
      puts "   -> #{(rake_end_time - rake_start_time).to_s}s"
    end
  end
  
  desc "Run cron tasks."
  task :scheduling => ['db:scheduling:daily', 'db:scheduling:hourly' ]
  
  namespace :scheduling do 
    desc "Daily cron run."
    task :daily => :environment do
      for a in Actor.find(:all)
        #calc savings - if logged in over last 3 weeks
          puts a.name
          expires_on = (a.updated_at + 21)
          a.consecutive_work_hours = 0
          a.save
        if expires_on >=  Time.now.to_date
          message1 = a.calc_savings!
          if message1 == ""
            puts "No savings."
          else
            puts message1
            x = "#{a.log} #{message1}"
            a.log = x
            a.save
          end
          u = User.find_by_id(a.user_id)
          s = State.find_by_user_id(u.id)
          s.reset_enthuse!
          s.save
        else
          puts "hasn't been around."
        end
      end
    end
    desc "Hourly cron run."
    task :hourly => :environment do
      #increment enthusiasm
      #pay wages if recently logged in - within last 1 hour
      for a in Actor.find(:all)
          puts a.name
          expires_on = (a.updated_at + 1.day)
        if DateTime.now <= expires_on
          #other logic - last_pay_date + consecutive_work_hours
            if a.consecutive_work_hours < 8
              #calc wages
              message2 = a.calc_wages!
              if message2 == ""
                puts "No wages."
              else
                puts message2
                x = "#{a.log} #{message2}"
                a.log = x
                a.save
              end
            end
        else
          #look for shelter
          if a.has_box > 0
            s = State.find_by_user_id(u.id)
            s.take_shelter!
            x = "#{a.log} #{a.name} takes refuge in a shantie. "
            a.log = x
            a.save
          else
            puts "No shantie."
          end
          a.consecutive_work_hours = 0
          a.save
          puts "hasn't been around."
        end
      end
    end
  end
end


 
