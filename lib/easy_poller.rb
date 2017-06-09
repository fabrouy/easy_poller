require "easy_poller/version"
require "easy_poller/helper"
require "easy_poller/rails" if defined?(Rails)
require "easy_poller/sinatra" if defined?(Sinatra)

module EasyPoller
end
