namespace :utils do


	desc "Setup Development"
	task setup: :environment do
		images_path = Rails.root.join('public', 'system')

		puts "executando setup"

		%x(rake db:drop)
		puts "Apagando imagens #{%x(rm -rf #(images_path))}"
		%x(rake db:create)
		%x(rake db:migrate)
		%x(rake db:seed)
		puts %x(rake utils:generate_members)
		puts %x(rake utils:generate_ads)
		puts %x(rake utils:generate_comments)
		
		puts "setup executado"
	end

#############

	desc "Cria membros fake"
	task generate_members: :environment do
		puts "Cadastrando MEMBROS..."

		100.times do
			Member.create!(
				email: Faker::Internet.email,
				password: "123456",
				password_confirmation: "123456",
				)
		end

		puts "membros cadastrados com sucesso!"
	end

##############

	desc "Cria anuncios fake"
	task generate_ads: :environment do
		puts "Cadastrando ANÚNCIOS..."

		5.times do 
			Ad.create!(
				title: Faker::Lorem.sentence([2,3,4,5].sample),
				description_md: LeroleroGenerator.paragraph([1,2,3].sample),
				description_short: Faker::Lorem.sentence([2,3].sample),
				member: Member.first,
				category: Category.all.sample,
				price: "#{Random.rand(500)},#{Random.rand(99)}",
				finish_date: Date.today + Random.rand(90),
				picture:File.new(Rails.root.join('public', 'templates', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')
				)

		end
		100.times do
			Ad.create!(
				title: Faker::Lorem.sentence([2,3,4,5].sample),
				description_md: LeroleroGenerator.paragraph([1,2,3].sample),
				description_short: Faker::Lorem.sentence([2,3].sample),
				member: Member.all.sample,
				category: Category.all.sample,
				price: "#{Random.rand(500)},#{Random.rand(99)}",
				finish_date: Date.today + Random.rand(90),
				picture:File.new(Rails.root.join('public', 'templates', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')
				)
		end

		puts "Anúncios cadastrados com sucesso!"
	end

	desc "Cria Comentários fake"
	task generate_comments: :environment do
		puts "Cadastrando Comentários..."

		Ad.all.each do |ad|
			(Random.rand(3)).times do
				Comment.create!(
					body: Faker::Lorem.paragraph([1,2,3].sample),
					member: Member.all.sample,
					ad: ad
				)
			end
		end
		puts "Comentarios cadastrados com sucesso!"
	end



	
end
