require 'rails_helper'

RSpec.describe User, type: :model do
  before { @user = User.new(username: "Example User", 
           fullname: 'user@example.com')}
  subject { @user }
  it { should respond_to(:username) }
  it { should respond_to(:fullname) }
  it { should respond_to(:opinions) }

  it { should be_valid }

  describe "when username & fullname is not present" do
    before { @user.username = " ", 
    @user.fullname = "" }
    it { should_not be_valid }
  end

  describe  "when name is too long" do
    before { @user.username = 'a' * 51,
              @user.fullname = 'a' * 51 }
    it { should_not be_valid }
  end
  it { should respond_to(:follow!) }
  it { should respond_to(:unfollow!) }
  it { should respond_to(:followings)}
  it { should respond_to(:followed_user)}
  it { should respond_to(:following?) }
  it { should respond_to(:reverse_followings)}
  it { should respond_to(:followers)}
  it { should respond_to(:num_following)}
  it { should respond_to(:num_followers)}
  it { should respond_to(:num_opinions)}
  it { should respond_to(:random_wtf)}
  it { should respond_to(:network_tweets)}

  describe "following" do
    let(:other_user){FactoryBot.create(:user)}
    before do
      @user.save
      @user.follow!(other_user)
    end
    it { should be_following(other_user) }
    its(:followed_user) { should include(other_user) }

    describe "followed user" do
      subject { other_user }
      its(:followers){ should include(@user) }
    end

    describe "and unfollowing"do
      before { @user.unfollow!(other_user) }
      it {should_not be_following(other_user) }
      its(:followed_user){ should_not include(other_user) }
    end
  end

  describe "opinion associations" do
    before { @user.save }
    let!(:older_opinion) do
      FactoryBot.create(:opinion, user: @user, created_at: 1.day.ago)
    end
    let!(:newer_opinion) do
      FactoryBot.create(:opinion, user: @user, created_at: 1.hour.ago)
    end
    it "should have the right opinions in the right order" do
      expect(@user.opinions.to_a).to eq [newer_opinion, older_opinion]
    end
  end
end
