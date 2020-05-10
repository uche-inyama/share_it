require 'rails_helper'

RSpec.describe Opinion, type: :model do
  let(:user){ FactoryBot.create(:user) }
  before { @opinion = user.opinions.build(text: "Lorem ipsum") }

  subject { @opinion }

  it { should respond_to(:text) }
  it { should respond_to(:author_id) }

  it { should be_valid }

  describe "when author_id is not present" do
    before { @opinion.author_id = nil }
    it { should_not be_valid}
  end

  describe "when user_id not present" do
    before { @opinion.author_id = nil }
    it { should_not be_valid }
  end

  describe "with blank text" do
    before { @opinion.text = " " }
    it { should_not be_valid }
  end

  describe "with text this is too long" do
    before { @opinion.text = "a"*141 }
    it { should_not be_valid }    
  end

end
