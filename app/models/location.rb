class Location < ActiveRecord::Base
  has_many :options
  belongs_to :hood

  #fixtures :locations
  #def hood_name
    #self.hood.name
  #end
  def display_name
    self.name
  end
  
end
