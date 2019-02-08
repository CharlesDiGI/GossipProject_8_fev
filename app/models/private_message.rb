class PrivateMessage < ApplicationRecord
  belongs_to :sender, class_name: "User"  
  has_many :multi_pms
  has_many :users, through: :multi_pms
  validates :content, presence: true
end
