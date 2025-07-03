function curar(vida, curacion) {
    return Math.min(vida + curacion, 100);
}

let vida = 50;
let curacion = 30;
console.log(`El jugador tiene ${vida} de vida y se toma la poción de ${curacion}, en total tiene: ${curar(vida, curacion)}`);