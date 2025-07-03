const input1 = document.querySelector('.inputN1');
const input2 = document.querySelector('.inputN2');
const select = document.querySelector('.selectOP');
const btn = document.querySelector('.btnCalc');
const inputResultado = document.querySelector('.inputResultado');

btn.addEventListener('click', () => realizaOperación());

function realizaOperación(){
    let numero1 = parseFloat(input1.value);
    let numero2 = parseFloat(input2.value);
    
    if(!isNaN(numero1) && !isNaN(numero2)){
        let resultado;
        switch(select.value){
            case "1":
                resultado = numero1 + numero2;
                break;
            case "2":
                resultado = numero1 - numero2;
                break;
            case "3":
                resultado = numero1 * numero2;
                break;
            case "4":
                if(numero2 == 0){
                    inputResultado.value = "Error. No se puede dividir entre 0";}
                resultado = numero1 / numero2;
                return;
        }
        inputResultado.value = resultado.toString();
    }else{
        inputResultado.value = "Lo siento, introduce números";
    }
}


