require 'open-uri'
require 'pry'

class TokyoEvents::Event

	attr_accessor :name, :dates, :location, :description, :url

	@@all = []

	def initialize(params = {})
		@name = params[:name]
		@dates = params[:dates]
		@url = params[:url]

		@@all << self
	end

	def self.new_from_index_page(event)
		self.new({
			name: event.css("a").text,
			dates: event.css(".box_detail_ttl p").text,
			url: "https://www.gotokyo.org" + event.css("a").attribute("href").value
		})
	end

	def location
		location_string = doc.css("#tmp_info_detail tr:first-child td").text
		@location ||= location_string.gsub("\n\n", "").gsub("\n", ", ").gsub(/,,|,\s,/, ",")
	end

	def description
		@description ||= doc.css(".box_photo + p").text
	end

	def self.all
		@@all
	end

	def self.find(id)
    self.all[id]
  end

   def self.find_by_name(name)
    self.all.select do |event|
      event.name.downcase.strip.include?(name.downcase.strip)
    end
  end

	def doc
		@doc ||= Nokogiri::HTML(open(self.url))
	end

end

