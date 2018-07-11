class Contact < MailForm::Base
	attribute :vardas, validate: true
	attribute :el_paštas, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
	attribute :žinutė, validate: true
	attribute :telefonas, validate: true

	def headers 
		{
			:subject => "Message from Contact form",
			:to => "mediusgroupproject@gmail.com",
			:from => %("#{vardas}" <#{el_paštas}>)
		}
	end
end