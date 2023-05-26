class Profile < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validate :sex_format, on: :update

  SEX_OPTIONS = %w[MASCULINO FEMENINO].freeze

  private

  def sex_format
    return if SEX_OPTIONS.include?(sex)

    errors.add(:sex, 'tiene que ser formato válido (MASCULINO, FEMENINO)')
  end
end
