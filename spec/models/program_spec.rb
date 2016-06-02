require 'rails_helper'

describe Program do
  context 'validations' do

    # We need to implement S3 and paperclip in order for program_images to be tested for

    # it { should have_many(:program_images)}
    it { should have_many(:reviews) }
    it { should belong_to(:school) }
    it { should belong_to(:coach) }
  end

  context 'active model' do
    it { is_expected.to validate_presence_of(:sport) }
    it { is_expected.to validate_presence_of(:school_id) }
    it { is_expected.to validate_presence_of(:coach_id) }
  end


end