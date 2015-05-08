window.TrelloClone = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var $rootEl = $("#main");
    new TrelloClone.Routers.Router({$rootEl: $rootEl});
    Backbone.history.start();
  }
};

$(document).ready(function(){
  TrelloClone.initialize();
});
