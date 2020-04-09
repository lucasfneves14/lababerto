class NovoCadastroMailer < ApplicationMailer
	default from: "LabAberto <contato@beeprinted.com.br>"

	def novo_cadastro_email(user, admin)
		@site = "http://52.67.230.136/solicitacoes"
		@user = user
		@admin = admin
		mail(to: @admin.email, subject: "Novo Cadastro | Laboratório Aberto de Brasília")
	end
end
