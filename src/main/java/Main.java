
import java.util.ArrayList;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;

import spark.Spark;
import static spark.Spark.staticFiles;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.Version;

public class Main {

    public static void main(String[] args) {

        // Donde se encuentran las plantillas y CSS
        staticFiles.location("/templates");

        /// -------------------------------------- Practica 6---------------------------
        ProcessBuilder process = new ProcessBuilder();
        Integer port;
        if (process.environment().get("PORT") != null) {
            port = Integer.parseInt(process.environment().get("PORT"));
        } else {
            port = 4567;
        }
        Spark.port(port);

        ///-----------------------------------------------------------------------------


        // Dejando solo el "/" vacio, va a la carpeta de resources donde se encuentra las plantillas
        final Configuration configuration = new Configuration(new Version(2, 3, 0));
        configuration.setClassForTemplateLoading(Main.class, "/");

        // la Lista de estudiantes.
        ArrayList<Estudiantes> listaStudents = new ArrayList<Estudiantes>();

        // Plantilla de inicio
        Spark.get("/", (request, response) -> {
            Template inicioTemplate = configuration.getTemplate("templates/inicio.ftl");
            StringWriter writer = new StringWriter();

            Map<String, Object> attributes = new HashMap<>();
            attributes.put("listaStudents", listaStudents);
            attributes.put("listaSize", listaStudents.size() > 0);
            inicioTemplate.process(attributes, writer);
            return writer;
        });

        /**

         C R E A T E

        */
        // Metodo get para el create para que la plantilla salga al frente
        Spark.get("/Agregar", (request, response) -> {
            Template inicioTemplate = configuration.getTemplate("templates/create.ftl");
            return inicioTemplate;
        });

        // Metodo post para el create que redirecciona a la pagina de inicio
        Spark.post("/AgregarEst", (request, response) -> {
            StringWriter writer = new StringWriter();
            try {
                String matricula = request.queryParams("matricula");
                String nombre = request.queryParams("nombre");
                String apellido = request.queryParams("apellido");
                String telefono = request.queryParams("telefono");
                listaStudents.add(new Estudiantes(Integer.parseInt(matricula), nombre, apellido, telefono));
                response.redirect("/");
            }catch (Exception e){
                System.out.println(e);
                response.redirect("/Agregar");
            }
            return writer;
        });

        /**

         R E A D

         */

        Spark.get("/VisualizarEst/:id", (request, response) -> {
            Template resultTemplate = configuration.getTemplate("templates/read.ftl");
            StringWriter writer = new StringWriter();

            int id = Integer.parseInt(request.params("id"));

            Map<String, Object> atributos = new HashMap<>();
            atributos.put("Est", listaStudents.get(id));

            resultTemplate.process(atributos, writer);
            return writer;
        });


        /**

         U P D A T E

         */

        // Metodo get para la plantilla que edita
        Spark.get("/Modificar/:id", (request, response) -> {
            Template resultTemplate = configuration.getTemplate("templates/update.ftl");
            StringWriter writer = new StringWriter();

            int id = Integer.parseInt(request.params("id"));

            Map<String, Object> atributos = new HashMap<>();
            atributos.put("Est", listaStudents.get(id));

            resultTemplate.process(atributos, writer);
            return writer;
        });

        // Metodo post del UPDATE
        Spark.post("/ModificarEst", (request, response) -> {
            StringWriter writer = new StringWriter();

            try {
                String matricula = request.queryParams("matricula");
                String nombre = request.queryParams("nombre");
                String apellido = request.queryParams("apellido");
                String telefono = request.queryParams("telefono");
                Estudiantes estudiante = new Estudiantes(Integer.parseInt(matricula), nombre, apellido, telefono);
                for (Estudiantes est: listaStudents)
                {
                    if(est.getMatricula() == estudiante.getMatricula())
                    {
                        est.setNombre(estudiante.getNombre());
                        est.setApellido(estudiante.getApellido());
                        est.setMatricula(estudiante.getMatricula());
                        est.setTelefono(estudiante.getTelefono());
                        break;
                    }
                }
                response.redirect("/");
            }catch (Exception e){
                System.out.println("Hubo un error con " + e.toString());
                response.redirect("/");
            }
            return writer;
        });


        /**

         D E L E T E

         */

        Spark.get("/Eliminar/:id", (request, response) -> {
            StringWriter writer = new StringWriter();
            int id = Integer.parseInt(request.params("id"));

            listaStudents.remove(id);
            response.redirect("/");
            return writer;
        });


    }

}
