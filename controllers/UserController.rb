require_relative '../models/user.rb'

class UserController
  def save(params)
    user_params = JSON.load(params.keys[0])
    user_model = User.new
    user_model.save(user_params);
  end
end