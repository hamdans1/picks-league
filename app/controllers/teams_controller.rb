class TeamsController < ApplicationController
    
    before_action :require_sign_in, except: [:index, :show]
    before_action :authorize_user, except: [:index, :show]
    
    def show
        @team = Team.find(params[:id])
    end
    
    def new
        @league = League.find(params[:league_id])
        @team = Team.new
    end
    
    def edit
        @team = Team.find(params[:id])
    end
    
    def create
        @league = League.find(params[:league_id])
        @team = @league.teams.build(team_params)
        
        if @team.save
            flash[:notice] = "Team was saved"
            redirect_to [@league, @team]
        else
            flash.now[:alert] = "There was an error saving the team. Please try again."
            render :new
        end
    end
    
    def update
        @team = Team.find(params[:id])
        @team.assign_attributes(team_params)
        
        if @team.save
            flash[:notice] = "Team was updated"
            redirect_to [@team.league, @team]
        else
            flash.now[:alert] = "There was an error updating the team. Please try again."
            render :edit
        end
    end
    
    def destroy
        @team = Team.find(params[:id])
        
        if @team.destroy
            flash[:notice] = "\"#{@team.name}\" was deleted successfully."
            redirect_to @team.league
        else
            flash.now[:alert] = "There was an error deleting the team."
            render :show
        end
    end
    
    
    private
    
    def team_params
        params.require(:team).permit(:city, :name, :coach, :predictive, :actual)
    end
    
    def authorize_user
        unless current_user.admin?
            flash[:alert] = "You must be an admin to do that."
            redirect_to root_path
        end
    end
    
    
end
