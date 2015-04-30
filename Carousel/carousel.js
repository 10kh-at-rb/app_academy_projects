(function() {
  $.Carousel = function (el) {
    this.$el = $(el);
    this.activeIdx = 0;
    this.numItems = $("li").length;
    this.clickHandlers();
  }

  $.Carousel.prototype.clickHandlers = function() {
    that = this;
    this.$el.on("click", "a", function(event) {

      $("li").eq(that.activeIdx).removeClass("active");
      if (event.currentTarget.currentName === "slide-left") {
        that.activeIdx--
      } else {
        that.activeIdx++
      }
      that.activeIdx = that.activeIdx % that.numItems;
      if (that.activeIdx < 0) {
        that.activeIdx += that.numItems;
      }
      $("li").eq(that.activeIdx).addClass("active");

    })
  };

  $.Carousel.prototype.slide = function(dir) {

  }

  $.fn.carousel = function () {
    return this.each(function() {
      new $.Carousel(this);
    });
  };

})();
