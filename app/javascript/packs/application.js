/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

console.log('Hello World from Webpacker 1')

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
// $(document).on('hide.bs.modal', '#editBotModal', function(e) {
//   var username = $("#editBotModal form input[name=bot\\[username\\]]").val();
//   var id = $("#editBotModal form input[name=id]").val();
//   $("span[data-bot-id="+id+"]").text(username);
// });

$(document).on('show.bs.modal', '#botInfoModal', function(e) {
  var ele = $(e.relatedTarget);
  var username = ele.data('username');
  var bot_id = ele.data('bot-id');
  $("#botInfoModal .username").text(username);
  // TODO: Fetch further bot info async
  // Maybe a window from the twitter API
})
