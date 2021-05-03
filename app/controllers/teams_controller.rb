class TeamsController < ApplicationController

    def index
        @teams = Team.all
    end

    def new
        @team = Team.new
    end

    def create
        @team = Team.new(team_params)
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
            redirect_to wrestler_path(@team)
        else
            render :edit
        end
    end


    private

    def team_params
        params.require(:team).permit(:name)
    end
end
