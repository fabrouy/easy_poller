require "test_helper"

class TestEasyPoller < Minitest::Test
  include EasyPoller::Helper

  def setup
    @url = '/users/count'
  end

  def test_default_settings
    expected_html = '<div class="easy_poller" data-poll="true" data-interval="3000" data-url="/users/count"></div>'

    assert_equal expected_html, easy_poller(@url)
  end

  def test_poll_gets_set
    expected_html = '<div class="easy_poller" data-poll="false" data-interval="3000" data-url="/users/count"></div>'

    assert_equal expected_html, easy_poller(@url, poll: false)
  end

  def test_interval_gets_set
    expected_html = '<div class="easy_poller" data-poll="true" data-interval="5000" data-url="/users/count"></div>'

    assert_equal expected_html, easy_poller(@url, interval: 5_000)
  end

  def test_html_attributes_get_set_plus_options
    expected_html = '<div id="anything" class="easy_poller class1 class2" data-poll="true" data-interval="5000" data-url="/users/count"></div>'

    assert_equal expected_html, easy_poller(@url, interval: 5_000, id: 'anything', class: 'class1 class2')
  end

  def test_html_attributes_get_set_without_options
    expected_html = '<div id="anything" style="color: grey; width: 100px;" class="easy_poller class1 class2" data-poll="true" data-interval="3000" data-url="/users/count"></div>'

    assert_equal expected_html, easy_poller(@url, id: 'anything', class: 'class1 class2', style: 'color: grey; width: 100px;')
  end
end
