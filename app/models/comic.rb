class Comic < ApplicationRecord
  has_many :pages, -> { order :number }
end
