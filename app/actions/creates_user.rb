class CreatesUser < Struct.new(:services)

  def create params: {}
    services['Users'].create params
  end
end
