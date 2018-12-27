class Comic < ApplicationRecord
  has_many :pages, -> { order :number }

  before_save :set_slug

  validates :title, presence: true

  def set_slug
    self.slug = title.parameterize
  end
end
