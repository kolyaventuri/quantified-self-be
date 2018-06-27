require 'rails_helper'

describe 'A POST request to a specific /api/v1/meals/:meal_id/foods/:id' do
  xit 'should add the food :id to meal :meal_id' do

  end

  it 'should return a 404 status code if the meal cannot be found' do
    get '/api/v1/meals/1000/foods/2'

    expect(resposne.status).to be(404)
  end

  it 'should return a 404 status code if the food cannot be found' do
    meal = create(:meal)

    get "/api/v1/meals/#{meal.id}/foods/1000"

    expect(resposne.status).to be(404)
  end
end
