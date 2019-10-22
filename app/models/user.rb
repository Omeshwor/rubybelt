class User < ApplicationRecord
  has_many :user_playlists, dependent: :destroy
  has_many :songs
  has_many :added_songs, through: :user_playlists, source: :song
  before_save :downcase_email

  validates :first_name, presence: true, length: {minimum: 2, maximum: 50}
  validates :last_name, presence: true, length: {minimum: 2, maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, length: {minimum: 6}, presence: true
  has_secure_password

  private
  def downcase_email
    self.email = email.downcase
  end

end
