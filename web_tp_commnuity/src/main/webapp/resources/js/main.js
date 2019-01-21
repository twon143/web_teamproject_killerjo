$(document).ready(
		function() {
			/*var status = true;

			if (status) {
				$('.content-center2').hide();
			}

			$('#viewToHeight').click(function() {
				$('.content-center').hide();
				$('.content-center2').show();
			})

			$('#viewToWidth').click(function() {
				$('.content-center2').hide();
				$('.content-center').show();

			})*/

			/* navbar */
			/*$('.post-title').click(function() {
				$('#myModal').modal();
			});*/
			
			$('ul.nav li.dropdown').hover(
					function() {
						$(this).find('.dropdown-menu').stop(true, true).delay(
								100).fadeIn(500);

					},
					function() {

						$(this).find('.dropdown-menu').stop(true, true).delay(
								100).fadeOut(500);

					});

			/* contents-left-grip */
			$(function hideInit() {
				$('.grip').on({
					mouseenter : menter,
					mouseleave : mleave
				});
				function menter() {
				}
				function mleave() {
				}
				$('.grip').on('click', function() {
					if ($('.left').hasClass('on')) {
						console.log('detected');
						$('.left').removeClass('on');
						$('.left').addClass('off');
						$('.list-group-item').css({
							display : 'none'
						});
						$('.left').css({
							width : 0,
							backgroundColor : 'none',
							background : 'none'
						});
						$('.grip').css({
							left : 0
						});
					} else if ($('.left').hasClass('off')) {
						$('.left').removeClass('off');
						$('.left').addClass('on');
						$('.list-group-item').css({
							display : 'block'
						});
						$('.left').css({
							width : 169 + 'px',
							backgroundColor : '#fff',
							background : '#fafafa'
						});
						$('.grip').css({
							left : 159 + 'px'
						});
					}
				})
			});

		})
