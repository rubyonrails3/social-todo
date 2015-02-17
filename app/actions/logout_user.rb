class LogoutUser < Struct.new(:services)

  def logout current_user:
    current_user.regenerate_auth_token
    current_user
  end
end
