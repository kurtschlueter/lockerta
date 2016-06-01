require 'rails_helper'

describe Coach do
  context 'validations' do
    it { should have_many(:reviews)}
    it { should have_many(:programs) }
  end

  context 'active model' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:alma_mater) }
    it { is_expected.to validate_presence_of(:gender) }
    it { is_expected.to validate_presence_of(:wins) }
    it { is_expected.to validate_presence_of(:losses) }
    it { is_expected.to validate_presence_of(:year_started) }
    it { is_expected.to validate_presence_of(:ncaa_appearances) }
    it { is_expected.to validate_presence_of(:conference_titles) }
    it { is_expected.to validate_presence_of(:recruiting_state1) }
    it { is_expected.to validate_presence_of(:recruiting_state2) }
    it { is_expected.to validate_presence_of(:recruiting_state3) }
  end
end