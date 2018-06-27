class Api::V1::FoodsController < ApplicationController
  def index
    render json: Food.all
  end

  def show
    food = Food.where(id: params[:id]).first

    render nothing: true, status: 404 and return if food.nil?
    render json: food
  end
end
