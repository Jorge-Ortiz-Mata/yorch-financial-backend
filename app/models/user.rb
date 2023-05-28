class User < ApplicationRecord
  has_secure_password
  has_one :authentication_token, dependent: :destroy
  has_one :profile, dependent: :destroy

  validates :email, presence: true
  validates :email, uniqueness: { message: 'Email ya ha sido registrado' }

  validates :password, presence: true, on: :create
  validates :password, length: { minimum: 6 }, on: :create

  validates :password_confirmation, presence: true, on: :create
  validates :password_confirmation, length: { minimum: 6 }, on: :create

  validate :email_format

  after_create :set_profile

  private

  def email_format
    errors.add(:email, "should be a valid email") unless email.to_s.include? '@'
  end

  def set_profile
    profile = Profile.create(user: self)

    Profile.find(profile.id).update!(name: email)
  end
end
