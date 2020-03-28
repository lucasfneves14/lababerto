class LiberacaoMailer < ApplicationMailer
	default from: "LabAberto <contato@beeprinted.com.br>"

	def liberacao_email(user)
		@site = "http://18.230.17.83"
		@user = user
		mail(to: @user.email, subject: "Acesso Liberado | Laboratório Aberto de Brasília")
	end
end
