class Tag < ApplicationRecord
  has_many :tags_by_potins
  has_many :gossips, through: :tags_by_gossips
  validates :title, presence: true
end
