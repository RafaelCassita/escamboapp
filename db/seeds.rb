# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Cadastrando as CATEGORIAS..."
categories = [  "Animais e acessórios",
				"Esporte",
				"Para a sua casa",
				"Eletronicos e celulares",
				"Música e hobbies",
				"Bebes e crianças",
				"Moda e beleza",
				"Veículos e barcos",
				"Imóveis",
				"Empregos e negócios",
				"Games e acessórios"]

categories.each do |category|
	Category.friendly.find_or_create_by(description: category)
end

puts "CATEGORIAS cadastradas!"

#############

puts "Cadastrando administrador padrão"

Admin.create!(name: "Administrador Geral",
			  email: "admin@admin.com", 
			  password: "123456", 
			  password_confirmation: "123456",
			  role: 0)

Admin.create!(name: "Administrador basico",
			  email: "basic@admin.com", 
			  password: "123456", 
			  password_confirmation: "123456",
			  role: 1)


puts "Cadastrando MEMBRO padrão"

Member.create!(email: "membro@membro.com", 
			  password: "123456", 
			  password_confirmation: "123456"
			  )

puts "Administrador cadastrado com sucesso!"