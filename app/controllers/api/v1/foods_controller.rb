class Api::V1::FoodsController < ApplicationController
  def index
    render json: Food.all
  end

  def show
    food = Food.where(id: params[:id]).first

    render nothing: true, status: 404 and return if food.nil?
    render json: food
  end

  def create
    food = Food.new(food_params)

    if food.save
      render json: food
    else
      render nothing: true, status: 400
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :calories);
  end
end
