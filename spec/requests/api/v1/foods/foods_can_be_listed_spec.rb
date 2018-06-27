require 'rails_helper'

describe 'A GET request made to /api/v1/foods', type: :request do
  it 'should return a JSON array of all foods' do
    foods = create_list(:food, 3)

    get '/api/v1/foods'

    expect(response).to be_successful

    data = JSON.parse(response.body)

    expect(data.length).to be(3)

    expect(data.first.name) .to  eq(foods.first.name)
    expect(data.second.name).to  eq(foods.second.name)
    expect(data.third.name) .to  eq(foods.third.name)
  end
end
