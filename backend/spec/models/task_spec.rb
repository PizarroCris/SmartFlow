require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }

    it { should belong_to(:weekly_goal).optional }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    
    it { should define_enum_for(:status).with_values([:incomplete, :completed]) }

    it { should define_enum_for(:priority).with_values([:low, :medium, :high]) }
  end
end