const toggleButton = document.getElementsByClassName('toggle-button')[0]
const navbarLinks = document.getElementsByClassName('navbar-links')[0]
const catToggleButton = document.getElementsByClassName('ctb-container')[0]
const catbar = document.getElementsByClassName('catbar')[0]

toggleButton.addEventListener('click', () => {
  navbarLinks.classList.toggle('active')
});

catToggleButton.addEventListener('click', () => {
    catbar.classList.toggle('active')
  })