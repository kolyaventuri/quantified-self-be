require 'rails_helper'

describe MealFood, type: :model do
  it { is_expected.to belong_to(:food) }
  it { is_expected.to belong_to(:meal) }
end
