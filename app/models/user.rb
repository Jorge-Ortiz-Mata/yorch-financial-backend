class User < ApplicationRecord
  has_secure_password
  has_one :authentication_token, dependent: :destroy

  validates :email, presence: { message:  'El campo email no debe estar en blanco' }
  validates :email, uniqueness: { message:  'Este email ya ha sido tomado' }

  validates :password, presence: true, on: :create
  validates :password, length: { minimum: 6 }, on: :create

  validates :password_confirmation, presence: true, on: :create
  validates :password_confirmation, length: { minimum: 6 }, on: :create

  validate :email_format

  private

  def email_format
    errors.add(:email, "debe ser un email válido") unless email.to_s.include? '@'
  end
end
