package apis;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONException;
import javax.swing.table.DefaultTableModel;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import javax.swing.table.DefaultTableModel;


public class api_cliente {

    private String url_api = "https://localhost:5001/api/clientes";

    private String get() {
        String salida = "";
        try {
            URL url = new URL(url_api);
            HttpURLConnection c_api = (HttpURLConnection) url.openConnection();
            c_api.setRequestMethod("GET");
            c_api.setRequestProperty("Accept", "application/json");
            if (c_api.getResponseCode() == 200) {
                InputStreamReader entrada = new InputStreamReader(c_api.getInputStream());
                BufferedReader lectura = new BufferedReader(entrada);
                salida = lectura.readLine();
            } else {
                salida = "";
                System.out.println("No se puede conectar a la api : " + c_api.getResponseCode());

            }

            c_api.disconnect();

        } catch (IOException ex) {
            System.out.println("Error api:" + ex.getMessage());
        }
        return salida;
    }

    public DefaultTableModel leer() {
        DefaultTableModel tabla = new DefaultTableModel();
        try {
            String encabezado[] = {"id", "Nombre", "Apellido", "Direccion", "Telefono", "Id Puesto", "DPI","Fecha de Nacimeinto","Fecha de Ingreso de Registro"};
            tabla.setColumnIdentifiers(encabezado);
            String datos[] = new String[9];
            JSONArray arreglo = new JSONArray(get());
            for (int indice = 0; indice < arreglo.length(); indice++) {
                JSONObject atributo = arreglo.getJSONObject(indice);
                datos[0] = String.valueOf(atributo.getInt("id_puesto"));
                datos[1] = atributo.getString("nombre");
                datos[2] = atributo.getString("apellido");
                datos[3] = atributo.getString("direccion");
                datos[4] = atributo.getString("telefono");
                datos[5] = atributo.getString("id_puesto");
                datos[6] = atributo.getString("dpi");
                datos[7] = atributo.getString("fecha_nacimiento");
                datos[8] = atributo.getString("fecha_ingreso");
                tabla.addRow(datos);
            }
        } catch (JSONException ex) {
            System.out.println("Error tabla:" + ex.getMessage());
        }
        return tabla;
    }

    public int post() {
        int salida = 0;
        try {
            URL url = new URL(url_api);
            HttpURLConnection c_api = (HttpURLConnection) url.openConnection();
            c_api.setRequestMethod("POST");
            c_api.setRequestProperty("Content-Type", "application/json; utf-8");
            // c_api.setRequestProperty("Accept", "application/json");
            c_api.setDoOutput(true);
            String jsonS = "{}";
            OutputStream os = c_api.getOutputStream();
            os.write(jsonS.getBytes());
            os.flush();

            if (c_api.getResponseCode() == 200) {

                salida = 1;

            } else {

                System.out.println("No se puede conectar a la api : " + c_api.getResponseCode());

            }

            c_api.disconnect();

        } catch (IOException ex) {

            System.out.println("Error api:" + ex.getMessage());
        }
        return salida;

    }
     public int get() {
        int salida = 0;
        try {
            URL url = new URL(url_api);
            HttpURLConnection c_api = (HttpURLConnection) url.openConnection();
            c_api.setRequestMethod("GET");
            c_api.setRequestProperty("Content-Type", "application/json; utf-8");
            // c_api.setRequestProperty("Accept", "application/json");
            c_api.setDoOutput(true);
            String jsonS = "{}";
            OutputStream os = c_api.getOutputStream();
            os.write(jsonS.getBytes());
            os.flush();

            if (c_api.getResponseCode() == 200) {

                salida = 1;

            } else {

                System.out.println("No se puede conectar a la api : " + c_api.getResponseCode());

            }

            c_api.disconnect();

        } catch (IOException ex) {

            System.out.println("Error api:" + ex.getMessage());
        }
        return salida;

    }
      public int delete() {
        int salida = 0;
        try {
            URL url = new URL(url_api);
            HttpURLConnection c_api = (HttpURLConnection) url.openConnection();
            c_api.setRequestMethod("DELETE");
            c_api.setRequestProperty("Content-Type", "application/json; utf-8");
            // c_api.setRequestProperty("Accept", "application/json");
            c_api.setDoOutput(true);
            String jsonS = "{}";
            OutputStream os = c_api.getOutputStream();
            os.write(jsonS.getBytes());
            os.flush();

            if (c_api.getResponseCode() == 200) {

                salida = 1;

            } else {

                System.out.println("No puede conectar a la api : " + c_api.getResponseCode());

            }

            c_api.disconnect();

        } catch (IOException ex) {

            System.out.println("Error api:" + ex.getMessage());
        }
        return salida;

    }

}
