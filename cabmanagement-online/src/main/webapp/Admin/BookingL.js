function toggleDetails(btn) {
     var card = btn.closest('.card');
     var extraDetails = card.querySelectorAll('.card-body.d-none');
     extraDetails.forEach(function(detailSection) {
       detailSection.classList.toggle('d-none');
     });
   }