// app/javascript/offcanvas.js

document.getElementById("toggleMenu").addEventListener("click", function () {
  document.getElementById("offcanvasMenu").classList.toggle("show");
});

document.getElementById("closeMenu").addEventListener("click", function () {
  document.getElementById("offcanvasMenu").classList.remove("show");
});
