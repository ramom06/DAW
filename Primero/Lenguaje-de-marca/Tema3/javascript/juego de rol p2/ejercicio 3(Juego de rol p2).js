let dificultad = 1;
let nivel= 1;
let experiencia_actual = 90;
let experiencia_ganada = 30;
let experiencia_necesaria = 100;

if(experiencia_actual + experiencia_ganada >= experiencia_necesaria){
    console.log("El héroe ha subido de nivel");
    dificultad++;
    nivel++;
    experiencia_actual = experiencia_actual + experiencia_ganada - experiencia_necesaria;
    console.log(`Nueva dificultad: ${dificultad}`);
}

if(dificultad == 1){
    console.log("El héroe es Novato");
}else if(dificultad == 2){
    console.log("El héroe es Medio");
}else if(dificultad == 3){
    console.log("El héroe es Profesional");
}


console.log(`Nivel actual: ${nivel}`);
console.log(`Experiencia actual: ${experiencia_actual}`);
