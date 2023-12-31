// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "popper"
import "bootstrap"

//= require jquery3
//= require popper
//= require bootstrap
//= require jquery
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

$(document).ready(function() {
    $('#price-field').on('input', function() {
        $(this).val($(this).val().replace(/[^0-9.,]/g, ''));
    });
});

const passwordField = document.getElementById('password-field');
const togglePassword = document.getElementById('toggle-password');

togglePassword.addEventListener('click', function () {
    if (passwordField.type === 'password') {
        passwordField.type = 'text';
        togglePassword.className = "fa fa-eye-slash";
    } else {
        passwordField.type = 'password';
        togglePassword.className = "fa fa-eye";
    }
});
