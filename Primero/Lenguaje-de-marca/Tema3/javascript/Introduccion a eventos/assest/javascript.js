const body = document.querySelector("body");
const unClick = document.querySelector(".unClick");
const robot = document.querySelector(".robot");
const invisible = document.querySelector(".invisible");
const dblclick = document.querySelector(".dblclick");
const btn = document.querySelector(".btn");
const cursor = document.querySelector(".cursor");

// Al cargar la página se muestra un mensaje

body.addEventListener("load", mensaje());

// Primera capa. Cuando hagas click en el párrafo muestra un mensaje (alert): “Has realizado un click”

unClick.addEventListener("click", () => alert("Has realizado un click"));

// Segunda capa. Cuando hagas click Solicita dos números válidos por teclados y muestra
// un mensaje por alert “El número máximo es x”que diga cual es el máximo.

robot.addEventListener("click", () => {
    let num1 = prompt("Introduce el primer número:");
    let num2 = prompt("Introduce el segundo número:");

    num1 = parseFloat(num1);
    num2 = parseFloat(num2);

    if (isNaN(num1) || isNaN(num2)) {
    alert("El número no es válido");
    } else {
    let maximo = Math.max(num1, num2);
    alert("El número máximo es " + maximo);
    }
});

// Tercera capa. Cuando el cursor deje la imagen determinar dado un número válido
// si es par o impar mostrándolo por pantalla “ El número x es par/impar”.

invisible.addEventListener("mouseleave", () => {
    let num = prompt("Introduce un número:");
    num = parseInt(num);

    if (isNaN(num)) {
    alert("El número no es válido");
    } else {
    if (num % 2 === 0) {
        alert(`El número ${num} es par`);
    } else {
        alert(`El número ${num} es impar`);
    }
    } 
});

// Cuarta capa. Cuando hagas doble click en el párrafo muestra un mensaje (alert): “Has realizado un doble click”

dblclick.addEventListener("dblclick", () =>
    alert("Has realizado un doble click")
);

// Quinta capa. Cuando pulses el botón muestra cuántas veces se ha hecho clic en la capa.
// Mensaje alert “Has pulsado el botón x veces”

let contador = 0;
btn.addEventListener("click", () => {
    contador++;
    alert(`Has pulsado el botón ${contador} veces`);
});

// Sexta capa. Cuando el cursor entre en la capa solicita dos números válidos y realiza
// la multiplicación mostrándola por pantalla(alert) “La multiplicación de x e y es z”.

cursor.addEventListener("mouseenter", () => {
    let num1 = prompt("Introduce el primer número:");
    let num2 = prompt("Introduce el segundo número:");

    num1 = parseInt(num1);
    num2 = parseInt(num2);

    if (isNaN(num1) || isNaN(num2)) {
    alert("El número no es válido");
    } else {
    let multiplicacion = num1 * num2;
    alert(`La multiplicacion de ${num1} por ${num2} es ${multiplicacion}`);
    }
});

// Mensaje de carga

function mensaje() {
    alert("Página cargada");
}

