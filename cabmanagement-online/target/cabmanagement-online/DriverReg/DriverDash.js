// Toggle Sidebar Functionality
    document.getElementById("sidebarCollapse").addEventListener("click", function () {
      var sidebar = document.getElementById("sidebar");
      var content = document.getElementById("content");
      var navbarBrand = document.querySelector(".navbar .navbar-brand");
      
      if (sidebar.style.width === "250px" || sidebar.style.width === "") {
        sidebar.style.width = "0";
        content.style.marginLeft = "0";
        navbarBrand.style.marginLeft = "0";
      } else {
        sidebar.style.width = "250px";
        content.style.marginLeft = "250px";
        navbarBrand.style.marginLeft = "250px";
      }
    });