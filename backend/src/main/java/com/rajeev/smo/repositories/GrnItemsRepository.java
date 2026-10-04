package com.rajeev.smo.repositories;

import com.rajeev.smo.models.GrnItems;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GrnItemsRepository extends JpaRepository<GrnItems, Long> {
}