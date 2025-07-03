const p1 = document.querySelector('.niidea');
const b = document.querySelector('body');
const dobleClick = document.querySelector('#dobleclick');

p1.addEventListener('click', () => alert('Parrafo 1click'));
b.addEventListener('load',mensaje);
dobleClick.addEventListener('dblclick', () => alert('Doble click'));


function mensaje(){
    alert('Página cargada');
}
