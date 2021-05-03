class WrestlersController < ApplicationController

    def index
        @wrestlers = Wrestler.all
    end

    def new
        @wrestler = Wrestler.new
    end

    def create
        @wrestler = Wrestler.new(wrestler_params)
        if @wrestler.save
            redirect_to wrestler_path(@wrestler)
        else
            flash[:error] = "#{@wrestler.errors.full_messages.join(" | ")}"
            render :new
        end

    end 

    private

    def wrestler_params
        params.require(:wrestler).permit(:name, :hails_from, :birthdate)
    end

end
