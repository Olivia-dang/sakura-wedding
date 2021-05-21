class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  validates :content, presence: true
end
