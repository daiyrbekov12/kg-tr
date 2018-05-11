// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require ckeditor/init
//= require_tree .
//= require_tree ./ckeditor
//= require_self

$( document ).ready(function() {
    $(".audioButton").on("click", function() {

    $(".audio-play").each(function( ) {
      this.pause(); // Stop playing
      this.currentTime = 0; // Reset time
    });

      var $audio = $(this).siblings(".audio-play");
      $audio[0].currentTime = 0;
      return $audio[0].play();

    });

    $(".bookmark").on("ajax:success", function(e, data, status, xhr) {

      if ($(this).html() == "Save")
        $(this).html("Remove");
      else {
        $(this).html("Save");
      }

    }).on("ajax:error", function(e, xhr, status, error) {
      alert("Can not save");
      console.log("Erro");
    });


});


$(function () {
    $('#button1').on('click', function () {
        var text = $('#text');
        text.val(text.val() + 'ө');
    });
});


$(function () {
    $('#button2').on('click', function () {
        var text = $('#text');
        text.val(text.val() + 'ү');
    });
});

$(function () {
    $('#button3').on('click', function () {
        var text = $('#text');
        text.val(text.val() + 'ң');
    });
});


$(function () {
    $('#button4').on('click', function () {
        var text = $('#text');
        text.val(text.val() + 'ç');
    });
});

$(function () {
    $('#button5').on('click', function () {
        var text = $('#text');
        text.val(text.val() + 'ğ');
    });
});

$(function () {
    $('#button6').on('click', function () {
        var text = $('#text');
        text.val(text.val() + 'ı');
    });
});

$(function () {
    $('#button7').on('click', function () {
        var text = $('#text');
        text.val(text.val() + 'ö');
    });
});

$(function () {
    $('#button8').on('click', function () {
        var text = $('#text');
        text.val(text.val() + 'ş');
    });
});

$(function () {
    $('#button9').on('click', function () {
        var text = $('#text');
        text.val(text.val() + 'ü');
    });
});






















//
