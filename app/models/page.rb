class Page < ApplicationRecord
  belongs_to :comic

  has_attached_file :image, storage: :s3, s3_credentials: S3_CREDENTIALS, s3_region: 'us-east-1'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def first?
    number == 1
  end

  def last?
    comic.pages.maximum(:number) == number
  end
end
