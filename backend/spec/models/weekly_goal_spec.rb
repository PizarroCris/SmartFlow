require 'rails_helper'

RSpec.describe WeeklyGoal, type: :model do
  describe 'associations' do
    it 'belongs to user' do
      expect(WeeklyGoal.reflect_on_association(:user).macro).to eq(:belongs_to)
  end
end