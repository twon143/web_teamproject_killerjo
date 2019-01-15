$(document).ready(function () {
   var status = true;
   
   if(status){
	   $('.content-center2').hide();
   }
   
   /*function status_change(status) {
	   if(!status) {
		   $('.content-center').show();
		   $('.content-center2').hide();
	   }else {
		   $('.content-center').hide();
		   $('.content-center2').show();
	   }
   }*/
   
   $('#viewToHeight').click(function() {
      $('.content-center').hide();
      $('.content-center2').show();
   })
   
   $('#viewToWidth').click(function() {
	  $('.content-center').show();
      $('.content-center2').hide();
   })
   

   /*$('.post-title').click(function() {
      $('#myModal').modal();
   })   */
   
})



