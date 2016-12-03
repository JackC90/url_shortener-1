class Url < ActiveRecord::Base
	validates :long_url, presence: true
	validates :long_url, :format => { :with => /\b((https?):\/\/([\w\.-]+[\.]\w+)?)([-A-Z0-9+&@#\/%?=~_|$!:,.;]*[-A-Z0-9+&@#\/%=~_|$])?/i, 
		:message => "Link is not a valid url."} 
	validates :short_url, presence: true


	def self.retrieve_short_url(long_url)
		if long_url.match(/\b((https?):\/\/([\w\.-]+[\.]\w+)?)([-A-Z0-9+&@#\/%?=~_|$!:,.;]*[-A-Z0-9+&@#\/%=~_|$])?/i)
			short_url = SecureRandom.base64[0..8]
		else
			return nil
		end
	end
end
