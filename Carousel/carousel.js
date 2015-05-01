(function() {
  $.Carousel = function (el) {
    this.$el = $(el);
    this.activeIdx = 0;
    this.numItems = $("li").length;
    this.clickHandlers();
  }

  $.Carousel.prototype.clickHandlers = function() {
    that = this;
    var oldActiveMoveDir
    this.$el.on("click", "a", function(event) {
      var $oldActive = $("li").eq(that.activeIdx);
      if (event.currentTarget.className === "slide-left") {
        $oldActive.addClass("right");
        that.slide(1);
        console.log("old picture index", $oldActive.index())
      } else {
        $oldActive.addClass("left");
        that.slide(-1);
        console.log("old picture index", $oldActive.index())
      }
      console.log(that.activeIdx)

      $oldActive.on("transitionend", function() {
        $oldActive.removeClass("active")
          .removeClass("right")
          .removeClass("left")
          // .removeClass(oldActiveMoveDir);
      })
    })
  };

  $.Carousel.prototype.slideLeft = function() {
    this.slide(1);
  }

  $.Carousel.prototype.slideRight = function() {
    this.slide(-1);
  }

  $.Carousel.prototype.slide = function(num) {
    this.activeIdx += num;
    this.activeIdx = this.activeIdx % this.numItems;
    if (this.activeIdx < 0) {
      this.activeIdx += this.numItems;
    }


    if (num === 1) {
      $newPic = $("li").eq(this.activeIdx)
        .addClass("active")
        .addClass("left");
        console.log("new picture index", $newPic.index())

    } else {
      $newPic = $("li").eq(this.activeIdx)
        .addClass("active")
        .addClass("right");
        console.log("new picture index", $newPic.index())
    }

    setTimeout(function() {
      $newPic.removeClass("left").removeClass("right");
    }, 0);
  }

  $.fn.carousel = function () {
    return this.each(function() {
      new $.Carousel(this);
    });
  };

})();
