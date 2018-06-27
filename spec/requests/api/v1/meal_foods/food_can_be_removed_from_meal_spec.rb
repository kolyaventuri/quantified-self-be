require 'rails_helper'

describe 'A DELETE request to /api/v1/meals/:meal_id/foods/:id' do
  it 'should remove the specified food from that meal' do
    meal = create(:meal)
    food = create(:food)

    meal.foods << food
    meal.save

    delete "/api/v1/meals/#{meal.id}/foods/#{food.id}"

    expect(response).to be_successful

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data[:message]).to eq("Successfully removed #{food.name} from #{meal.name}")
  end

  it 'should return a 404 status code if the meal cannot be found' do
    delete '/api/v1/meals/1000/foods/2'

    expect(response.status).to be(404)
  end

  it 'should return a 404 status code if the food cannot be found' do
    meal = create(:meal)

    delete "/api/v1/meals/#{meal.id}/foods/1000"

    expect(response.status).to be(404)
  end
end
