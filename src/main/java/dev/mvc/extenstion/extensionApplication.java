package dev.mvc.extenstion;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages= {"dev.mvc.*"})
public class extensionApplication {

	public static void main(String[] args) {
		SpringApplication.run(extensionApplication.class, args);
	}

}
