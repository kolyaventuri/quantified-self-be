require 'rails_helper'

describe 'A POST request to a specific /api/v1/meals/:meal_id/foods/:id' do
  it 'should add the food :id to meal :meal_id' do
    meal = create(:meal)
    food = create(:food)

    post "/api/v1/meals/#{meal.id}/foods/#{food.id}"

    expect(response).to be_successful

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data[:message]).to eq("Successfully added #{food.name} to #{meal.name}")
  end

  it 'should return a 404 status code if the meal cannot be found' do
    post '/api/v1/meals/1000/foods/2'

    expect(response.status).to be(404)
  end

  it 'should return a 404 status code if the food cannot be found' do
    meal = create(:meal)

    post "/api/v1/meals/#{meal.id}/foods/1000"

    expect(response.status).to be(404)
  end
end
