class CountriesController < ApplicationController
    def show
      @country = Country.find(params[:id])
      @departments = @country.departments.includes(:cities) 
    end
  end
  