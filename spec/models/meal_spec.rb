require 'rails_helper'

describe Meal, type: :model do
  it { is_expected.to validate_presence_of(:name) }

  it { is_expected.to have_many(:meal_foods) }
  it { is_expected.to have_many(:foods).through(:meal_foods) }
end
