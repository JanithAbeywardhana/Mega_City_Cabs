// Global variables for map and directions
var map;
var directionsService;
var directionsRenderer;

function initMap() {
  // Initialize the Directions Service and Renderer
  directionsService = new google.maps.DirectionsService();
  directionsRenderer = new google.maps.DirectionsRenderer();
  
  // Create the map centered at Colombo (adjust the coordinates as needed)
  map = new google.maps.Map(document.getElementById("map"), {
    zoom: 7,
    center: { lat: 6.9271, lng: 79.8612 }
  });
  
  // Bind the directions renderer to the map
  directionsRenderer.setMap(map);
  
  // Call function to calculate and display route if fields are already filled
  calculateAndDisplayRoute();
}

// Function to calculate and display route on the map
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

// Event listeners to recalculate the route when pickup or drop changes
document.addEventListener("DOMContentLoaded", function() {
  // Ensure the map initialization is done through the callback parameter in the API script
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

