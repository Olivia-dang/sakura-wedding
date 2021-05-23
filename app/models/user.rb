class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable
  has_many :dresses

  #declare relationships with the Transaction
  has_many :sales, class_name: "Transaction", foreign_key: :seller_id, dependent: :destroy 
  has_many :sold_dresses, through: :sales, source: :dress, dependent: :destroy 
  has_many :purchases, class_name: "Transaction", foreign_key: :buyer_id, dependent: :destroy 
  has_many :purchased_dresses, through: :purchases, source: :dress, dependent: :destroy 

  #only give me all transactions with seller_id 
  scope :sellers, -> { joins(:sales) }
  #only give me all transactions with buyer_id 
  scope :buyers, -> { joins(:purchases) }
  
  #a user instance can have many reviews 
  has_many :reviews, as: :reviewable, dependent: :destroy 

end
