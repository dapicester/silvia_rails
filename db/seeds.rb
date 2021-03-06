admin = User.create! name: 'Amministratore',
             email: 'admin@ilmondodisilvia.org',
             password: 'admin123',
             password_confirmation: 'admin123',
             admin: true,
             activated: true,
             activated_at: Time.zone.now
puts "Created user: #{admin.name}"

10.times do |i|
  user = User.create! name: Faker::Name.name,
               email: Faker::Internet.email,
               password: 'password',
               password_confirmation: 'password',
               activated: true,
               activated_at: Time.zone.now
  puts "Created user: #{user.name}"
end

users = User.order(:created_at).take 6
50.times do
  content = Faker::Lorem.sentence 5
  users.each { |user| user.microposts.create! content: content }
  puts "Created micropost"
end
