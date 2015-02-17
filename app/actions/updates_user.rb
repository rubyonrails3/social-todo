class UpdatesUser < Struct.new(:services)

  def update current_user:, params: {}
    current_user.update! params
  end
end
