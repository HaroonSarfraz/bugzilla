require 'rails_helper'

RSpec.describe User, type: :model do
  context 'without email' do  # (almost) plain English
    it 'should be invalid' do  #
      record = User.new
      record.valid?
      expect(record.errors[:email]).to include("can't be blank") # test code
    end
  end
end
