require 'rails_helper'

describe School do
  context 'validations' do
    it { should have_many(:users)}
    it { should have_many(:programs)}
    it { should have_many(:reviews)}
  end

  context 'active model' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:location) }
  end
end