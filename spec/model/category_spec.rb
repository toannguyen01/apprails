require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validates' do
    it { should validate_presence_of (:title)}
  end

  describe 'associa' do
    it { should have_many(:products)}
  end
end