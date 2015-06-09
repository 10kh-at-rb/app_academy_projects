(function() {
  $.Carousel = function (el) {
    this.$el = $(el);
    this.activeIdx = 0;
    this.numItems = $("li").length;

    this.$el.on("click", "a.slide-left", this.slideLeft.bind(this));
    this.$el.on("click", "a.slide-right", this.slideRight.bind(this));
    // this.clickHandlers();
  }

  // $.Carousel.prototype.clickHandlers = function() {
  //   that = this;
  //   var oldActiveMoveDir
  //   this.$el.on("click", "a", function(event) {
  //     var $oldActive = $("li").eq(that.activeIdx);
  //     if (event.currentTarget.className === "slide-left") {
  //       $oldActive.addClass("right");
  //       that.slideLeft;
  //       console.log("old picture index", $oldActive.index())
  //     } else {
  //       $
  //       that.slideRight;
  //       console.log("old picture index", $oldActive.index())
  //     }
  //     console.log(that.activeIdx)
  //
  //
  //   })
  // };

  $.Carousel.prototype.slideLeft = function() {
    this.slide(1);
  }

  $.Carousel.prototype.slideRight = function() {
    this.slide(-1);
  }

  $.Carousel.prototype.slide = function(num) {
    var $oldActive = $("li").eq(this.activeIdx);
    this.activeIdx = (this.activeIdx += num + this.numItems) % this.numItems;

    if (num === 1) {
      $newPic = $("li").eq(this.activeIdx).addClass("active left");
      $oldActive.addClass("right");
    } else {
      $newPic = $("li").eq(this.activeIdx).addClass("active right")
      $oldActive.addClass("left");
    }

    setTimeout(function() {
      $newPic.removeClass("left").removeClass("right");
    }, 0);

    $oldActive.one("transitionend", function() {
      $oldActive.removeClass("active")
        .removeClass("right")
        .removeClass("left");
    })
  }

  $.fn.carousel = function () {
    return this.each(function() {
      new $.Carousel(this);
    });
  };

})();
