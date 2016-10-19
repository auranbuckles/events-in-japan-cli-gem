class TokyoEvents::CLI

	def run
		list_events
		choose_event
	end

	def list_events
		puts "============ Upcoming events this month ============"
		TokyoEvents::Event.all.each.with_index(1) do |event, i|
			puts "#{i}. #{event.name} - #{event.dates}"
		end
	end

	def choose_event
		puts "Which event would you like more info on?"
	end

	def show_event(event)
		puts "------------ #{event.name} ------------"
		puts ""
		puts "Date(s): #{event.dates}"
		puts "Location: #{event.location}"
		puts "Description: #{event.description}"
		puts "Link: #{event.url}"
		puts ""
	end

	def goodbye
		puts "Goodbye!"
	end

end