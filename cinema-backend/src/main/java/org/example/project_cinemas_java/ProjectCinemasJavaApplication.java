package org.example.project_cinemas_java;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling


public class ProjectCinemasJavaApplication {

    public static void main(String[] args) {
        SpringApplication.run(ProjectCinemasJavaApplication.class, args);

    }

}
