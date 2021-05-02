class WrestlersController < ApplicationController

    def index
        @wrestlers = Wrestler.all
    end

    def new
        @wrestler = Wrestler.new
    end

    def create
        
    end 

end
