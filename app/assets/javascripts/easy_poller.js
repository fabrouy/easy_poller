$.widget("nmk.easyPoller", {

    options: {
      loadingMessage: 'Loading...'
    },

    _create: function() {
      if (this.element.data('poll') === true) {
        this.start();
      }
    },

    start: function() {
      this.element.html(this.options.loadingMessage);
      var $wid = this;

      var $element = this.element;

      $wid._request($element);

      intId = setInterval(function() {
        $wid._request($element);
      }, this._interval());

      this.intervalId = intId;
    },

    stop: function() {
      clearInterval(this.intervalId);
    },

    _url: function() {
      return this.element.data("url");
    },

    _interval: function() {
      return this.element.data("interval");
    },

    _replace: function(content) {
      return this.element.html(content);
    },

    _request: function(element) {
      var $widget = this;

      $.ajax({
        url: this._url()
      }).always((function(_this) {
        return function(data, textStatus, jqXHR) {
          if (jqXHR.status === 200) {
            return $widget._replace(data);
          }
        };
      })(this));
    },

    _setOption: function(key, value) {
      this.options[key] = value;
    }

});

$(function() {
  return $(".easy_poller").each(function(i, div) {
    return $(div).easyPoller();
  });
});
