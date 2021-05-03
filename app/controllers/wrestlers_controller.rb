class WrestlersController < ApplicationController

    def index
        @wrestlers = Wrestler.all
    end

    def new
        @wrestler = Wrestler.new
    end

    def create
        @wrestler = current_user.wrestlers.build(wrestler_params)
        @wrestler.team_id = Team.first.id
        if @wrestler.save
            redirect_to wrestler_path(@wrestler)
        else
            render :new
        end
    end 

    def show
        @wrestler = Wrestler.find_by_id(params[:id])
    end

    private

    def wrestler_params
        params.require(:wrestler).permit(:name, :hails_from, :birthdate, :belt, :special_move, :team_id)
    end

end
