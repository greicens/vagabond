class Post < ApplicationRecord
  # ADDS THE RELATIOSHIP BETWEEN THE USER AND CITY MODELS
  belongs_to :user, optional: true
  belongs_to :city, optional: true

  # VALIDATES THE POST TITLE LENGTH AND CONTENT 
  validates :title, presence: true, length: { in: 1..200 }
  validates :message, presence: true
end
