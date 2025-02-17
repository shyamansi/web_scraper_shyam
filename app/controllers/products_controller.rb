class ProductsController < ApplicationController
  def index
    products = Product.all
    products = products.where("title ILIKE ?", "%#{params[:search]}%") if params[:search].present?
    render json: products
  end

  def create
    data = Scraper.scrape(params[:url])
    product = Product.create(data.merge(url: params[:url]))

    ScraperJob.perform_later(product.id) if product.persisted?
    render json: product
  end
end
