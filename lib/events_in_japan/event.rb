require 'open-uri'
require 'pry'

class EventsInJapan::Event

	def self.scrape_events
		doc = Nokogiri::HTML(open("http://www.jnto.go.jp/special_events/eng/index.php?month=10&year=2016&category=200"))

		events = []
		doc.css("tr").each_with_index do |event, index|
			if index != 0
				event.css("td").each_with_index do |info, index|
					if index == 1
						events[:name] = info.css("strong").text
						if info.text.match(/\d+\/\d+\/\d+/)
							start_end_dates = info.text.scan(/\d+\/\d+\/\d+/)
							events[:dates] = start_end_dates.join(" - ")
						elsif info.text.match(/January|February|March|April|May|June|July|August|September|October|November|December/)
							start_end_dates = info.text.scan(/January|February|March|April|May\s\d+.{2}|June|July|August|September|October\s\d+.{2}|November|December\s\d+.{2}/)
							events[:dates] = start_end_dates.join(" - ")
						end
						events[:description] = info.text.strip
						events[:url] = info.css("a").attribute("href").value
					elsif index == 2
						events[:location] = info.css("a").text.gsub(/\s+/, "")
					end
				end
			end
		end

		events
	end

end