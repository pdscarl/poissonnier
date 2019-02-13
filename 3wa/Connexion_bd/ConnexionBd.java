package bd;

import java.sql.*;

// https://openclassrooms.com/courses/creez-votre-application-web-avec-java-ee/communiquez-avec-votre-bdd

public class ConnexionBd {

    String url = "jdbc:mysql://localhost/forumofi?useSSL=false";
    String login = "root";
    String password = "troiswa";

    Connection cn = null;
    Statement st = null;

    public void connect(){

        try {
            // charger le driver
            Class.forName("com.mysql.jdbc.Driver");

            // se connecter à la base de donnée
            cn = DriverManager.getConnection(url, login, password);
            st = cn.createStatement();

        }catch (SQLException ex){
            ex.printStackTrace();
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }


    public void close(){
        try {
            st.close();
            cn.close();
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }

    public void execute(String requetteSql) throws Exception{

        if(st == null){
            connect();
        }

        /* Exécution d'une requête de lecture */
        ResultSet resultat = st.executeQuery( "SELECT *  FROM groupe;" );

        /* Récupération des données du résultat de la requête de lecture */
        while ( resultat.next() ) {
            String nom = resultat.getString( "id" );

            System.out.println(nom);

            /* Traiter ici les valeurs récupérées. */
        }

        //close();
    }

    public void executeReq(String requetteSql) throws Exception{

        if(cn == null){
            connect();
        }

        //* Création de l'objet gérant les requêtes préparées */
        PreparedStatement preparedStatement = cn.prepareStatement( "INSERT INTO toto (id,nom) VALUES(?, ?);" );

        /*
         * Remplissage des paramètres de la requête grâce aux méthodes
         * setXXX() mises à disposition par l'objet PreparedStatement.
         */
        preparedStatement.setInt( 1, 8 );
        preparedStatement.setString( 2, "nom ins" );

        /* Exécution de la requête */

        // INSERT INTO toto (id,nom) VALUES(8, "nom ins");

        int statut = preparedStatement.executeUpdate();
        System.out.println(statut);

        preparedStatement.close();
        close();
    }
}
