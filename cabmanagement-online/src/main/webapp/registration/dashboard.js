


const carsData = {
  expo: {
    title: "Expo",
    subtitle: "Tata Nano",
    desc: "A small hatchback, air conditioned with capacity of 3 passengers, ideal for short distance trips.",
    features: ["3 Passengers", "Air Conditioned", "Small Backpacks"],
    mainImage: "./img/Mirissa1.jpg",
    subImages: [
      "./img/Mirissa1.jpg",
      "https://via.placeholder.com/200x150.png?text=Expo+2",
      "https://via.placeholder.com/200x150.png?text=Expo+3",
      "https://via.placeholder.com/200x150.png?text=Expo+4"
    ]
  },
  budget: {
    title: "Budget",
    subtitle: "Suzuki Alto",
    desc: "A cost-effective city car, perfect for daily commutes and short trips. Great mileage and easy to park.",
    features: ["4 Passengers", "Air Conditioned", "Compact Luggage"],
    mainImage: "https://via.placeholder.com/400x300.png?text=Main+Budget",
    subImages: [
      "https://via.placeholder.com/200x150.png?text=Budget+1",
      "https://via.placeholder.com/200x150.png?text=Budget+2",
      "https://via.placeholder.com/200x150.png?text=Budget+3",
      "https://via.placeholder.com/200x150.png?text=Budget+4"
    ]
  },
  city: {
    title: "City",
    subtitle: "Toyota Prius",
    desc: "A comfortable hybrid with great fuel efficiency, ideal for city driving and eco-friendly travel.",
    features: ["4 Passengers", "Air Conditioned", "Eco-friendly"],
    mainImage: "https://via.placeholder.com/400x300.png?text=Main+City",
    subImages: [
      "https://via.placeholder.com/200x150.png?text=City+1",
      "https://via.placeholder.com/200x150.png?text=City+2",
      "https://via.placeholder.com/200x150.png?text=City+3",
      "https://via.placeholder.com/200x150.png?text=City+4"
    ]
  },
  semi: {
    title: "Semi",
    subtitle: "Toyota Avanza",
    desc: "A mini MPV offering extra space for family trips and group travel. Comfortable interior and reliable performance.",
    features: ["6 Passengers", "Air Conditioned", "Spacious Trunk"],
    mainImage: "https://via.placeholder.com/400x300.png?text=Main+Semi",
    subImages: [
      "https://via.placeholder.com/200x150.png?text=Semi+1",
      "https://via.placeholder.com/200x150.png?text=Semi+2",
      "https://via.placeholder.com/200x150.png?text=Semi+3",
      "https://via.placeholder.com/200x150.png?text=Semi+4"
    ]
  },
  "9seater": {
    title: "9 Seater",
    subtitle: "Toyota HiAce",
    desc: "A van suitable for larger groups, offering comfortable seating for up to 9 passengers plus luggage.",
    features: ["9 Passengers", "Air Conditioned", "Large Luggage"],
    mainImage: "https://via.placeholder.com/400x300.png?text=Main+9+Seater",
    subImages: [
      "https://via.placeholder.com/200x150.png?text=9+Seater+1",
      "https://via.placeholder.com/200x150.png?text=9+Seater+2",
      "https://via.placeholder.com/200x150.png?text=9+Seater+3",
      "https://via.placeholder.com/200x150.png?text=9+Seater+4"
    ]
  },
  "14seater": {
    title: "14 Seater",
    subtitle: "Toyota Coaster",
    desc: "A mini bus for large groups, providing ample seating and space for extended trips or tours.",
    features: ["14 Passengers", "Air Conditioned", "Ample Storage"],
    mainImage: "https://via.placeholder.com/400x300.png?text=Main+14+Seater",
    subImages: [
      "https://via.placeholder.com/200x150.png?text=14+Seater+1",
      "https://via.placeholder.com/200x150.png?text=14+Seater+2",
      "https://via.placeholder.com/200x150.png?text=14+Seater+3",
      "https://via.placeholder.com/200x150.png?text=14+Seater+4"
    ]
  }
};


const carTitle     = document.getElementById("car-title");
const carSubtitle  = document.getElementById("car-subtitle");
const carDesc      = document.getElementById("car-desc");
const carFeatures  = document.getElementById("car-features");
const carMainImage = document.getElementById("car-main-image");
const carSubImages = document.getElementById("car-sub-images");


function loadCarData(carKey) {
  const car = carsData[carKey];
  if (!car) return;
  

  carTitle.textContent = car.title;
  carSubtitle.textContent = car.subtitle;
  carDesc.textContent = car.desc;
  

  carFeatures.innerHTML = ""; 
  car.features.forEach(feature => {
    const li = document.createElement("li");
    li.textContent = feature;
    carFeatures.appendChild(li);
  });
  

  carMainImage.src = car.mainImage;
  

  carSubImages.innerHTML = ""; 

  car.subImages.forEach(imgSrc => {
    const colDiv = document.createElement("div");
    colDiv.className = "col-6";
    const img = document.createElement("img");
    img.src = imgSrc;
    img.alt = "Sub image";
    img.className = "img-fluid rounded";
    colDiv.appendChild(img);
    carSubImages.appendChild(colDiv);
  });
}


document.addEventListener("DOMContentLoaded", () => {
  const categoryButtons = document.querySelectorAll("#car-categories .btn");
  
  categoryButtons.forEach(btn => {
    btn.addEventListener("click", () => {
 
      categoryButtons.forEach(b => b.classList.remove("active"));

      btn.classList.add("active");
      
  
      const carKey = btn.getAttribute("data-car");
      loadCarData(carKey);
    });
  });


});