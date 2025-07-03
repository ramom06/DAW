let monedas=[1,2,5,10,20,50,100,200];
let atuendos=["Duende","Arquero", "Caballero", "Mago", "Guerrero", "Hechicero"];
let sumaMonedas = 0;

for(let elemento of monedas){
    sumaMonedas += elemento;
}

console.log(`El total de monedas a conseguir en los cofres es: ${sumaMonedas}`);

atuendos.forEach((atuendo, numero) => {
    console.log(`Atuendo ${numero}: ${atuendo}`);
});

