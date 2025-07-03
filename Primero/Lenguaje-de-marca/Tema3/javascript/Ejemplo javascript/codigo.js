const h = document.querySelector('.enc');
const p = document.querySelector('.p1');
const img = document.querySelector('.img');
const b1 = document.querySelector('.b1');
const b2 = document.querySelector('.b2');
const b3 = document.querySelector('.b3');


b1.addEventListener('click', () => {p.style.color="red";});
b2.addEventListener('click', () => {img.src="./fernando.jpg";});
b3.addEventListener('click', () => {h.classList.toggle("nueva");});


