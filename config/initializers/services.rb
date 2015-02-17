services = {}

services['Tasks'] = Task
services['CreatesTask'] = CreatesTask.new(services)

services['Users'] = User
services['CreatesUser'] = CreatesUser.new(services)

services['LoginUser'] = LoginUser.new(services)


Rails.application.config.services = services
