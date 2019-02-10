var backdrop = document.querySelector(".backdrop");
var modal = document.querySelector(".modal");
var modalNoButton = document.querySelector(".modal__action--negative");
var selectPlanButtons = document.querySelector('#buton');

selectPlanButtons.addEventListener('click', function() {
  modal.classList.add("open");
  backdrop.style.display = "block";
  setTimeout(function() {
    backdrop.classList.add("open");
  }, 10);
})

function closeModal() {
  //   backdrop.style.display = "none";
  //   modal.style.display = "none";
  if (modal) {
    modal.classList.remove("open");
  }
  backdrop.classList.remove("open");
  setTimeout(function() {
    backdrop.style.display = "none";
  }, 200);
}


backdrop.addEventListener("click", function() {
  // mobileNav.style.display = 'none';
  closeModal();
});

if (modalNoButton) {
  modalNoButton.addEventListener("click", closeModal);
}

