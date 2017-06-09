if Rails.version >= "3.1"
  require "easy_poller/engine"
else
  ActionView::Base.send :include, EasyPoller::Helper
end
