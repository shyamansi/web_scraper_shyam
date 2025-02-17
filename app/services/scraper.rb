require 'nokogiri'
require 'httparty'

class Scraper
 def self.scrape(url)
    response= Httparty.get(url)
    doc = Nokogiri::HTML(response.body)
    {
      title: doc.at_css("span.B_NuCI")&.text.strip,
      price: doc.at_css("div._30jeq3")&.text.strip,
      description: doc.at_css("div._1mXcCf")&.text.strip,
      category: doc.at_css("a._2whKao")&.text.strip
    }
 end
end