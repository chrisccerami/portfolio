class Comic < ApplicationRecord
  has_many :pages, -> { order :number }

  validates :title, :slug, presence: true
end
