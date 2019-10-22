class Song < ApplicationRecord
	belongs_to :user
  	has_many :user_playlists, dependent: :destroy
  	has_many :users, through: :user_playlists

  validates :artist, presence: true, length: {minimum: 2, maximum: 50}
  validates :title, presence: true, length: {minimum: 5, maximum: 50}
end
