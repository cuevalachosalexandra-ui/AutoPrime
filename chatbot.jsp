<%-- 
    Document   : chatbot
    Created on : 13 jul. 2026, 8:42:45 a. m.
    Author     : ALEXANDRA
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<div id="chatbot-button">
    <i class="bi bi-chat-dots-fill"></i>
</div>

<div id="chatbot-container">

    <div id="chatbot-header">

        <div>

            <div class="tituloBot">
                AutoPrime Assistant
            </div>

            <div class="estadoBot">
                <span class="online"></span>
                Asistente en línea
            </div>

        </div>

        <span id="cerrarChat">
            <i class="bi bi-x-lg"></i>
        </span>

    </div>

    <div id="chatbot-body">

        <div class="mensaje bot">

            <div class="texto">

                ¡Hola! 👋<br><br>

                Bienvenido a <b>AutoPrime</b>.

                Soy tu asistente virtual.

                ¿Cómo puedo ayudarte?

            </div>

            <div class="hora" id="horaInicio">
                09:00
            </div>

        </div>

    </div>

    <div id="opciones">

        <button onclick="respuestaRapida('productos')">
            🚗 Productos
        </button>

        <button onclick="respuestaRapida('contacto')">
            📞 Contacto
        </button>

        <button onclick="respuestaRapida('horario')">
            🕒 Horario
        </button>

        <button onclick="respuestaRapida('ubicacion')">
            📍 Ubicación
        </button>

        <button onclick="respuestaRapida('envios')">
            🚚 Envíos
        </button>

        <button onclick="respuestaRapida('cotizacion')">
            💬 Cotizar
        </button>

    </div>

    <div id="chatbot-footer">

        <input
            id="mensaje"
            type="text"
            placeholder="Escribe tu consulta..."
        >

        <button id="btnEnviar">
            <i class="bi bi-send-fill"></i>
        </button>

    </div>

</div>