class Revenue < ApplicationRecord
  belongs_to :user

  validates :title, presence: { message: 'Titulo no puede estar en blanco' }
  validates :description, presence: { message: 'Description no puede estar en blanco' }
  validates :quantity, presence: { message: 'Cantidad no puede estar en blanco' }
end
