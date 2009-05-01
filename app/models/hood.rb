class Hood < ActiveRecord::Base
  #fixtures :hoods
  has_many :locations
end
