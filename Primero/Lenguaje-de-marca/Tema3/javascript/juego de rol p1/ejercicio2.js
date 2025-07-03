console.log("Estado del héroe");
const nombre = "ramon";
console.log(`Nombre: ${nombre}`);
let nivel = 5;
let nivelCadena = nivel.toString();
console.log(`Nivel: ${nivelCadena}`);
let vida = 100;
console.log(`Puntos de vida: ${vida}`);
const arma_principal = "Espada del destino";
console.log(`Arma principal: ${arma_principal}`);
const arma_secundaria = "arco simple";
console.log(`Arma secundaria: ${arma_secundaria}`);
let armadura = true;
console.log(`Tiene armadura: ${armadura}`);
console.log();
console.log("Estado del héroe después del combate:");
console.log(`Nombre: ${nombre}`);
nivel += 1;
nivelCadena = nivel.toString();
console.log(`Nivel: ${nivelCadena}`);
vida -= 30;
console.log(`Puntos de vida: ${vida}`);

let puntosFloat = parseFloat(vida);
console.log(`Vida en float: ${puntosFloat}`);
console.log(`Nivel: ${nivelCadena}`);

let dañoBase = 50;
let multCritico = 2;
let probCritico = 0.5;
let esCritico = (probCritico > Math.random());
let daño_total = esCritico ? dañoBase * multCritico : dañoBase;

console.log(`Nivel cadena: ${nivelCadena}`);
console.log(`Puntos float: ${puntosFloat}`);
console.log(`El héroe inflige ${dañoBase} puntos de daño porque esCritico tiene valor ${esCritico}`);