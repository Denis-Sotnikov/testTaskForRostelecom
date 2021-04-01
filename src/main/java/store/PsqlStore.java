package store;

import org.apache.commons.dbcp2.BasicDataSource;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.*;
import java.util.*;

public class PsqlStore implements Store {

    private final BasicDataSource pool = new BasicDataSource();

    public PsqlStore() {
        Properties cfg = new Properties();
        try (BufferedReader io = new BufferedReader(
                new FileReader("db.properties")
        )) {
            cfg.load(io);
        } catch (Exception e) {
            throw new IllegalStateException(e);
        }
        try {
            Class.forName(cfg.getProperty("jdbc.driver"));
        } catch (Exception e) {
            throw new IllegalStateException(e);
        }
        pool.setDriverClassName("org.postgresql.Driver");
        pool.setUrl("jdbc:postgresql://localhost:5433/rostelecom");
        pool.setUsername(cfg.getProperty("jdbc.username"));
        pool.setPassword(cfg.getProperty("jdbc.password"));
        pool.setMinIdle(5);
        pool.setMaxIdle(10);
        pool.setMaxOpenPreparedStatements(100);
    }

    private static final class Lazy {
        private static final Store INST = new PsqlStore();
    }

    public static Store instOf() {
        return Lazy.INST;
    }

    @Override
    public Map<Integer, String> findAll() {
        Map<Integer, String> catalogTsvetov = new HashMap<>();
        try (Connection cn = pool.getConnection();
             PreparedStatement ps = cn.prepareStatement("select * from tsveta")
        ) {
            try (ResultSet it = ps.executeQuery()) {
                while (it.next()) {
                    catalogTsvetov.put(it.getInt("color_number"), it.getString("name").replaceAll(" ", ""));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return catalogTsvetov;
    }
    @Override
    public String getInfo(String number) {
        String name = "";
        try
         {
            Connection cn = pool.getConnection();
            CallableStatement ps = cn.prepareCall("call getInfo(?, ?)");
            ps.setString(1, number);
            ps.setString(2, name);
            ps.registerOutParameter(2, Types.VARCHAR);
            ps.execute();
            name = ps.getString(2);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return name;
    }
}
