class User < ApplicationRecord
  has_secure_password

  has_many :saved_dogs

  email_regex = /\A([\w+-].?)+@[a-z\d-]+(.[a-z]+)*.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: email_regex }
  validates :first_name, :last_name, presence:true 
  validates :first_name, :last_name, length:{minimum:2, message:"must be at least 2 characters"}
  validates :password, length: {minimum: 5, message: "must be at least 5 characters"}, on: :create
end
