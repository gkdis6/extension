package dev.mvc.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TagController {
	@Autowired
	@Qualifier("dev.mvc.review.TagServiceImpl")
	private TagService service;
 
	
	@GetMapping("/")
	public String main(){
		
		return "index";

	}
	
 	@PostMapping("/add")
 	@ResponseBody
	public Map<String, Object> events(@RequestBody Map<String, Object> map){
 		int flag = service.read(map);
 		System.out.println(map);
 		String tag = (String) map.get("tag");
 		System.out.println(tag);
 		tag = tag.toLowerCase();
 		tag = tag.replaceAll(" ", "");
 		tag = tag.replaceAll("[^a-zA-Z0-9]","");
 		System.out.println(tag);
 		map.put("tag", tag);
 		if(flag>0) {
 			service.delete(map);
 		}else {
 			service.add(map);
 		}
		return map;
	}
 	
 	@PostMapping("/read")
 	@ResponseBody
	public Map<String, Object> read(@RequestBody Map<String, Object> map){
 		List list = service.readAll();
 		map.put("list", list);
 		
		return map;
	}
}
