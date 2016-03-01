class Product < ActiveRecord::Base
  belongs_to :brand
  belongs_to :category

  has_attached_file :avatar,
    styles: { large: "500x500#", medium: "300x300#", thumb: "100x100#" },
    default_url: ":style_missing.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  # By validating brand and category without "_id", we are making sure that they not only have an integer in the brand_id/category_id fields but that those keys refer to real brands and categories that currently exist.
  validates_presence_of :name, :current_price, :quantity, :description, :brand, :category

  validates_numericality_of :current_price, greater_than_or_equal_to: 0.01

  validates_numericality_of :quantity, greater_than_or_equal_to: 0

  def self.search_by_name_or_description(string)
    where("name LIKE ? OR description LIKE ?", "%#{string}%", "%#{string}%")
  end
end
