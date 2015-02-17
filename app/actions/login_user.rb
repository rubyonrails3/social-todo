class LoginUser < Struct.new(:services)

  def login params: {}
    services['Users'].find_by!(email: params[:email]).try(:authenticate, params[:password])
  end
end
