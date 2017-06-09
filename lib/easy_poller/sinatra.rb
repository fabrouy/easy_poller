require "sinatra/base"

class Sinatra::Base
  helpers EasyPoller::Helper
end
