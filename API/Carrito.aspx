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
            </tr>
        </thead>
        <tbody id="carritoItems">
            <% foreach (var item in CarritoItems) { %>
            <tr>
                <td><%= item.Nombre %></td>
                <td>$<%= item.Precio %></td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <div class="total">
        <h2>Total: $<%= TotalCarrito %></h2>
        <div id="paypal-button-container"></div>
    </div>

    <script>
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
