class WrestlersController < ApplicationController

    def index
        @wrestlers = Wrestler.all
    end

    def new
        @wrestler = Wrestler.new
        @wrestler.build_team
    end

    def create
        @wrestler = current_user.wrestlers.build(wrestler_params)
        if @wrestler.save
            redirect_to wrestler_path(@wrestler)
        else
            render :new
        end
    end 

    def show
        @wrestler = Wrestler.find_by_id(params[:id])
        @team = Team.find_by_id(params[:team_id])
        if @wrestler.team != @team
            redirect_to teams_path 
        end
    end

    def edit
        @wrestler = Wrestler.find_by_id(params[:id])
    end

    def update
        @wrestler = Wrestler.find_by_id(params[:id])
        @wrestler.update(wrestler_params)

        if @wrestler.valid?
            redirect_to wrestler_path(@wrestler)
        else
            render :edit
        end
    end

    def destroy
        @wrestler = Wrestler.find_by_id(params[:id])
        @wrestler.destroy
        redirect_to wrestlers_path
    end

    private

    def wrestler_params
        params.require(:wrestler).permit(:name, :hails_from, :birthdate, :belt, :special_move, :team_id, team_attributes: [:name])
    end

end
