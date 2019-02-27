// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require datetimepicker

$(document).on('ready turbolinks:load', ready);

function ready() {
  initializeBootstrapDependencies();
  initializeDateTimePicker();
  setCurrentLinkMenuSelectorToActive();
}

function initializeBootstrapDependencies() {
  $('[data-toggle=tooltip]').tooltip();
  $('[data-toggle=popover]').popover();
  $('[data-toggle=popover-with-html]').popover({html: true});
}

function initializeDateTimePicker() {
  $.datetimepicker.setLocale('fr');
  $('.datetimepicker').datetimepicker({
    format: 'd/m/Y H:i'
  });
};

function setCurrentLinkMenuSelectorToActive() {
  let currentActiveLinkMenuSelector = $('a[href="' + window.location.pathname + '"]');
  currentActiveLinkMenuSelector.addClass('active');
  currentActiveLinkMenuSelector.closest('.theme-menu-item').addClass('active');
}
