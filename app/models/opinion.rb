class Opinion < ApplicationRecord
    belongs_to :author, class_name: 'User'
    default_scope -> { order('created_at DESC')}
    validates :text, presence: true, length: { maximum: 140 }
    validates :author_id, presence: true
    self.per_page = 10
end
