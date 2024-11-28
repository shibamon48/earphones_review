class Tag < ApplicationRecord
  has_many :reviews_tags, dependent: :destroy
end
