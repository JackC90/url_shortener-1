class UrlsController < ApplicationController
	def index
		@urls = Url.all
	end

	def create
		@short_url = Url.retrieve_short_url(params[:url][:long_url])
		if !@short_url.nil?
			@url = Url.new(url_params.merge(short_url: @short_url))
			if @url.save
				redirect_to urls_path
			else
				render "new"
			end
		else
			render "new"
		end
	end

	private
	def url_params
		params.require(:url).permit(:long_url)
	end
end
