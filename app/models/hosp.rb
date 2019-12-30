class Hosp < ApplicationRecord
  belongs_to :user
  has_many :diseases

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ""
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
