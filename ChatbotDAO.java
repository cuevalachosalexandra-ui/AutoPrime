/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.autoprime.dao;

/**
 *
 * @author ALEXANDRA
 */

import com.autoprime.model.Repuesto;
import java.util.List;

public class ChatbotDAO {

    public String responder(String mensaje) {

        if (mensaje == null || mensaje.trim().isEmpty()) {
            return "Escribe una consulta.";
        }

        mensaje = mensaje.toLowerCase().trim();

        // Saludos
        if (mensaje.contains("hola") || mensaje.contains("buenos")) {
            return "¡Hola! 👋 Soy <b>AutoPrime Assistant</b>.<br>¿En qué puedo ayudarte?";
        }

        // Horario
        if (mensaje.contains("horario")) {
            return "🕒 Nuestro horario es:<br>Lunes a Viernes: 8:00 am - 6:00 pm<br>Sábados: 8:00 am - 1:00 pm";
        }

        // Contacto
        if (mensaje.contains("contacto") || mensaje.contains("telefono")) {
            return "📞 Teléfono: 987654321<br>📧 Correo: ventas@autoprime.pe";
        }

        // Sistema
        if (mensaje.contains("autoprime")) {
            return "AutoPrime es un sistema para gestionar repuestos, proveedores, inventario, entradas, salidas y reportes.";
        }

        // Buscar repuesto
        RepuestoDAO dao = new RepuestoDAO();

        List<Repuesto> lista = dao.buscar(mensaje);

        if (!lista.isEmpty()) {

            Repuesto r = lista.get(0);

            return "<b>Repuesto encontrado</b><br><br>"
                    + "🔧 " + r.getNombre()
                    + "<br>Marca: " + r.getMarca()
                    + "<br>Stock: " + r.getStock()
                    + "<br>Precio: S/ " + r.getPrecio();
        }

        return "Lo siento, no encontré ese repuesto.<br>Intenta escribir otra palabra.";
    }

}