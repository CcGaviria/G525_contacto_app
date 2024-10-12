class DepartmentsController < ApplicationController
    def index
      @departments = Department.where(country_id: params[:country_id])
      respond_to do |format|
        format.json { render json: @departments }
      end
    end
  end