
var map;
var directionsService;
var directionsRenderer;

function initMap() {

  directionsService = new google.maps.DirectionsService();
  directionsRenderer = new google.maps.DirectionsRenderer();
  

  map = new google.maps.Map(document.getElementById("map"), {
    zoom: 7,
    center: { lat: 6.9271, lng: 79.8612 }
  });
  

  directionsRenderer.setMap(map);
  
 
  calculateAndDisplayRoute();
}


function calculateAndDisplayRoute() {
  var pickup = document.getElementById("pickup").value;
  var drop = document.getElementById("drop").value;
  
  if (pickup && drop) {
    directionsService.route({
      origin: pickup,
      destination: drop,
      travelMode: google.maps.TravelMode.DRIVING
    }, function(response, status) {
      if (status === "OK") {
        directionsRenderer.setDirections(response);
      } else {
        console.error("Directions request failed due to " + status);
      }
    });
  }
}


document.addEventListener("DOMContentLoaded", function() {
  
  var pickupInput = document.getElementById("pickup");
  var dropInput = document.getElementById("drop");
  
  if (pickupInput && dropInput) {
    pickupInput.addEventListener("change", calculateAndDisplayRoute);
    dropInput.addEventListener("change", calculateAndDisplayRoute);
  }
});




document.addEventListener("DOMContentLoaded", function () {
    const vehicleTypeSelect = document.getElementById("vehicleType");
    const passengerInput = document.getElementById("passengerCount");

    vehicleTypeSelect.addEventListener("change", function () {
        const vehicleType = this.value;
        if (vehicleType === "4-passenger") {
            passengerInput.max = 4;
        } else if (vehicleType === "8-passenger") {
            passengerInput.max = 8;
        } else if (vehicleType === "14-passenger") {
            passengerInput.max = 14;
        }
    });
});



document.addEventListener('DOMContentLoaded', () => {
   const sidebar = document.getElementById('sidebar');
   const toggleBtn = document.getElementById('toggleSidebar');
   
   toggleBtn.addEventListener('click', () => {
     sidebar.classList.toggle('collapsed');
   });
 });

