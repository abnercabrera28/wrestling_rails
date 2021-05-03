class TeamsController < ApplicationController

    def index
        @teams = Team.all
    end

    def new
        @team = Team.new
    end

    def create
        @team = Team.new
        redirect_to team_path(@team)
    end
end
