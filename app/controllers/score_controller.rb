
class ScoreController < ApplicationController
  
def board
  @thisguy=Actor.find_by_user_id(current_user)
  @money = Actor.find(:all, :order => "cash desc", :limit => 5)
  @pets = Actor.find(:all, :order => "has_pet desc", :limit => 5)
  @skill = Actor.find(:all, :order => "skill desc", :limit => 5)
  @savvy = Actor.find(:all, :order => "savvy desc", :limit => 5)
  @charisma = Actor.find(:all, :order => "charisma desc", :limit => 5)
  @looks = Actor.find(:all, :order => "looks desc", :limit => 5)
  @best_job = Actor.find(:all, :order => "has_job desc", :limit => 5)
  @best_car = Actor.find(:all, :order => "has_car desc", :limit => 5)
  @fans = Actor.find(:all, :order => "fans desc", :limit => 5)
end

end