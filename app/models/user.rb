class User < ApplicationRecord
    self.per_page = 10
    has_one_attached :photo
    validates :username, presence: true
    validates :fullname, presence: true

    has_many :followers, foreign_key: 'followed_id', class_name: 'Following'
    has_many :followeds, foreign_key: 'follower_id', class_name: 'Following'
    has_many :opinions, foreign_key: 'author_id', class_name: 'Opinion'

    def network_tweets
        id_array = followers.map(&:followed_id) << id
        Opinion.where(author_id: id_array)
    end

    def random_wtf
        id_array = followers.map(&:followed_id) << id
        User.where.not(id: id_array).includes([:followeds]).sample(3)
    end

    def num_followers
        return 0 unless followeds.any?

        followeds.count
    end

    def num_following
        return 0 unless followeds.any?
    
        followeds.count
      end
    
      def num_followers
        return 0 unless followers.any?
    
        followers.count
      end
    
      def num_opinions
        return 0 unless opinions.any?
    
        opinions.count
      end
end
