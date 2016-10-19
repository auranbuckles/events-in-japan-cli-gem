require 'open-uri'
require 'pry'

class EventsInJapan::Event

	attr_accessor :name, :dates, :location, :description, :url

	def self.scrape_events
		doc = Nokogiri::HTML(open("https://www.gotokyo.org/eventlist/en/list"))

		doc.css(".box_detail").map do |event|
			event_url = "https://www.gotokyo.org" + event.css("a").attribute("href").value
			event_doc = Nokogiri::HTML(open(event_url))
			location_string = event_doc.css("#tmp_info_detail tr:first-child td").text
			{
				name: event.css("a").text,
				location: location_string.gsub("\n\n", "").gsub("\n", ", "),
				description: event_doc.css(".box_photo + p").text,
				url: "https://www.gotokyo.org" + event.css("a").attribute("href").value
			}

		end
	end

	def list_events
		
	end

end

