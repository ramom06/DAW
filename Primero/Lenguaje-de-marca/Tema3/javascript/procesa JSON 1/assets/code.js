const btn = document.querySelector(".btn");

btn.addEventListener("click", mostrarPelicula);

async function mostrarPelicula(){

    //Extraemos la pelicula introducida
    const peliculaIntroducida = document.querySelector(".pelicula").value;

    //Creamos la URL con la pelicula
    const url = "https://www.omdbapi.com/?t=" + peliculaIntroducida + "&apikey=6bd47da3";

    const tituloPeli = document.querySelector(".titulo");
    const anyo = document.querySelector(".anyo");
    const dura = document.querySelector(".dura");
    const valoracion = document.querySelector(".select");
    const btnElige = document.querySelector(".btnElige")
    const resultado = document.querySelector(".resultado");

    try{

        //Obtenemos la respues
        const respuesta = await fetch(url);

        //Procesa la respuesta
        const data = await respuesta.json();

        //Mostramos cada dato en su casilla
        tituloPeli.innerHTML = data.Title;
        anyo.innerHTML = data.Year;
        dura.innerHTML = data.Runtime;
        
        //Borramos las opciones creadas anteriormente
        valoracion.innerHTML = "";

        //Recorremos el array de valoraciones
        data.Ratings.forEach(element => {
            let option = document.createElement("option");
            option.value = element.Value;
            option.textContent = `${element.Source}`;
            valoracion.appendChild(option);   
        });

        //Cuando pulse el boton elige llama a la función verValoracion
        btnElige.addEventListener("click", verValoracion);

    }catch(error){
        //Muestra el error
        tituloPeli.innerHTML="No se ha encontrado la pelicula";
        anyo.innerHTML = "";
        dura.innerHTML = "";
        valoracion = "";
        console.error("Error al obtener datos", error);
    }

    //La función valoración coge la opcion elegida y la escribe en el parrafo creado para ello
    function verValoracion(){
        const opcion = document.querySelector(".select").value;
        resultado.textContent = `${opcion}`;
    }
}
