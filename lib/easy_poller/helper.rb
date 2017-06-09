module EasyPoller
  module Helper
    require 'erb'

    def easy_poller(url, poll: true, interval: 3000, **html_options)
      klasses = (html_options.delete(:class) || '').split.unshift('easy_poller').join(' ')

      parsed_html_opts = ''
      html_options.each do |key, array|
        parsed_html_opts << " #{key}=\"#{array}\""
      end
      parsed_html_opts.rstrip!

      replace = {
        html_options: parsed_html_opts,
        klasses: ERB::Util.html_escape(klasses),
        poll: ERB::Util.html_escape(poll),
        url: ERB::Util.html_escape(url),
        interval: ERB::Util.html_escape(interval)
      }

      html = %(<div%{html_options} class="%{klasses}" data-poll="%{poll}" data-interval="%{interval}" data-url="%{url}"></div>) % replace

      html.respond_to?(:html_safe) ? html.html_safe : html
    end
  end
end
