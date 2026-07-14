/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
document.addEventListener("DOMContentLoaded", function () {


    const botonChat = document.getElementById("chatbot-button");
    const ventanaChat = document.getElementById("chatbot-container");
    const cerrarChat = document.getElementById("cerrarChat");
    const btnEnviar = document.getElementById("btnEnviar");
    const inputMensaje = document.getElementById("mensaje");


    botonChat.addEventListener("click", function () {

        ventanaChat.classList.add("mostrar");

    });


    cerrarChat.addEventListener("click", function () {

        ventanaChat.classList.remove("mostrar");

    });



    btnEnviar.addEventListener("click", function () {

        enviarMensaje();

    });



    inputMensaje.addEventListener("keypress", function(e){

        if(e.key === "Enter"){

            enviarMensaje();

        }

    });

    mostrarHoraInicio();

});


function enviarMensaje(){


    let input = document.getElementById("mensaje");


    let texto = input.value.trim();



    if(texto === ""){

        return;

    }



    agregarUsuario(texto);


    input.value = "";



    mostrarEscribiendo();



    setTimeout(function(){


        quitarEscribiendo();


        responder(texto);



    },800);


}


function respuestaRapida(opcion){


    agregarUsuario(opcion);


    mostrarEscribiendo();



    setTimeout(function(){


        quitarEscribiendo();


        responder(opcion);



    },800);


}


function responder(mensaje){


    mensaje = mensaje.toLowerCase();


    // SALUDO

    if(
        mensaje.includes("hola") ||
        mensaje.includes("buenos") ||
        mensaje.includes("buenas")
    ){


        agregarBot(
        "¡Hola! 👋<br><br>"+
        "Bienvenido a <b>AutoPrime</b>.<br>"+
        "Soy tu asistente virtual.<br><br>"+
        "¿En qué puedo ayudarte?"
        );


    }


    // PRODUCTOS

    else if(
        mensaje.includes("producto") ||
        mensaje.includes("repuesto") ||
        mensaje.includes("venden") ||
        mensaje.includes("tienen")
    ){


        agregarBot(
        "🚗 En AutoPrime contamos con:<br><br>"+
        "✔ Filtros<br>"+
        "✔ Bujías<br>"+
        "✔ Pastillas de freno<br>"+
        "✔ Amortiguadores<br>"+
        "✔ Aceites<br>"+
        "✔ Baterías<br>"+
        "✔ Repuestos para diferentes marcas."
        );


    }

    // HORARIO

    else if(
        mensaje.includes("horario") ||
        mensaje.includes("atienden") ||
        mensaje.includes("abren")
    ){


        agregarBot(
        "🕒 Nuestro horario de atención:<br><br>"+
        "Lunes a Viernes:<br>"+
        "8:00 am - 7:00 pm<br><br>"+
        "Sábados:<br>"+
        "8:00 am - 1:00 pm"
        );


    }

    // CONTACTO

    else if(
        mensaje.includes("contacto") ||
        mensaje.includes("telefono") ||
        mensaje.includes("celular") ||
        mensaje.includes("correo")
    ){


        agregarBot(
        "📞 Puedes comunicarte con nosotros:<br><br>"+
        "Teléfono: 903060991<br>"+
        "Correo: ventas@autoprime.pe"
        );


    }

    // UBICACION

    else if(
        mensaje.includes("ubicacion") ||
        mensaje.includes("dirección") ||
        mensaje.includes("direccion") ||
        mensaje.includes("donde") ||
        mensaje.includes("local")
    ){


        agregarBot(
        "📍 Nos encontramos en:<br><br>"+
        "Av. Balta 1234<br>"+
        "Chiclayo - Perú"
        );


    }


    // ENVIOS

    else if(
        mensaje.includes("envio") ||
        mensaje.includes("envíos") ||
        mensaje.includes("delivery") ||
        mensaje.includes("entrega")
    ){


        agregarBot(
        "🚚 Sí realizamos envíos.<br><br>"+
        "Consulta la cobertura disponible para tu ubicación."
        );


    }

    // COTIZACION

    else if(
        mensaje.includes("cotizar") ||
        mensaje.includes("cotizacion") ||
        mensaje.includes("precio") ||
        mensaje.includes("cuanto cuesta")
    ){


        agregarBot(
        "💬 Para ayudarte con una cotización envíanos:<br><br>"+
        "✔ Marca del vehículo<br>"+
        "✔ Modelo<br>"+
        "✔ Año<br>"+
        "✔ Nombre del repuesto"
        );


    }

    // MARCAS

    else if(
        mensaje.includes("toyota") ||
        mensaje.includes("ford") ||
        mensaje.includes("bmw") ||
        mensaje.includes("audi") ||
        mensaje.includes("mercedes") ||
        mensaje.includes("ferrari")
    ){


        agregarBot(
        "🚗 Trabajamos con repuestos para diversas marcas:<br><br>"+
        "✔ Toyota<br>"+
        "✔ Ford<br>"+
        "✔ BMW<br>"+
        "✔ Audi<br>"+
        "✔ Mercedes-Benz<br>"+
        "✔ Ferrari"
        );


    }


    else{


        agregarBot(
        "No encontré una respuesta para esa consulta.<br><br>"+
        "Puedes preguntarme sobre:<br><br>"+
        "🚗 Productos<br>"+
        "📞 Contacto<br>"+
        "📍 Ubicación<br>"+
        "🕒 Horario<br>"+
        "🚚 Envíos<br>"+
        "💬 Cotizaciones"
        );


    }


}







// ==============================
// AGREGAR MENSAJE USUARIO
// ==============================


function agregarUsuario(texto){


    let cuerpo = document.getElementById("chatbot-body");



    cuerpo.innerHTML += `

    <div class="mensaje usuario">

        <div class="texto">

            ${texto}

        </div>

        <div class="hora">

            ${obtenerHora()}

        </div>

    </div>

    `;



    bajarScroll();


}


function agregarBot(texto){


    let cuerpo = document.getElementById("chatbot-body");



    cuerpo.innerHTML += `


    <div class="mensaje bot">

        <div class="texto">

            ${texto}

        </div>


        <div class="hora">

            ${obtenerHora()}

        </div>


    </div>


    `;

    bajarScroll();


}



function mostrarEscribiendo(){


    let cuerpo = document.getElementById("chatbot-body");


    cuerpo.innerHTML += `


    <div id="escribiendo" class="mensaje bot">

        <div class="escribiendo">

            Escribiendo<span>.</span><span>.</span><span>.</span>

        </div>

    </div>


    `;


    bajarScroll();


}


function quitarEscribiendo(){


    let elemento = document.getElementById("escribiendo");


    if(elemento){

        elemento.remove();

    }


}


function obtenerHora(){


    let fecha = new Date();


    let hora = fecha.getHours();


    let minutos = fecha.getMinutes();



    if(minutos < 10){

        minutos = "0" + minutos;

    }



    return hora + ":" + minutos;


}


function mostrarHoraInicio(){


    let elemento = document.getElementById("horaInicio");


    if(elemento){

        elemento.innerHTML = obtenerHora();

    }


}


function bajarScroll(){


    let cuerpo = document.getElementById("chatbot-body");


    cuerpo.scrollTop = cuerpo.scrollHeight;


}