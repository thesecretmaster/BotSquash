// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

console.log("WOrking");
$("#editBotModal").modal('show.bs.modal', function(e){
  var username = e.relatedTarget.data('username');
  console.log(username);
  $("#editBotModal form input[name=username]").value = username;
})
