$(document).ready(function () {
   var status = true;
   
   if(status) {
      $('.content-center2').hide();
   }
   
   $('#viewToHeight').click(function() {
      $('.content-center').hide();
      $('.content-center2').show();
   })
   
   $('#viewToWidth').click(function() {
      $('.content-center2').hide();
      $('.content-center').show();
      
   })
   
   

   $('.post-title').click(function() {
      $('#myModal').modal();
   })   

   
   
   
   
})



