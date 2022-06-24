package dev.mvc.main;

import java.util.List;
import java.util.Map;

public interface TagService {//요청할 수 있는 인터페이스 선언돼있음(dao 형식)
	int read(Map<String, Object> map);
	int add(Map<String, Object> map);
	int delete(Map<String, Object> map);
	List<String> readAll();
}

