class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commenteable, polymorphic: true
  has_many :likes, as: :likeable
  has_many :childs, class_name: "Comment",  as: :commenteable
  validates :content, presence: true
end
