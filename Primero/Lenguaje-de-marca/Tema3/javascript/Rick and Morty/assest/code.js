const btn = document.querySelector(".btn");
const body = document.querySelector("body");

btn.addEventListener("click", buscaPersonaje);

async function buscaPersonaje(){
    //En esta variable guardamos el nombre del pokemon introducido
    const personajeElegido = document.querySelector(".select").value;

    //Creamos la url con el nombre del pokemon introducido
    const url = `https://rickandmortyapi.com/api/character/${personajeElegido}`;

    const nombrePersonaje = document.querySelector(".nombre");
    const especie = document.querySelector(".especie");
    const genero = document.querySelector(".genero");
    const imagen = document.querySelector(".img img"); 
    const episodio  = document.querySelector(".ep");
    

   //Obtenemos la respues
    const respuesta = await fetch(url);

    //Procesa la respuesta
    const data = await respuesta.json();

    //Mostramos cada dato en su casilla
    nombrePersonaje.innerHTML = `<h3>${data.name}</h3>`;
    especie.innerHTML = `<h3>${data.species}</h3>`;
    genero.innerHTML = `<h3>${data.gender}</h3>`;
    imagen.src = data.image;
    episodio.innerHTML = data.episode.length;

    if(data.gender ==  "Male"){
        body.classList.remove("women")
        body.classList.add("male"); 
    }else if(data.gender == "Female"){
        body.classList.remove("male")
        body.classList.add("women");     }
}

