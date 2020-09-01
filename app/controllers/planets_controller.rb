class PlanetsController < ApplicationController
    def index
        @planets = Planet.all 
        render json: @planets
    end

    def show
        @planet = Planet.find(params[:id])
        render json: @planet
    end
end
