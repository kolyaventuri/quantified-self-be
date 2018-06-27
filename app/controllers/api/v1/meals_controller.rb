class Api::V1::MealsController < ApplicationController
  def index
    render json: Meal.all, include: :foods
  end
end
