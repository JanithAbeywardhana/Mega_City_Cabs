
document.addEventListener('DOMContentLoaded', () => {
  const sidebar = document.getElementById('sidebar');
  const mainContent = document.getElementById('main-content');
  const sidebarToggle = document.getElementById('sidebarToggle');
  const mobileSidebarToggle = document.getElementById('mobileSidebarToggle');


  sidebarToggle.addEventListener('click', () => {
    sidebar.classList.toggle('collapsed');
    mainContent.classList.toggle('expanded');
  });

  
  mobileSidebarToggle.addEventListener('click', () => {
    sidebar.classList.toggle('collapsed');
    mainContent.classList.toggle('expanded');
  });
});
