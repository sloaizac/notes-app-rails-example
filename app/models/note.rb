class Note < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, uniqueness: true #Validamos que en los campos allá contenido y que el titulo sea único
  validates :body, presence: true
end
