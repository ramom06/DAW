const input = document.querySelector("#resultado");
const clear = document.querySelector("#clear");
const btn = document.querySelectorAll(".btn");
const operaciones = document.querySelectorAll(".btnOP");
const btnIgual = document.querySelector(".btnIgual");
let operando1 = "";
let operando2 = "";
let operacion = "";

//Recorremos el array
btn.forEach(button => {
    button.addEventListener("click", () => {
        //Comprueba si es una operación
        if(button.value == '+' || button.value == '-' || button.value == 'x' || button.value == '/'){
            //Guarda en la variable del operando la operación que se va a hacer
            operacion = button.value;
            //Comprueba si se ha introducido un valor para el operando 1, si no le da el valor 0
            if(isNaN(input.value) || input.value == ""){
                operando1 = 0;
            }else {
                operando1 = input.value;
            }
            // Limpiar la pantalla para el segundo operando
            input.value = ""; 
        }else {
            // Concatenar los valores de los números
            input.value += button.value; 
        }
    }) 
});

//Comprueba si se hace alguna operación o si hay algún valor en el input
btnIgual.addEventListener("click", muestra);

    //Coje el valor del segundo operando y calcula el resultado
function muestra(){
    operando2 = input.value;
    input.value = calculaResult(operando1, operando2, operacion);
}

//Calcula el resultado
function calculaResult(operando1, operando2, operacion){
    const n1 = parseFloat(operando1);
    const n2 = parseFloat(operando2);
    
    if(operacion == '+'){
        return n1 + n2;
    }else if(operacion == '-'){
        return n1 - n2;
    }else if(operacion == 'x'){
        return n1 * n2;
    }else if(operacion == '/'){
        if(n2 == 0){
            return 'Error. No se puede dividir entre 0';
        }
        return n1 / n2;
    }
}

// Función para el botón "C"
clear.addEventListener("click", () => {
    input.value = "";
    operando1 = "";
    operando2 = "";
    operacion = "";
});



