class EventsInJapan::CLI

	def run
		show_events
		choose_event
	end

	def show_events
		puts "Upcoming events in Japan:"
	end

	def choose_event
		puts "Which event would you like more info on?"
		input = gets.strip
	end

end