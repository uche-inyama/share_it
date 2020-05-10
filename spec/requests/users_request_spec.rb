require 'rails_helper'

RSpec.feature "Users", type: :feature do
  subject { page }

  describe 'signup page' do
    before { visit new_user_path }   
    it { should have_content('Sign in') }
  end
end
