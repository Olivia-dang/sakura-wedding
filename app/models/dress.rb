class Dress < ApplicationRecord
    validates :name, presence: true
    validates :color, presence: true
    validates :size, presence: true
    validates :price, presence: true
    validates :description, presence: true
    
    belongs_to :category
    belongs_to :user
    has_one_attached :picture
    has_many :reviews, as: :reviewable, dependent: :destroy 
    has_many :transactions, dependent: :destroy
    
    include PgSearch
    scope :sorted, ->{ order(name: :asc) }
    pg_search_scope :search,
                    against: [
                        :name,
                        :color,
                        :description,
                    ],
                    using: {
                        tsearch: {
                        prefix: true,
                        normalization: 2
                        }
                    }

    def self.perform_search(keyword)
        if keyword.present?
        Dress.search(keyword)
        else
        Dress.all
        end.sorted
    end
end
