class Page < ApplicationRecord
  belongs_to :comic

  has_one_attached :image

  def first?
    comic.pages.minimum(:number) == number
  end

  def last?
    comic.pages.maximum(:number) == number
  end

  def next
    comic.pages.where("number > ?", number).first
  end

  def previous
    comic.pages.where("number < ?", number).last
  end
end
