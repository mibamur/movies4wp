// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
// require turbolinks
// require_tree .
//= require index
//= require jquery.mobile
//= require jqm-demos
//= require dialog.build
//= require tablesaw
// require jquery.validationEngine-ru_RU
// require jquery.validationEngine
//= require jquery.validate
//= require messages_ru

//= require timeBox
//= require mobile_datebox_i18n_ru

// require highcharts/highcharts
// require highcharts/highcharts-more
// require highcharts/highstock
// require highcharts/modules/exporting
// require highcharts-data

// require highcharts/highcharts
// require highcharts/highcharts-more
// require highcharts/modules/exporting


//= require cocoon
//= require jquery.role

//= require wiselinks
//= require wise

  // $.mobile.ajaxLinksEnabled = false;
  // $('form').attr("data-ajax", "false");


    // $.widget( "mobile.flipswitch", $.extend({
    //     options: {
    //         onText: "Да",
    //         offText: "Нет",
    //     }
    // });

var ready;
ready = function() {
    $(".ui-flipswitch-off").text("Нет");
    $(".ui-flipswitch-on").text("Да");
    $( ".check1" ).flipswitch({ offText: "Нет", onText: "Да" });


    $('#radio-choice-h-2a').click(function(){
        $('#div-rashod').fadeOut("fast");//.hide("slidedown");
        $('#div-perevod').fadeOut("fast");
        $('#div-dohod').show("slideup");
    });

    $('#radio-choice-h-2b').click(function(){
        $('#div-perevod').fadeOut("fast");
        $('#div-dohod').fadeOut("fast");
        $('#div-rashod').show("slideup");
    });

    $('#radio-choice-h-2c').click(function(){
        $('#div-rashod').fadeOut("fast");
        $('#div-dohod').fadeOut("fast");
        $('#div-perevod').show("slideup");
    });

};

$(document).ready(ready);
$(document).on('page:load', ready);

$(document).on( "mobileinit", function() {
  // $.mobile.selectmenu.prototype.options.nativeMenu = false;
  $.mobile.ajaxLinksEnabled = true;
});


// $( "body" ).on( "pageinit", function() {

//     // $( "form" ).validate();

//     $(".formDRP").validate({
//        onsubmit: false
//     });

//     // Validate the form and submit programmatically:

//     if( $(".formDRP").valid() ){
//       // post validation code
//       // form.submit()

//     }

//     // $( "form" ).validate({
//     //     rules: {
//     //         email: {
//     //             required: true
//     //         },
//     //         password: {
//     //             required: true
//     //         }
//     //     },
//     //     errorPlacement: function( error, element ) {
//     //         error.insertAfter( element.parent() );
//     //     }
//     // });


//     // $( "input:checkbox" ).flipswitch({ offText: "Нет", onText: "Да" });

//     $(".ui-flipswitch-off").text("Нет");
//     $(".ui-flipswitch-on").text("Да");
//     $( ".check1" ).flipswitch({ offText: "Нет", onText: "Да" });

// });