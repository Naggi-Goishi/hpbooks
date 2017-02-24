require_relative '../models/user.rb'

class UserController
  def save(params)
    user = User.new(user_params(params))
    user.save
  end

  private
  def user_params(params)
    JSON.load(params.keys[0])
  end
end
