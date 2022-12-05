import co.aurasphere.gomorrasql.GomorraSqlInterpreter;
import co.aurasphere.gomorrasql.model.GomorraSqlQueryResult;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class Main {
    public static void main(String[] args) {
        System.out.println("Hello world!");

    String url="jdbc:mysql://localhost:3306/myeventdiego";
    String usr = "root";
    String pwd = "";

    String firstQuery = "ripigliammo tutto chillo ch'era 'o nuostro mmiez 'a events";

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection sqlConnection = DriverManager.getConnection(url,usr,pwd);
        GomorraSqlInterpreter gomorraSqlInterpreter = new GomorraSqlInterpreter(sqlConnection);
        GomorraSqlQueryResult gomorraSqlQueryResult = gomorraSqlInterpreter.execute(firstQuery);
        ResultSet resultSet = gomorraSqlQueryResult.getResultSet();
        while (resultSet.next()){
            System.out.println(resultSet.getString(1) + " | " + resultSet.getString(2));
        }
        sqlConnection.close();

    } catch (Exception e){
        System.out.println(e);
    }
}

}