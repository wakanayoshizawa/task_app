(function () {
  document.addEventListener('DOMContentLoaded', function() {
    const btn = document.getElementById('dropdown__btn');
    if(btn) {
      btn.addEventListener('click', function(){
        this.classList.toggle('is-open');
      });
    }
  });
}());


jQuery(function($){
  $('.ooo').click(function(){
      if(!$(this).hasClass('on')){
          $(this).addClass('on');
          var txt = $(this).text();
          $(this).html('<input type="text" value="'+txt+'" />');
          $('.ooo > input').focus().blur(function(){
              var inputVal = $(this).val();
              if(inputVal===''){
                  inputVal = this.defaultValue;
              };
              $(this).parent().removeClass('on').text(inputVal);
          });
      };
  });
});

$(function () {
  $('.js-edit-comment-button').on("click", function () {              
    const commentId = $(this).data('comment-id');                  
    const commentLabelArea = $('#js-comment-label-' + commentId);   
    const commentTextArea = $('#js-textarea-comment-' + commentId); 
    const commentButton = $('#js-comment-button-' + commentId);    

    commentLabelArea.hide(); 
    commentTextArea.show(); 
    commentButton.show();    
  });
});