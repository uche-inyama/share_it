class User < ApplicationRecord
    validates :username, presence: true
    validates :fullname, presence: true

    has_many :followers, foreign_key: 'follower_id', class_name: 'Following'
    has_many :followeds, foreign_key: 'followed_id', class_name: 'Following'
    has_many :authored_opinions, foreign_key: 'author_id', class_name: 'Opinion'
end
