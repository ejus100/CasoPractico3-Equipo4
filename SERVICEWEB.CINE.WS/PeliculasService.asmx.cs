using SERVICEWEB.CINE.WS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace SERVICEWEB.CINE.WS
{
    /// <summary>
    /// Descripción breve de PeliculasService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class PeliculasService : System.Web.Services.WebService
    {

        [WebMethod]
        public string Bienvenido()
        {
            return "Este es nuestro service web somos el equipo 4";
        }
        [WebMethod(Description = "lista de Peliculas")]
        public List<Pelicula> ConsultarPeliculas()
        {
            CineEntities conexion = new CineEntities();
            var consulta = (from l in conexion.Peliculas select l).ToList();
            return consulta;
        }
        [WebMethod (Description ="Método para insertar una Pelicula")]
        public bool CreatePelicula(string titulo, string genero, string clasificacion, string duracion, int añoPublicacion)
        {
            try
            {
                using (CineEntities conexion = new CineEntities())
                {
                    Pelicula nuevaPelicula = new Pelicula();
                    nuevaPelicula.Id = Guid.NewGuid();
                    nuevaPelicula.Titulo = titulo;
                    nuevaPelicula.Genero = genero;
                    nuevaPelicula.Clasificacion = clasificacion;
                    nuevaPelicula.Duracion = duracion;
                    nuevaPelicula.AñoPublicacion = añoPublicacion;
                    conexion.Peliculas.Add(nuevaPelicula);
                    conexion.SaveChanges();
                    return true;

                }
            }
            catch (Exception e)
            {

                return false;
            }
       
        }

        [WebMethod (Description ="Modificar datos de una Pelicula")]
        public bool UpdatePelicula(Guid id, string titulo, string genero, string clasificacion, string duracion, int añoPublicacion)
        {
            try
            {
                using(CineEntities conexion = new CineEntities())
                {
                    var consulta = (from l in conexion.Peliculas where l.Id == id select l).FirstOrDefault();
                    if(consulta!=null)
                    {
                        consulta.Titulo = titulo;
                        consulta.Genero = genero;
                        consulta.Clasificacion = clasificacion;
                        consulta.Duracion = duracion;
                        consulta.AñoPublicacion = añoPublicacion;
                        conexion.SaveChanges();
                        return true;

                    }
                    else
                    {
                        return false;
                    }
                }

            }
            catch (Exception)
            {

               return false;
            }
        }

        [WebMethod (Description ="Eliminar una Pelicula")]  
        public bool DeletePelicula(Guid id)
        {
            try
            {
                using (CineEntities conexion = new CineEntities())
                {
                    var consulta = (from l in conexion.Peliculas where l.Id == id select l).FirstOrDefault();
                    if(consulta!=null)
                    {
                        conexion.Peliculas.Remove(consulta);
                        conexion.SaveChanges();
                        return true;
                    }
                    else
                    {
                        return false;
                    }

                }    

            }
            catch (Exception)
            {

                return false;
            }
        }
    }
}
