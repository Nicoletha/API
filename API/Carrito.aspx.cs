using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace API
{
    public partial class Carrito : System.Web.UI.Page
    {
        public List<Producto> CarritoItems { get; set; }
        public decimal TotalCarrito { get; set; }
        public string PayPalUrl { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Carrito"] == null)
            {
                Session["Carrito"] = new List<Producto>();
            }

            // Obtiene el carrito de la sesión
            CarritoItems = Session["Carrito"] as List<Producto>;

            // Si hay un nuevo producto para agregar
            if (!string.IsNullOrEmpty(Request.QueryString["prod"]) && !string.IsNullOrEmpty(Request.QueryString["precio"]))
            {
                string nombreProducto = Request.QueryString["prod"];
                decimal precioProducto = Convert.ToDecimal(Request.QueryString["precio"]);

                // Agregar el producto al carrito
                CarritoItems.Add(new Producto { Nombre = nombreProducto, Precio = precioProducto });

                Session["Carrito"] = CarritoItems; // Actualiza la sesión
            }

            // Si hay un producto para eliminar
            if (!string.IsNullOrEmpty(Request.QueryString["eliminar"]))
            {
                string nombreEliminar = Request.QueryString["eliminar"];
                CarritoItems.RemoveAll(item => item.Nombre == nombreEliminar); // Elimina el producto por nombre
            }

            Session["Carrito"] = CarritoItems; // Actualiza la sesión

            // Calcular el total
            TotalCarrito = 0;
            foreach (var item in CarritoItems)
            {
                TotalCarrito += item.Precio;
            }

            // URL de PayPal para pagos
            PayPalUrl = $"https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&business=tu-email@paypal.com&item_name=Compra&amount={TotalCarrito}&currency_code=USD";
        }

        // Clase para representar un producto
        public class Producto
        {
            public string Nombre { get; set; }
            public decimal Precio { get; set; }
        }
    }
}