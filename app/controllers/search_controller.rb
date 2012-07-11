class SearchController < ApplicationController

	def search
   		if params[:scope] == "User"
   			redirect_to users_path(utf8: params[:utf8], search: params[:search])
    	elsif params[:scope] == "Event"
    		redirect_to events_path(utf8: params[:utf8], search: params[:search])
    	elsif params[:scope] == "Narrative"
    		redirect_to narratives_path(utf8: params[:utf8], search: params[:search])
    	end
    end
end