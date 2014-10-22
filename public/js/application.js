$(document).ready(function() {

  $(document).on('submit','#posts',function(e){
    e.preventDefault();
    var $form = $('#posts');
    var data = $form.serialize();
    $.ajax({
      url: '/events',
      type: 'post',
      data: data,
      success: function(r) {
        $('.container').append(r);
        $form[0].reset();
      },
      error: function(r) {
        alert('Get on like ya been spit on!');
      }
    });
  });