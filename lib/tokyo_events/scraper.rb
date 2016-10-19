require 'open-uri'
require 'pry'

class TokyoEvents::Scraper

	def self.scrape_events
		doc = Nokogiri::HTML(open("https://www.gotokyo.org/eventlist/en/list"))

		events = []
		doc.css(".box_detail").each do |event|
			event_url = "https://www.gotokyo.org" + event.css("a").attribute("href").value
			event_doc = Nokogiri::HTML(open(event_url))
			location_string = event_doc.css("#tmp_info_detail tr:first-child td").text
			event_info = {
				name: event.css("a").text,
				location: location_string.gsub("\n\n", "").gsub("\n", ", ").gsub(/,,|,\s,/, ","),
				description: event_doc.css(".box_photo + p").text,
				url: "https://www.gotokyo.org" + event.css("a").attribute("href").value
			}

			events << event_info
		end
		events
	end
end