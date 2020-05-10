require 'rails_helper'

RSpec.describe Following, type: :model do
  let(:follower) { FactoryBot.create(:user)}
  let(:followed) { FactoryBot.create(:user)}
  let(:following) {follower.followings.build(followed_id: followed.id)}

  subject { following }
  it { should be_valid }

  describe "follower methods" do
    it { should respond_to(:follower)}
    it { should respond_to(:followed)}
    its(:follower){ should eq follower }
    its(:followed){ should eq followed }
  end

  describe "when followed_id is not present" do
    before { following.followed_id = nil }
    it { should_not be_valid }
  end

  describe "when followe_id is not present" do
    before { following.follower_id = nil }
    it { should_not be_valid }
  end
end
