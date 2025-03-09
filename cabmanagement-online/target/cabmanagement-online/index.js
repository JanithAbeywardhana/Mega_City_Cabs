// Open Sidebar & Apply Blur Effect to Content Area
document.getElementById("openSidebar").addEventListener("click", function () {
  document.getElementById("sidebar").classList.add("active"); // Show sidebar
  document.body.classList.add("sidebar-active"); // Apply blur to the content area
});

// Close Sidebar & Remove Blur Effect from Content Area
document.getElementById("closeSidebar").addEventListener("click", function () {
  document.getElementById("sidebar").classList.remove("active"); // Hide sidebar
  document.body.classList.remove("sidebar-active"); // Remove blur from content area
});

document.getElementById("themeToggle").addEventListener("click", function () {
  document.body.classList.toggle("light-mode");
  let icon = this.querySelector("i");
  icon.classList.toggle("fa-moon");
  icon.classList.toggle("fa-sun");
});

document.getElementById("profileMenuBtn").addEventListener("click", function () {
  let menu = document.getElementById("profileMenu");
  menu.style.display = menu.style.display === "block" ? "none" : "block";
});

document.addEventListener("DOMContentLoaded", function () {
    const features = document.querySelectorAll(".feature");

    features.forEach((feature) => {
        feature.addEventListener("mouseover", () => {
            feature.style.transform = "scale(1.05)";
        });

        feature.addEventListener("mouseleave", () => {
            feature.style.transform = "scale(1)";
        });
    });
});




document.addEventListener("DOMContentLoaded", function() {
    const buttons = document.querySelectorAll(".book-now, .learn-more");

    buttons.forEach(button => {
        button.addEventListener("mouseover", function() {
            this.style.transform = "scale(1.05)";
        });

        button.addEventListener("mouseout", function() {
            this.style.transform = "scale(1)";
        });

        button.addEventListener("click", function() {
            alert("Feature coming soon!");
        });
    });
});



document.addEventListener("DOMContentLoaded", function() {
    const steps = document.querySelectorAll(".step");

    steps.forEach(step => {
        step.addEventListener("mouseover", function() {
            this.style.backgroundColor = "#e0f2ff";
        });

        step.addEventListener("mouseout", function() {
            this.style.backgroundColor = "white";
        });
    });
});


document.addEventListener("DOMContentLoaded", function () {
    console.log("Script loaded successfully!"); // Debugging check

    const counters = document.querySelectorAll(".counter");
    console.log("Counters found:", counters.length); // Check if elements are found

    counters.forEach(counter => {
        counter.innerText = "0"; // Ensure counters start at 0
        const target = +counter.getAttribute("data-target"); // Convert to number
        const increment = target / 100; // Adjust speed

        let count = 0;
        function updateCounter() {
            count += increment;
            if (count < target) {
                counter.innerText = Math.floor(count);
                requestAnimationFrame(updateCounter);
            } else {
                counter.innerText = target.toLocaleString(); // Format number
            }
        }
        updateCounter();
    });
});


// JavaScript for the Image Slider
document.addEventListener("DOMContentLoaded", () => {
    // Select all images
    const images = document.querySelectorAll('.image-container img');
    let currentIndex = 0;

    // Function to change the active image
    function changeImage() {
        images[currentIndex].classList.remove('active'); // Remove the 'active' class
        currentIndex = (currentIndex + 1) % images.length; // Move to the next image
        images[currentIndex].classList.add('active'); // Add the 'active' class to the new image
    }

    // Set the image change interval to 3 seconds
    setInterval(changeImage, 3000);
});
