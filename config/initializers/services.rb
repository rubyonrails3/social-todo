services = {}

services['Tasks'] = Task
services['CreatesTask'] = CreatesTask.new(services)


Rails.application.config.services = services
