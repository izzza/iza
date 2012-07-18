namespace :db do
  desc "Wypelnianie db testowymi uzytkownikami"
  task populate: :environment do
    admin = User.create!(name: "Iza K",
                         email: "izabel.kulak@gmail.com",
                         password: "password",
                         password_confirmation: "password")
    admin.toggle!(:admin)

  99.times do |n|
      name  = Faker::Name.name
      email = "test#{n+1}@mail.com"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end
