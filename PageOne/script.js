var slideIndex = 1;
var pageContain = document.getElementsByClassName("pagination");
var page = document.getElementsByClassName("pageNo");
var min = document.getElementById("min");
var max = document.getElementById("max");

function minMax() {
  max.min = min.value;
  if (min.value > max.value) {
    alert("Max value should be greater than min");
  }
}

min.addEventListener("change", () => {
  max.min = min.value;
  max.value = min.value;

  if (min.value > max.value) {
    alert("Max value should be greater than min");
  }
});

max.addEventListener("change", minMax);

function pagination(el) {
  for (var i = 0; i < page.length; i++) {
    page[i].classList.remove("active");
  }
  el.target.classList.add("active");
}

for (var i = 0; i < page.length; i++) {
  page[i].addEventListener("click", pagination);
}

showSlides(slideIndex);

function currentSlide(n) {
  showSlides((slideIndex = n));
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("main-inner");

  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {
    slideIndex = 1;
  }
  if (n < 1) {
    slideIndex = slides.length;
  }
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex - 1].style.display = "flex";
  dots[slideIndex - 1].className += " on";
}
