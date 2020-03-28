class NovoCadastroMailer < ApplicationMailer
	default from: "contato@beeprinted.com.br"

	def novo_contato_email(user, admin)
		@site = "http://18.230.17.83"
		@user = user
		@admin = admin
		mail(to: @admin.email, subject: "Novo Cadastro | Laboratório Aberto de Brasília")
	end
end
