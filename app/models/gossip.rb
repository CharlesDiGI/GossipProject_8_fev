class Gossip < ApplicationRecord
  belongs_to :user
  has_many :tags_by_gossips
  has_many :tags, through: :tags_by_gossips
  has_many :comments
  has_many :likes, as: :likeable #, dependent: :destroy
  has_many :comments, as: :commenteable #,  dependent: :destroy
  validates :title, presence: true, length: { minimum: 3, maximum: 14 }
  validates :content, presence: true


end
