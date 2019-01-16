// 프로필 js파일

   /**
      var userBackgroundImageUpload = function() {
         var additionalData = {};
         actWithFile('.profile-background-form',
               '/r/profile_background_update', '수정', additionalData,
               false, function(res) {
                  if (res.code == 403) {
                     act403(res);
                  }
                  if (res.code == 200) {
                     _alert('수정하였습니다.', 'green');
                  } else {
                     _alert(res.message, 'red');
                  }
               });
      };
      var originUserBackgroundImageUrl = 'https://devsnote.com/assets/data/profile_background/158_61dfeeb361274ae53dac51ccfc3a06a0.jpg?u=1547530456';
   **/

      $(".user-background-image-file-upload").on('change', function() {
         readURL(this);
      });
      $(".user-background-image-btn").on('click', function() {
         $(".user-background-image-file-upload").click();
      });
      var readURL = function(input) {
         if (input.files && input.files[0]) {
            var reader = new FileReader();

            if (input.files[0].size > 5242880) {
               _alert('5MB 이하 크기의 이미지만 사용 가능합니다.', 'red');
               return;
            }
            reader.onload = function(e) {
               $('.user-profile').css(
                     'background-image',
                     'linear-gradient( rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3) ), url('
                           + e.target.result + ')');
            }
            reader.readAsDataURL(input.files[0]);
            /**
            _confirm("이 이미지로 설정하시겠습니까?", '네, 설정하겠습니다.', '취소', {
               buttons : {
                  confirm : {
                     text : '네, 설정하겠습니다.',
                     btnClass : 'btn-blue',
                     keys : [ 'enter' ],
                     action : function() {
                        userBackgroundImageUpload();
                     }
                  },
                  cancel : {
                     text : '취소',
                     keys : [ 'esc' ],
                     action : function() {
                        $('.user-profile').css(
                              'background-image',
                              'linear-gradient( rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3) ), url('
                                    + originUserBackgroundImageUrl
                                    + ')');
                     }
                  }
               }
            });
            **/
         }
      }
      /**
      document.getElementById("menu_images").onchange = function() {
         var reader = new FileReader();
         if (this.files[0].size > 528385) {
            alert("Image Size should not be greater than 500Kb");
            $("#menu_image").attr("src", "blank");
            $("#menu_image").hide();
            $('#menu_images').wrap('<form>').closest('form').get(0).reset();
            $('#menu_images').unwrap();
            return false;
         }
         if (this.files[0].type.indexOf("image") == -1) {
            alert("Invalid Type");
            $("#menu_image").attr("src", "blank");
            $("#menu_image").hide();
            $('#menu_images').wrap('<form>').closest('form').get(0).reset();
            $('#menu_images').unwrap();
            return false;
         }
         reader.onload = function(e) {
            // get loaded data and render thumbnail.
            document.getElementById("menu_image").src = e.target.result;
            $("#menu_image").show();
         };

         // read the image file as a data URL.
         reader.readAsDataURL(this.files[0]);
      };
      **/