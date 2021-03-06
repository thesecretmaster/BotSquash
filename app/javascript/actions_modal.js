$(document).on('show.bs.modal', '#actionsModal', function(e) {
  const ele = $(e.relatedTarget);
  const bot_id = ele.data('bot-id');
  const parent = $('#actionsModal').find('.actions')[0];
  // Grab an array of timeline events via AJAX
  $.post("/bots/"+bot_id+"/timeline.json", function(data) {
    const actions = data.actions;
    for (var i = 0; i < actions.length; i++) {
      render_action(actions[i], parent);
    }
  });
});

function render_action(action_json, parent) {
  parent.innerHTML = action_json.raw;
}
