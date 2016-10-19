class TokyoEvents::CLI

	def run
		TokyoEvents::Scraper.new.scrape_and_create_events
		list_events
		choose_event
	end

	def list_events
		puts ""
		puts "============ Upcoming events ============"
		puts ""
		TokyoEvents::Event.all.each.with_index(1) do |event, i|
			puts "#{i}. #{event.name} - #{event.dates}"
		end
		puts ""
		puts "========================================="
		puts ""
	end

	def choose_event
		input = nil
		while input != "exit"
			puts ""
			puts "Which event would you like to learn more about?"
			puts ""
			puts "Enter an index number to view details of a specific event."
			puts "Enter list to see all the events again."
			puts "Enter exit to exit the program."
			puts ""
			input = gets.strip
		end
		goodbye
	end

	def show_event(event)
		puts "------------ #{event.name} ------------"
		puts ""
		puts "Date(s): #{event.dates}"
		puts "Location: #{event.location}"
		puts "Link: #{event.url}"
		puts ""
		puts "------------ Description ------------"
		puts "#{event.description}"
	end

	def goodbye
		puts "Goodbye!"
	end

end