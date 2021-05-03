class TeamsController < ApplicationController

    def index
        @teams = Team.all
    end

    def new
        @team = Team.new
    end

    def create
        @team = Team.new(team_params)
        redirect_to team_path(@team)
    end

    private

    def team_params
        params.require(:team).permit(:name)
    end
end
