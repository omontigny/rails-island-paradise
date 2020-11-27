const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  const navbarbrand = document.querySelector('.navbar-brand');
  const navlink = document.querySelector('.nav-link');

  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 50) {
        navbar.classList.add('navbar-lewagon-white');
        navbarbrand.classList.add('navbar-brand-white');
        navlink.classList.add('nav-link-white');
      } else {
        navbar.classList.remove('navbar-lewagon-white');
        navbarbrand.classList.remove('navbar-brand-white');
        navlink.classList.remove('nav-link-white');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
