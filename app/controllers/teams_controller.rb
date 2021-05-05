class TeamsController < ApplicationController

    def index
        @teams = current_user.teams
    end

    def new
        @team = Team.new
    end

    def create
        @team = current_user.teams.build(team_params)
        if @team.save
            redirect_to team_path(@team)
        else
            render :new
        end
    end

    def show
        @team = Team.find_by_id(params[:id])
    end 

    def edit
        @team = Team.find_by_id(params[:id])
    end

    def update
        @team = Team.find_by_id(params[:id])
        @team.update(team_params)

        if @team.valid?
            redirect_to team_path(@team)
        else
            render :edit
        end
    end

    def destroy
        @team = Team.find_by_id(params[:id])
        @team.destroy
        redirect_to teams_path
    end


    private

    def team_params
        params.require(:team).permit(:name, :description)
    end
end
