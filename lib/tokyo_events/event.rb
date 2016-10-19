require 'open-uri'
require 'pry'

class TokyoEvents::Event

	attr_accessor :name, :dates, :location, :description, :url

	@@all = []

	def self.all
		@@all
	end

	def doc
		@doc ||= Nokogiri::HTML(open(self.url))
	end

	def self.scrape_and_create_events
		doc = Nokogiri::HTML(open("https://www.gotokyo.org/eventlist/en/list"))

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

