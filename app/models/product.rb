class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items
  before_save :strip_html_content_products
  validates :name, :sku, presence: true

  def strip_html_content_products
    self.description = ActionView::Base.full_sanitizer.sanitize(self.description)
  end  
end
