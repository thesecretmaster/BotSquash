import {} from 'jquery-ujs';

import '../form_polyfill.js';
import '../twitter.js';
import '../modals.js';
import '../actions_modal.js';

$(() => {
  $('.js-modal-trigger').attr('href', '#');

  $('.ta-hashtag').select2({
    tags: true,
    ajax: {
      url: '/hashtags/query',
      dataType: 'json'
    },
    width: '100%',
    theme: 'bootstrap'
  });

  $('.ta-network').select2({
    tags: true,
    ajax: {
      url: '/networks/query',
      dataType: 'json'
    },
    width: '100%',
    theme: 'bootstrap'
  });
});
