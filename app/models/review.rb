class Review < ApplicationRecord
  belongs_to :user
  has_many :reviews_tags, dependent: :destroy
  has_many :tags, through: :reviews_tags
  has_many :bookmarks, dependent: :destroy

  has_one_attached :image

  validates :name, presence: true
  validates :maker, presence: true
  validates :rating, comparison: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  def self.ransackable_attributes(auth_object = nil)
    %w[maker name body]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
