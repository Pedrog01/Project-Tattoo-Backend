class Job < ApplicationRecord
  belongs_to :user
  has_many_attached :image
end
