const btn = document.querySelector(".btn");

btn.addEventListener("click", buscaPokemon);

async function buscaPokemon(){
    //En esta variable guardamos el nombre del pokemon introducido
    const nombreIntroducido = document.querySelector(".inputIntroduce").value;

    //Creamos la url con el nombre del pokemon introducido
    const url = `https://pokeapi.co/api/v2/pokemon/${nombreIntroducido}`;

    const nombrePokemon = document.querySelector(".nombre");
    const imagen = document.querySelector(".img img"); 
    const altura  = document.querySelector(".alt");
    const tipo  = document.querySelector(".tipo");
    

    try{

        //Obtenemos la respues
        const respuesta = await fetch(url);

        //Procesa la respuesta
        const data = await respuesta.json();

        //Mostramos cada dato en su casilla
        nombrePokemon.innerHTML = `<h3>${data.name}</h3>`;
        imagen.src = data.sprites.front_default;
        altura.innerHTML = `<h3>${data.height}</h3>`;

        //Recorremos el array de tipos y los mostramos en la lista
        data.types.forEach(element => {
            tipo.innerHTML=tipo.innerHTML+`<li>${element.type.name}</li>`;
        });
    
    }catch (error){
        //Lo mostramos 
        imagen.src="";
        tipo.innerHTML='';
        altura.innerHTML='';
        nombrePokemon.innerHTML=`<p>No se encontró el Pokemon.</p>`;
        console.error("Error al obtener datos", error);
    }
}