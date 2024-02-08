package com.skilldistillery.gamequest;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.skilldistillery.gamequest.data", "com.skilldistillery.service", "com.skilldistillery.gamequest.controllers"})
public class BootGameQuestApplication {

	public static void main(String[] args) {
		SpringApplication.run(BootGameQuestApplication.class, args);
	}

}
