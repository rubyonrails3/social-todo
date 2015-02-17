class CreatesTask < Struct.new(:services)

  def create current_user: nil, params: {}
    services['Tasks'].create params
  end
end
