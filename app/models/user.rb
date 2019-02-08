class User < ApplicationRecord
  has_secure_password

  belongs_to :city
  has_many :gossips
  has_many :likes
  has_many :comments
  has_many :private_messages
  
  validates :password, presence: true, length: { minimum: 6 }
  validates :email, presence: true, uniqueness: true

  # has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  # has_many :received_messages, foreign_key: 'recipient_id', class_name: "MultiPm"
  # has_many :multi_pms
  # has_many :private_messages, through: :multi_pms
  # has_many :comments
end
