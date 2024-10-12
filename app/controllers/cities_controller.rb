class CitiesController < ApplicationController
    def index
      @cities = City.where(department_id: params[:department_id])
      respond_to do |format|
        format.json { render json: @cities }
      end
    end
  end