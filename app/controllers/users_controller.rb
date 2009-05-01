class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(params[:user])
    @user.save!
    self.current_user = @user
    redirect_to('/')
    flash[:notice] = "Thanks for signing up! Please check your inbox for a confirmation email from RockStarAlley."
  rescue ActiveRecord::RecordInvalid
    render :action => 'new'
  end

end
