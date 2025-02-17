class ScraperJob < ApplicationJob
  queue_as :default

  def perform(product_id)
    product = Product.find_by(id:product_id)
    return unless product
   
    new_data = Scraper.scrape(product.url)
    product.update(new_data) if new_data.present?
  end
end
