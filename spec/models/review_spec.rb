require 'rails_helper'

describe Review do
  context 'validations' do
    it { should belong_to(:user)}
    it { should belong_to(:program) }
    it { should belong_to(:coach) }
    it { should belong_to(:school) }
  end

  context 'active model' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:coach_id) }
    it { is_expected.to validate_presence_of(:school_id) }
    it { is_expected.to validate_presence_of(:program_id) }
  end
end