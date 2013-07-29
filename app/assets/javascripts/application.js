// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require_tree


function runMasonry(){
    $('#lists').masonry({
     itemSelector: '.list_box',
     gutter: 20
    });
  }


function runAccordion(){
  $( ".accordion" ).accordion({
    active: false,
    navigation: false,
    collapsible: true,
    create: function(event, ui) { $("#accordion").show(); }
    });
}

function runSortable(){
   $('.sortable').sortable({
    stop: function(event, ui) {
      $(ui.item).effect("highlight");
      var item_id = $(ui.item).attr('id').replace(/[^\d]+/g, '');
      var position = ui.item.prevAll().length;
      $.post('/to_do_items/' + item_id + '/update_position', {
        'position': position
       });
      $(ui.item).effect("highlight");
     }
  });
}

function runConnectedSortable(){
  $( ".connectedSortable" ).sortable({
  connectWith: ".connectedSortable",
   stop: function(event, ui) {
    $(ui.item).effect("highlight");
     runMasonry();
    var item_id = ui.item.data("item_id");
    var position = ui.item.index();
    var new_list = ui.item.parent().data("list_id");
    $.post('/to_do_items/' + item_id + '/update_list_and_position', {
      'position': position,
      'new_list': new_list
      });
      $(ui.item).effect("highlight");
      }
  }).disableSelection();

};

function searchBar(){
    $('.search_bar_entry_field').on('keyup', function(){
     $('#search_form_for').submit();
     });


}




//document is ready
$(function() {




    runAccordion();
    runMasonry();
    runConnectedSortable();
    searchBar();









  });



