package dev.mvc.main;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("dev.mvc.review.TagServiceImpl")
public class TagServiceImpl implements TagService {
	@Autowired
	private TagMapper mapper;

	@Override
	public int add(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.add(map);
	}


	@Override
	public int delete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.delete(map);
	}


	@Override
	public int read(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.read(map);
	}


	@Override
	public List<String> readAll() {
		// TODO Auto-generated method stub
		return mapper.readAll();
	}

}
