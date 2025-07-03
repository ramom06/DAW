//Crea las constantes cursor y p
const cursor = document.querySelector(".cursor");

const p = document.querySelector('.cambioParrafoColor');

//Cuando el cursos esta encima de la capa se pone el parrafo rojo
cursor.addEventListener('mouseover', () => {p.style.color = "red"});

//Cuando el cursor sale de la capa vuelve el parrafo a negro
cursor.addEventListener('mouseout', () => {p.style.color = "black"});


//Crea la constante imagen que contiene la imagen que se muestra
const imagen = document.querySelector('.imagen');

//Cuando el raton pase por encima de la imagen llama a la funcion cambiaImagen
imagen.addEventListener('mouseover', () => cambiaImagen());

//Esta funcion comprueba el nombre de la imagen, y lo compara para poner uno de los 2
function cambiaImagen(){
    let nombreImagen =  imagen.src.split("/").pop();
    if(nombreImagen == "robotSalvaje.avif"){
        imagen.src ="./assest/imagenes/invisible.jpg";
    }else{
        imagen.src="./assest/imagenes/robotSalvaje.avif";
    }
}


//Crea esta constante que es el botón que envía la edad
const enviaEdad = document.querySelector('.enviaEdad');
const resultado = document.querySelector('.parrafoResultado');

//Crea una variable a partir de esta se puede sacar la edad introducida
let edadIntroducida = document.querySelector('.formularioEdad');

//Cuando haces click en el botón enviar llama a la función compruebaEdad
enviaEdad.addEventListener('click', () => compruebaEdad());

//Saca la edad introducida pasandola a una variable llamada edad, comprueba que es un número
function compruebaEdad(){
    let edad = parseInt(edadIntroducida.value);
    
    if(!isNaN(edad)){
        if(edad >= 1 && edad <= 100){
            edadIntroducida.classList.add('bordeVerde');
            resultado.textContent = "Correcto";
        }else if(edad < 1 || edad > 100){
            resultado.textContent= "Introduce un valor entre 1 y 100";
            edadIntroducida.classList.add('bordeRojo');
        }
    }else{
        resultado.textContent= "Introduce un número válido";
        edadIntroducida.classList.add('bordeRojo');
    }
    
}


//Crea una constante para el botón que pulsas para cambiar el fondo de color
const botonCambiaFondo = document.querySelector('.cambioFondo');
const negro = document.querySelectorAll('.negro');

//Cuando haces click en el botón se cambia el fondo a color rojo
botonCambiaFondo.addEventListener('click', () => fondoColor(negro));

function fondoColor(negro){
    negro.forEach(a=>a.classList.toggle('rojo'))};


//Crea las constantes para los botones del último div que cambian las letras y el fondo del div de color
const cambiaBlancoNegro = document.querySelector('.CambiaBN');
const cambiaNegroBlanco = document.querySelector('.CambiaNB');
const cambiaGrisRojo = document.querySelector('.CambiaGR');

//Crea la constante para el div al que se le cambia el fondo y la letra
const cambiarFondoLetra = document.querySelector('.cambiarFondoLetra');

//Cuando haces click en el botón cambia el color de fondo y el color de la letra
cambiaBlancoNegro.addEventListener('click', () => {
    quitaClase();
    cambiarFondoLetra.classList.toggle('blancoNegro');
});

cambiaNegroBlanco.addEventListener('click', () => {  
    quitaClase();
    cambiarFondoLetra.classList.toggle('negroBlanco');
});

cambiaGrisRojo.addEventListener('click', () => {
    quitaClase();
    cambiarFondoLetra.classList.toggle('grisRojo');
});

function quitaClase(){
    cambiarFondoLetra.classList.remove('blancoNegro','negroBlanco','grisRojo');
}

