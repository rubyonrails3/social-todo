class CreatesTask < Struct.new(:services)

  def create current_user:, params: {}
    current_user.tasks.create! params
  end
end
