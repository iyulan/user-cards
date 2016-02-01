require 'rails_helper'

describe Photo do
  describe 'associtations' do
    it { should have_one(:card) }
  end
end
