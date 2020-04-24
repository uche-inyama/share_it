class User < ApplicationRecord
    validates :username, presence: true
    validates :fullname, presence: true

    has_many :followers, foreign_key: 'follower_id', class_name: 'Following'
    has_many :followed, foreign_key: 'followed_id', class_name: 'Following'
end
