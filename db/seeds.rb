User.create! name: 'Amministratore',
             email: 'admin@ilmondodisilvia.org',
             password: 'admin123',
             password_confirmation: 'admin123'

10.times do |i|
  User.create! name: Faker::Name.name,
               email: Faker::Internet.email,
               password: 'password',
               password_confirmation: 'password'
end
