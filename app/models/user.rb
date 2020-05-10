class User < ApplicationRecord
    self.per_page = 10
    has_one_attached :photo
    has_one_attached :coverimage
    
    validates :username, presence: true, length: { maximum: 50 }
    validates :fullname, presence: true

    has_many :followings, foreign_key: "follower_id", dependent: :destroy
    has_many :followed_user, through: :followings, source: :followed

    has_many :reverse_followings, foreign_key: "followed_id", 
                                  class_name: "Following",
                                  dependent: :destroy

    has_many :followers, through: :reverse_followings, source: :follower

    has_many :opinions, foreign_key: 'author_id', class_name: 'Opinion'

    def network_tweets
        id_array = followings.map(&:followed_id) << id
        Opinion.where(author_id: id_array)
    end

    def random_wtf
      id_array = followings.map(&:followed_id) << id
      User.where.not(id: id_array).includes([:followed_user]).sample(3)
    end

    def num_following
        return 0 unless followed_user.any?
    
        followed_user.count
    end
    
      def num_followers
        return 0 unless followers.any?
    
        followers.count
      end
    
      def num_opinions
        return 0 unless opinions.any?
    
        opinions.count
      end

      def following?(other_user)
        followings.find_by(followed_id: other_user.id)
      end
    
      def follow!(other_user)
        followings.create!(followed_id: other_user.id)
      end

      def unfollow!(other_user)
        followings.find_by(followed_id: other_user.id).destroy
      end
end
