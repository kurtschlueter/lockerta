require 'rails_helper'

describe Article do
  context 'validations' do
    it { should belong_to(:user)}
  end

  context 'active model' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:body) }
  end
end