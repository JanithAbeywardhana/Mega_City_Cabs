// Wait for the DOM to fully load before attaching event listeners
document.addEventListener('DOMContentLoaded', () => {
  const sidebar = document.getElementById('sidebar');
  const mainContent = document.getElementById('main-content');
  const sidebarToggle = document.getElementById('sidebarToggle');
  const mobileSidebarToggle = document.getElementById('mobileSidebarToggle');

  // Toggle for desktop
  sidebarToggle.addEventListener('click', () => {
    sidebar.classList.toggle('collapsed');
    mainContent.classList.toggle('expanded');
  });

  // Toggle for mobile
  mobileSidebarToggle.addEventListener('click', () => {
    sidebar.classList.toggle('collapsed');
    mainContent.classList.toggle('expanded');
  });
});
