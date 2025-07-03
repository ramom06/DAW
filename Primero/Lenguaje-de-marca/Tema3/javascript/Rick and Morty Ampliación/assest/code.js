const btn = document.querySelector(".btn");
const body = document.querySelector("body");

btn.addEventListener("click", buscaPersonaje);

async function buscaPersonaje(){
    //En esta variable guardamos el nombre del pokemon introducido
    const episodioElegido = document.querySelector(".inputEP").value;

    //Creamos la url con el nombre del pokemon introducido
    const url = `https://rickandmortyapi.com/api/episode/${episodioElegido}`;

    const nombrePersonaje = document.querySelector(".nombre");
    
    //Obtenemos la respues
    const respuesta = await fetch(url);

    //Procesa la respuesta
    const data = await respuesta.json();

    //Mostramos cada dato en su casilla
    nombrePersonaje.innerHTML = `<h3>${data.name}</h3>`;

    let numeroPersonajes = data.characters.length;

    
}   

