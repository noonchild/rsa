class AddRsa < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.column :login,                     :string
      t.column :email,                     :string
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string
      t.column :remember_token_expires_at, :datetime
      t.column :activation_code, :string, :limit => 40
      t.column :activated_at, :datetime
      t.column :identity_url, :string
    end
    create_table :hoods do |t|
      t.column :name, :string
      t.column :graflink, :string
      t.column :hotspot, :integer
    end
    create_table :states do |t|
      t.column :name, :string, :default=>"ready"
      t.column :created_at, :datetime
      t.column :user_id, :integer
      t.column :location_id, :integer, :default=>1
      t.column :hood_id, :integer, :default=>1
      t.column :job, :integer
      t.column :current_enthusiasm, :integer, :default=>100
      t.column :option_id, :integer, :default=>1
    end
    create_table :options do |t|
      t.column :name, :string
      t.column :graflink, :string
      t.column :description, :string
      t.column :link, :string
      t.column :location_id, :string
      t.column :controller, :string
      t.column :cash_price, :integer
      t.column :enthuse_price, :integer
      t.column :charisma_needed, :integer
      t.column :skill_needed, :integer
      t.column :savvy_needed, :integer
      t.column :looks_needed, :integer
      t.column :fans_needed, :integer, :default => 0
      t.column :car_needed, :integer, :default => 0
      t.column :uniform_needed, :integer, :default => 0
      t.column :cash_payout, :integer, :default => 0
      t.column :enthuse_payout, :integer, :default => 0
      t.column :charisma_quotient, :integer, :default => 0
      t.column :skill_quotient, :integer, :default => 0
      t.column :savvy_quotient, :integer, :default => 0
      t.column :looks_quotient, :integer, :default => 0
      t.column :give_car, :integer, :default => 0
      t.column :give_pet, :integer, :default => 0
      t.column :give_box, :integer, :default => 0
      t.column :give_job, :integer, :default => 0
      t.column :give_acct, :integer, :default => 0
      t.column :give_guitar, :integer, :default => 0
      t.column :give_burger, :integer, :default => 0
      t.column :give_charity_bar, :integer, :default => 0
      t.column :give_uniform, :integer, :default => 0
      t.column :random_money, :integer, :default => 0
      t.column :random_pet, :integer, :default => 0
      t.column :give_fan, :integer, :default => 0
      t.column :random_fan, :integer, :default => 0
      t.column :duration, :integer, :default => 0
      t.column :charity_bar_price, :integer, :default => 0
      t.column :take_point, :integer, :default => 0
      t.column :give_point, :integer, :default => 0
      t.column :take_job, :integer, :default => 0
    end
    create_table :pages do |t|
      t.column :title, :string, :default => "RockStarAlley"
      t.column :link, :string
      t.column :linkorder, :integer
      t.column :body, :text
      t.column :created_at, :date
      t.column :updated_at, :date
    end
    create_table :actors do |t|
      t.column :name, :string
      t.column :log, :string, :limit => 3400, :default => "Welcome to RockStarAlley. You are going to rock.<br>"
      t.column :new_message, :integer, :default => 1
      t.column :looks, :float, :default => 1
      t.column :charisma, :float, :default => 1
      t.column :skill, :float, :default => 1
      t.column :savvy, :float, :default => 1
      t.column :points_to_give, :integer, :default => 12
      t.column :user_id, :integer
      t.column :updated_at, :date
      t.column :works_at, :integer, :default => 0
      t.column :last_pay_date, :date
      t.column :consecutive_work_hours, :integer, :default => 0
      t.column :burgers, :integer, :default => 2
      t.column :cash, :integer, :default => 100
      t.column :has_car, :integer, :default => 0
      t.column :has_pet, :integer, :default => 0
      t.column :has_box, :integer, :default => 0
      t.column :has_job, :integer, :default => 0
      t.column :has_acct, :integer, :default => 0
      t.column :has_guitar, :integer, :default => 0
      t.column :has_apt, :integer, :default => 0
      t.column :fans, :integer, :default => 0
      t.column :charity_bar, :integer, :default => 0
      t.column :has_uniform, :integer, :default => 0
    end
    create_table :locations do |t|
      t.column :name, :string
      t.column :graflink, :string
      t.column :hood_id, :integer
      t.column :description, :string
    end
  end

  def self.down
    drop_table "users"
    drop_table :hoods
    drop_table :states
    drop_table :options
    drop_table :pages
    drop_table :actors
    drop_table :locations
  end
  
end
