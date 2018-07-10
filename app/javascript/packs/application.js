/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

console.log('Hello World from Webpacker 1')

window.twttr = (function(d, s, id) {
var js, fjs = d.getElementsByTagName(s)[0],
t = window.twttr || {};
if (d.getElementById(id)) return t;
js = d.createElement(s);
js.id = id;
js.src = "https://platform.twitter.com/widgets.js";
fjs.parentNode.insertBefore(js, fjs);

t._e = [];
t.ready = function(f) {
t._e.push(f);
};

return t;
}(document, "script", "twitter-wjs"));

console.log("Twitter loaded");

$(document).on('show.bs.modal', '#editBotModal', function(e) {
  var ele = $(e.relatedTarget);
  var username = ele.data('username');
  var type_id = ele.data('type-id');
  var bot_id = ele.data('bot-id');
  $("#editBotModal form input[name=bot\\[username\\]]").val(username);
  $("#editBotModal form select[name=bot\\[type_id\\]]").val(type_id);
  $("#editBotModal form input[name=id]").val(bot_id);
});

$("#editBotModalForm").on('ajax:success', function(e, data, status, xhr){
  var username = $("#editBotModal form input[name=bot\\[username\\]]").val();
  var id = $("#editBotModal form input[name=id]").val();
  $("span[data-bot-id="+id+"]").text(username);
});

// TODO: This function is wrong. It should be called as a callback to the form submission
$(document).on('hide.bs.modal', '#editBotModal', function(e) {
  var username = $("#editBotModal form input[name=bot\\[username\\]]").val();
  var id = $("#editBotModal form input[name=id]").val();
  $("span[data-bot-id="+id+"]").text(username);
});

$(document).on('show.bs.modal', '#botInfoModal', function(e) {
  var ele = $(e.relatedTarget);
  var username = ele.data('username');
  var bot_id = ele.data('bot-id');
  var twitter_username = ele.data('twttr');
  $("#botInfoModal .username").text(username);
  // TODO: Fetch further bot info async
  twttr.widgets.createTimeline(
    {
      sourceType: "profile",
      screenName: twitter_username
    },
    document.getElementById("botInfoModal").getElementsByClassName("tweet-container")[0]
  );
})

// TODO: On form submission, add the hashtag to the page
$(document).on('show.bs.modal', '#newHashtagModal', function(e) {
  var ele = $(e.relatedTarget);
  var bot_id = ele.data('bot-id');
  console.log(bot_id);
  $("#newHashtagModal form input[name=id]").val(bot_id);
});

// TODO: On form submission, add the network membership to the page
$(document).on('show.bs.modal', '#newNetworkMembershipModal', function(e) {
  var ele = $(e.relatedTarget);
  var bot_id = ele.data('bot-id');
  console.log(bot_id);
  $("#newNetworkMembershipModal form input[name=id]").val(bot_id);
});

$(document).on('show.bs.modal', '#hashtagModal', function(e) {
  var ele = $(e.relatedTarget);
  console.log($("#hashtagModal .id"));
  var id = ele.data('id');
  var name = ele.data('name');
  $("#hashtagModal span.id").text(id);
  $("#hashtagModal span.name").text(name);
});

$(document).on('show.bs.modal', '#networkModal', function(e) {
  var ele = $(e.relatedTarget);
  console.log(ele);
  var id = ele.data('id');
  var name = ele.data('name');
  $("#networkModal span.id").text(id);
  $("#networkModal span.name").text(name);
});
