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

  def update
    food = Food.where(id: params[:id]).first

    if food.nil?
      render nothing: true, status: 400 and return
    end

    food.update(food_params)

    render json: food
  end

  def destroy
    food = Food.where(id: params[:id]).first

    if food.nil?
      render nothing: true, status: 404 and return
    end

    food.delete

    render nothing: true, status: 204
  end

  private

  def food_params
    params.require(:food).permit(:name, :calories);
  end
end
