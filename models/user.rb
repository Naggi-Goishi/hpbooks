require 'bcrypt'
require_relative '../db/db_model'

class User < DB_Model
  def save(params)
    params = params.keys_to_sym
    params[:password] = encrypt_password(params[:password])
    super('users', params)
  end

  private
  def encrypt_password(password)
     BCrypt::Password.create(password)
  end
end