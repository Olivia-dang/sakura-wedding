class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable
  has_many :dresses

  #declare relationships with the Transaction
  has_many :sales, class_name: "Transaction", foreign_key: :seller_id
  has_many :sold_dresses, through: :sales, source: :dress
  has_many :purchases, class_name: "Transaction", foreign_key: :buyer_id
  has_many :purchased_dresses, through: :purchases, source: :dress

  #only give me all transactions with seller_id 
  scope :sellers, -> { joins(:sales) }
  #only give me all transactions with buyer_id 
  scope :buyers, -> { joins(:purchases) }

end
