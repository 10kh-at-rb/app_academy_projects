window.NewsReader = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var $rootEl = $("#content")
    new NewsReader.Routers.FeedRouter({ $rootEl: $rootEl });
    Backbone.history.start();
  }
};

$(document).ready(function(){
  NewsReader.initialize();
});
