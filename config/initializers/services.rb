services = {}

services['Tasks'] = Task
services['CreatesTask'] = CreatesTask.new(services)

services['Users'] = User
services['CreatesUser'] = CreatesUser.new(services)
services['UpdatesUser'] = UpdatesUser.new(services)

services['LoginUser'] = LoginUser.new(services)
services['LogoutUser'] = LogoutUser.new(services)


Rails.application.config.services = services
