NewsReader.Collections.Entries = Backbone.Collection.extend({
  initialize: function (models, options) {
    this.feed = options.feed;
  },

  comparator: function(entry) {
    var published_at = new Date(entry.get('published_at'));
    return -(published_at.getTime());
  },

  url: function() {
    return this.feed.url() + '/entries'
  },

  model: NewsReader.Models.Entry

});
