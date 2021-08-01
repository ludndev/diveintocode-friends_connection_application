
if Rails.env.development?
  User.create(firstname: "John", lastname: "Doe", username: "johndoe", password: "password")
end
