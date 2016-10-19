require 'open-uri'
require 'pry'

class EventsInJapan::Event

	attr_accessor :name, :dates, :location, :description, :url

	def self.scrape_events
		doc = Nokogiri::HTML(open("https://www.gotokyo.org/eventlist/en/list"))

		doc.css(".box_detail").map do |event|

			event.name = event.css("a").text
			event_url = "https://www.gotokyo.org" + event.css("a").attribute("href").value

			
			event_doc = Nokogiri::HTML(open(event_url))
			event_doc.css("#tmp_wrap_main p")

		binding.pry
		end
	end

	def list_events
		
	end

end

# event.dates = event.css(".box_detail_ttl p").text


