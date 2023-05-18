class User < ApplicationRecord
  has_secure_password
  has_one :authentication_token, dependent: :destroy

  validates :email, presence: true
  validates :email, uniqueness: true

  validates :password, presence: true, on: :create
  validates :password, length: { minimum: 6 }, on: :create

  validates :password_confirmation, presence: true, on: :create
  validates :password_confirmation, length: { minimum: 6 }, on: :create

  validate :email_format

  private

  def email_format
    errors.add(:email, "should be a valid email") unless email.to_s.include? '@'
  end
end
