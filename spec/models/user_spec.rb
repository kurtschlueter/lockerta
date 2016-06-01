require 'rails_helper'

describe User do
  context 'validations' do
    it { should have_many(:articles)}
    it { should have_many(:reviews) }
    it { should belong_to(:school) }
  end

  context 'active model' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }
    it { is_expected.to validate_length_of(:password).is_at_most(20) }
  end


end