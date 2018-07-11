$(document).on('show.bs.modal', '#editBotModal', function(e) {
  const ele = $(e.relatedTarget);
  $("#editBotModalForm")[0].reset();
  const username = ele.data('username');
  const type_id = ele.data('type-id');
  const bot_id = ele.data('bot-id');
  $("#editBotModal form input[name=bot\\[username\\]]").val(username);
  $("#editBotModal form select[name=bot\\[type_id\\]]").val(type_id);
  $("#editBotModal form input[name=id]").val(bot_id);
});

$(document).on('ajax:success', "#editBotModalForm", function(e, data){
  const username = $("#editBotModal form input[name=bot\\[username\\]]").val();
  const id = $("#editBotModal form input[name=id]").val();
  const span = $("td:nth-child(1) span[data-bot-id="+id+"]");
  span.text(data.username);
  span.removeClass(/(text-\w+)/i.exec(span[0].className)[1]).addClass(data.color_class);
  $("#editBotModal").modal('hide');
});

$(document).on('show.bs.modal', '#botInfoModal', function(e) {
  const ele = $(e.relatedTarget);
  const username = ele.data('username');
  const type = ele.data('type');
  const bot_id = ele.data('bot-id');
  const twitter_username = ele.data('twttr');
  $("#botInfoModal .username").text(username);
  $("#botInfoModal .type").text(type);
  // TODO: Fetch further bot info async
  try {
    twttr.widgets.createTimeline({
      sourceType: "profile",
      screenName: twitter_username
    }, document.getElementById("botInfoModal").getElementsByClassName("tweet-container")[0]).then(function(){
      // This could be simpler maybe. If only I knew what handleUpdate really did...
      window.requestAnimationFrame(function(){
        $('#botInfoModal').modal('handleUpdate');console.log("done");
      })
    });
  } catch(err) {
    console.log(err);
  }
});

$(document).on('hidden.bs.modal', '#botInfoModal', function(e) {
  // Could be more proformant as per here: https://stackoverflow.com/a/3450726
  document.getElementById("botInfoModal").getElementsByClassName("tweet-container")[0].innerHTML = '';
});

$(document).on('show.bs.modal', '#newHashtagModal', function(e) {
  const ele = $(e.relatedTarget);
  $("#newHashtagModalForm")[0].reset();
  const bot_id = ele.data('bot-id');
  $("#newHashtagModal form input[name=bot\\[id\\]]").val(bot_id);
});

$(document).on('ajax:success', "#newHashtagModalForm", function(e, data, status, xhr){
  const newEle = $.parseHTML(data.elements);
  const bot_id = $("#newHashtagModal form input[name=bot\\[id\\]]").val();
  $("tr[data-bot-id="+bot_id+"] td:nth-child(2) span.id-list").append(newEle);
  $("#newHashtagModal").modal('hide');
  $('#newHashtagModal form select[name=hashtag\\[id\\]]').append($('<option>', {
    value: data.id,
    text: data.name
  }));
});

$(document).on('show.bs.modal', '#newNetworkMembershipModal', function(e) {
  const ele = $(e.relatedTarget);
  $("#newNetworkMembershipModalForm")[0].reset();
  const bot_id = ele.data('bot-id');
  $("#newNetworkMembershipModal form input[name=bot\\[id\\]]").val(bot_id);
});

$(document).on('ajax:success', "#newNetworkMembershipModalForm", function(e, data){
  const newEle = $.parseHTML(data.elements);
  const bot_id = $("#newNetworkMembershipModal form input[name=bot\\[id\\]]").val();
  $("tr[data-bot-id="+bot_id+"] td:nth-child(3) span.id-list").append(newEle);
  $("#newNetworkMembershipModal").modal('hide');
  $('#newNetworkMembershipModal form select[name=network\\[id\\]]').append($('<option>', {
    value: data.id,
    text: data.name
  }));
});

$(document).on('show.bs.modal', '#hashtagModal', function(e) {
  const ele = $(e.relatedTarget);
  const id = ele.data('id');
  const name = ele.data('name');
  $("#hashtagModal span.id").text(id);
  $("#hashtagModal span.name").text(name);
});

$(document).on('show.bs.modal', '#networkModal', function(e) {
  const ele = $(e.relatedTarget);
  const id = ele.data('id');
  const name = ele.data('name');
  $("#networkModal span.id").text(id);
  $("#networkModal span.name").text(name);
});
