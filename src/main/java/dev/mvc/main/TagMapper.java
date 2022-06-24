package dev.mvc.main;
 
import java.util.List;
import java.util.Map;
 
public interface TagMapper {
		int read(Map<String, Object> map);
        int add(Map<String, Object> map);
    	int delete(Map<String, Object> map);
    	List<String> readAll();
}
