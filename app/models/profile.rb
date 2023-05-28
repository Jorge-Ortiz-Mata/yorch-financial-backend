class Profile < ApplicationRecord
  has_one_attached :avatar
  belongs_to :user, dependent: :destroy

  # validate :sex_format, on: :update

  # SEX_OPTIONS = %w[MALE FEMALE].freeze

  # private

  # def sex_format
  #   return if SEX_OPTIONS.include?(sex)

  #   errors.add(:sex, 'tiene que ser formato válido (MASCULINO, FEMENINO)')
  # end
end
