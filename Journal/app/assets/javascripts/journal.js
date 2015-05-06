window.Journal = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var $el = $('.journal');
    new Journal.Routers.PostsRouter({ $rootEl: $el});
    Backbone.history.start();
  }
};

$(document).ready(function(){
  Journal.initialize();
});
