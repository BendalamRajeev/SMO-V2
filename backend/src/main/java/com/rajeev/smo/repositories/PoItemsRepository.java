package com.rajeev.smo.repositories;

import com.rajeev.smo.models.PoItems;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PoItemsRepository extends JpaRepository<PoItems, Long> {
}