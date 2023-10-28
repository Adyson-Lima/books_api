require 'faker'

puts 'Gerando books...'

10.times do |i|
  Book.create(
    title: ["ruby", "rspec", "rails"].sample, 
    description: Faker::Book.publisher   
    )
end

puts 'books gerados com sucesso!'