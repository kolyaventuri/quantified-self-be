class Api::V1::Meals::FoodsController < ApplicationController
  def index
    meal = Meal.where(id: params[:meal_id]).first

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

    meal.foods << food

    meal.save
    msg = { message: "Successfully added #{food.name} to #{meal.name}" }
    render json: msg, status: 201 and return
  end

  def destroy
    meal = Meal.where(id: params[:meal_id]).first
    food = Food.where(id: params[:id]).first


    if meal.nil? || food.nil?
      render nothing: true, status: 404 and return
    end

    meal_food = MealFood.where(meal_id: params[:meal_id], food_id: params[:id]).first

    meal_food.destroy

    msg = { message: "Successfully removed #{food.name} from #{meal.name}" }

    render json: msg
  end
end
