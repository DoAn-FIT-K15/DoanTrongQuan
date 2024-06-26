package org.example.project_cinemas_java.repository;

import org.example.project_cinemas_java.model.Actor;
import org.example.project_cinemas_java.model.Banner;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ActorRepo extends JpaRepository<Actor, Integer> {

    Actor findByImage(String img);

    Actor findByName(String name);

    Actor findBySlug(String slug);
}
