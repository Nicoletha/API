<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="API.Productos" %>

<!DOCTYPE html>
<html>
<head>
    <title>Tienda Online - Productos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .product-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            padding: 20px;
        }
        .product {
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 5px;
            text-align: center;
        }
        .product img {
            max-width: 100%;
            height: auto;
        }
        .product h3 {
            font-size: 1.5em;
        }
        .product p {
            font-size: 1em;
            color: #666;
        }
        .product button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .product button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Nuestros Productos</h1>
    <div class="product-container">
        <%-- Producto 1 --%>
        <div class="product">
            <img src="C:\Users\nicol\Downloads\API\API\img\th (1).jpeg" alt="Producto 1" />
            <h3>Producto 1</h3>
            <p>Materiales: Algodón, Poliéster</p>
            <p>Precio: $20.00</p>
            <p>Descripción: Camiseta de alta calidad</p>
            <button onclick="location.href='Carrito.aspx?prod=Producto1&precio=20'">Agregar al Carrito</button>
        </div>

        <%-- Producto 2 --%>
        <div class="product">
            <img src="C:\Users\nicol\Downloads\API\API\img\bolso.jpg" alt="Producto 2" />
            <h3>Producto 2</h3>
            <p>Materiales: Cuero</p>
            <p>Precio: $50.00</p>
            <p>Descripción: Bolso de cuero genuino</p>
            <button onclick="location.href='Carrito.aspx?prod=Producto2&precio=50'">Agregar al Carrito</button>
        </div>

        <%-- Producto 3 --%>
        <div class="product">
            <img src="C:\Users\nicol\Downloads\API\API\img\reloj.jpg" alt="Producto 3" />
            <h3>Producto 3</h3>
            <p>Materiales: Metal, Plástico</p>
            <p>Precio: $15.00</p>
            <p>Descripción: Reloj deportivo</p>
            <button onclick="location.href='Carrito.aspx?prod=Producto3&precio=15'">Agregar al Carrito</button>
        </div>

        <%-- Producto 4 --%>
        <div class="product">
            <img src="C:\Users\nicol\Downloads\API\API\img\Lampara.jpg" alt="Producto 4" />
            <h3>Producto 4</h3>
            <p>Materiales: Vidrio</p>
            <p>Precio: $10.00</p>
            <p>Descripción: Vaso elegante</p>
            <button onclick="location.href='Carrito.aspx?prod=Producto4&precio=10'">Agregar al Carrito</button>
        </div>

        <%-- Producto 5 --%>
        <div class="product">
            <img src="C:\Users\nicol\Downloads\API\API\img\audifonos.jpg" alt="Producto 5" />
            <h3>Producto 5</h3>
            <p>Materiales: Plástico, Metal</p>
            <p>Precio: $30.00</p>
            <p>Descripción: Auriculares inalámbricos</p>
            <button onclick="location.href='Carrito.aspx?prod=Producto5&precio=30'">Agregar al Carrito</button>
        </div>
    </div>
</body>
</html>
