package org.example.project_cinemas_java.repository;

import org.example.project_cinemas_java.model.Food;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FoodRepo extends JpaRepository<Food, Integer> {
//    Food findByNameOfFood(String nameOfFood);
    boolean existsByNameOfFood(String nameOfFood);

    boolean existsByNameOfFoodAndIdNot(String nameOfFood, int foodId);

    Food getFoodByNameOfFood(String nameFood);

    Food findByNameOfFood(String name);
}
