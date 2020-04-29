class Opinion < ApplicationRecord
    belongs_to :author, class_name: 'User'
    self.per_page = 10
end
