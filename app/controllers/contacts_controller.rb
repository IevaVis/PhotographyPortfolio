class ContactsController < ApplicationController

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(params[:contact])
		@contact.request = request
		if @contact.deliver
			flash.now[:notice] = "Ačiū už žinutę! Susisieksiu su Jumis artimiausiu metu."
		else
			flash.now[:error] = "Žinutės išsiųsti nepavyko. Užpildykite visus laukelius ir bandykite siųsti dar kartą."
			render :new
		end
	end
end

