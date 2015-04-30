(function() {
  $.Tabs = function (el) {
    this.$el = $(el);
    this.bindClick();
    var contentClass = this.$el.attr("data-content-tabs");
    this.$contentTabs = $(contentClass);
    this.$activeTab = $(".active")
  };

  $.Tabs.prototype.bindClick = function() {
  this.$el.on("click", "a", this.showArticle.bind(this));
  };


  $.Tabs.prototype.showArticle = function(event) {
    event.preventDefault();
    var $oldActive = this.$activeTab;
    $oldActive.removeClass("active").addClass("transition");
    this.$el.find(".selected").removeClass("selected");
    $(event.currentTarget).addClass("selected");
    this.$activeTab = $("." + event.target.hash.slice(1));

    var $active = this.$activeTab
    $oldActive.one("transitionend", function(event) {
      $oldActive.removeClass("transition");
      $active.addClass("transition").addClass("active");
      setTimeout(function() {
        $active.removeClass("transition");
      }, 0)
    })
  };









$.fn.tabs = function () {
  return this.each(function() {
    new $.Tabs(this);
  });
};

})();
