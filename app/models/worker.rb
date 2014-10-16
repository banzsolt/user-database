class Worker < ActiveRecord::Base


	attr_reader :how_important
	attr_writer :how_important

	def call_an_instance_method

		puts "testing how_important"

		data = HTTParty.get('https://api.worldoftanks.eu/wot/globalwar/provinces/?application_id=d36cb7cb571852eb22463df8524a443f&map_id=1')
		data = HTTParty.get('https://api.worldoftanks.eu/wot/globalwar/provinces/?application_id=d36cb7cb571852eb22463df8524a443f&map_id=1')

    	# self.how_important = -10
    	# self.delay(: .test3


  	end


	def test
		
		i = 0

		while i < 3  do

			data = HTTParty.get('https://api.worldoftanks.eu/wot/globalwar/provinces/?application_id=d36cb7cb571852eb22463df8524a443f&map_id=1')

			object = JSON.parse(data.body)

			puts("Inside the loop i = #{i}" )
			i +=1

			self.test2

		end

	end

	def test2

		data = HTTParty.get('https://api.worldoftanks.eu/wot/globalwar/provinces/?application_id=d36cb7cb571852eb22463df8524a443f&map_id=1')
		data = HTTParty.get('https://api.worldoftanks.eu/wot/globalwar/provinces/?application_id=d36cb7cb571852eb22463df8524a443f&map_id=1')
		data = HTTParty.get('https://api.worldoftanks.eu/wot/globalwar/provinces/?application_id=d36cb7cb571852eb22463df8524a443f&map_id=1')
		data = HTTParty.get('https://api.worldoftanks.eu/wot/globalwar/provinces/?application_id=d36cb7cb571852eb22463df8524a443f&map_id=1')
		data = HTTParty.get('https://api.worldoftanks.eu/wot/globalwar/provinces/?application_id=d36cb7cb571852eb22463df8524a443f&map_id=1')
		data = HTTParty.get('https://api.worldoftanks.eu/wot/globalwar/provinces/?application_id=d36cb7cb571852eb22463df8524a443f&map_id=1')
		data = HTTParty.get('https://api.worldoftanks.eu/wot/globalwar/provinces/?application_id=d36cb7cb571852eb22463df8524a443f&map_id=1')

		puts "Test 2 called"

		self.how_important = -10

		self.test3
		self.call_an_instance_method

	end

	def test3

		puts "Test 3 called"

		worker = Worker.new
		worker.email = "async"
		worker.save

		self.call_an_instance_method
		
	end

	def self.when_to_run

    	1.minutes.from_now

  	end

	# handle_asynchronously :test
	handle_asynchronously :test2, :queue => 'test2'
	handle_asynchronously :test3, :priority => -1, :run_at => Proc.new { when_to_run }, :queue => 'test2'
	handle_asynchronously :call_an_instance_method, :priority => Proc.new { |i| i.how_important }, :queue => 'how_important'

end
