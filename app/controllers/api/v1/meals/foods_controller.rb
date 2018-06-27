class Api::V1::Meals::FoodsController < ApplicationController
  def index
    meal = Meal.where(id: params[:id]).first

    if meal.nil?
      render nothing: true, status: 404 and return
    end

    render json: meal, include: :foods
  end

  def create
    meal = Meal.where(id: params[:meal_id]).first
    food = Food.where(id: params[:id]).first

    if meal.nil? || food.nil?
      render nothing: true, status: 404 and return
    end
  end
end
