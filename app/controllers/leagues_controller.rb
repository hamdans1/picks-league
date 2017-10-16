class LeaguesController < ApplicationController
  
  before_action :require_sign_in, except: [:index, :show]
  before_action :authorize_user, except: [:index, :show]
  
  def new
    @league = League.new
  end
  
  def create
    @league = League.new(league_params)
    
    if @league.save
      flash[:notice] = "League saved successfully"
      redirect_to @league
    else
      flash.now[:alert]= "Error creating league, Please try again."
      render :new
    end
  end
  
  private
  
  def league_params
    params.require(:league).permit(:name)
  end
  
  def authorize_user
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end
  
end
