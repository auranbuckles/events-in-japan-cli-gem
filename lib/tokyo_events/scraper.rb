require 'open-uri'
require 'pry'

class TokyoEvents::Scraper

	def self.scrape_and_create_events
		doc = Nokogiri::HTML(open("https://www.gotokyo.org/eventlist/en/list"))

		doc.css(".box_detail").each do |event|
			TokyoEvents::Event.new_from_index_page(event)
		end
	end
end