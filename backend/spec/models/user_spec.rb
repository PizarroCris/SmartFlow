require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:weekly_goals) }

    it { should have_many(:tasks) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(20) }

    context 'uniqueness' do
      subject { FactoryBot.create(:user) } 
      
      it { should validate_uniqueness_of(:email).case_insensitive }
    end
  end
end