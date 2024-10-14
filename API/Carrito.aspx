<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="API.Carrito" %>

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
        <button class="btn-pagar" onclick="location.href='<%= PayPalUrl %>'">Pagar con PayPal</button>
    </div>
</body>
</html>