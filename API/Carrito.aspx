<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="API.Carrito" %>
<script src="https://www.paypal.com/sdk/js?client-id=Af6_NajPxmzcmIkbdHLiURfyJL52ARkIFaerE7FdPWDifAz4hvkHmRwWuHWOZItpIeNX7KzNbvfmyzHl"></script>

<!DOCTYPE html>
<html>
<head>
    <title>Carrito de Compras</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        .total {
            text-align: right;
            padding: 20px;
        }
        .btn-pagar {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-eliminar {
            padding: 5px 10px;
            background-color: #f44336;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        #paypal-button-container {
            display: flex;
            justify-content: center; /* Centra el botón de PayPal */
            margin: 20px 0; /* Espaciado alrededor del botón */
        }
    </style>
    <script src="https://www.paypal.com/sdk/js?client-id=Af6_NajPxmzcmIkbdHLiURfyJL52ARkIFaerE7FdPWDifAz4hvkHmRwWuHWOZItpIeNX7KzNbvfmyzHl"></script>
</head>
<body>
    <h1>Carrito de Compras</h1>
    <table>
        <thead>
            <tr>
                <th>Producto</th>
                <th>Precio</th>
                <th>Acciones</th> <!-- Nueva columna para acciones -->
            </tr>
        </thead>
        <tbody id="carritoItems">
            <% foreach (var item in CarritoItems) { %>
            <tr>
                <td><%= item.Nombre %></td>
                <td>$<%= item.Precio %></td>
                <td>
                    <button class="btn-eliminar" onclick="eliminarProducto('<%= item.Nombre %>')">Eliminar</button> <!-- Botón de eliminar -->
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <div class="total">
        <h2>Total: $<%= TotalCarrito %></h2>
    </div>

    <div id="paypal-button-container"></div> <!-- Contenedor centrado para el botón de PayPal -->

    <script>
        function eliminarProducto(nombre) {
            // Redirige a una URL con el producto a eliminar (ajusta según tu lógica)
            window.location.href = 'Carrito.aspx?eliminar=' + encodeURIComponent(nombre);
        }

        paypal.Buttons({
            createOrder: function(data, actions) {
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: '<%= TotalCarrito %>' // Usa el total del carrito como monto a pagar
                        }
                    }]
                });
            },
            onApprove: function (data, actions) {
                return actions.order.capture().then(function (details) {
                    alert('Pago realizado por ' + details.payer.name.given_name);
                    // Aquí puedes redirigir al usuario o realizar otras acciones
                });
            },
            onError: function (err) {
                console.error(err);
                alert('Ocurrió un error durante el pago. Por favor, inténtalo de nuevo.');
            }
        }).render('#paypal-button-container'); // Renderiza el botón en el contenedor
    </script>
</body>
</html>