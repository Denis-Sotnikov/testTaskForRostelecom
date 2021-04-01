package store;

import java.util.Map;

public interface Store {
    Map<Integer, String> findAll();
    String getInfo(String number);
}
