// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "popper"
import "bootstrap"

//= require jquery3
//= require popper
//= require bootstrap
//= require jquery_ujs
//= require bootstrap-datepicker/core
//= require_tree .

$(document).on('turbolinks:load', function() {
    $('#check_in_datepicker').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });

    $('#check_out_datepicker').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });
});
