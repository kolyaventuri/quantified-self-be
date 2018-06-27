class Api::V1::FoodsController < ApplicationController
  def index
    render json: Food.all
  end

  def show
    food = Food.find(params[:id])

    render json: food
  end
end
