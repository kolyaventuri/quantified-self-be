require 'rails_helper'

describe 'A GET request to a specific /api/v1/meals/:meal_id/foods' do
  it 'should return a JSON array of the foods for that meal' do
    meals = create_list(:meal, 3)
    foods = create_list(:food, 3)

    meal = meals.last
    foods.each do |food|
      meal.foods << food
    end
    meal.save!

    get "/api/v1/meals/#{meal.id}/foods"

    expect(response).to be_successful

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data[:id]).to   be(meal.id)
    expect(data[:name]).to eq(meal.name)

    expect(data[:foods]).to        be_an(Array)
    expect(data[:foods].length).to be(foods.length)

    expect(data[:foods].first[:id]).to   be(foods.first.id)
    expect(data[:foods].first[:name]).to eq(foods.first.name)
  end

  it 'should return a 404 error if the meal is not found' do
    get '/api/v1/meals/1000/foods'

    expect(response.status).to be(404)
  end
end
