package com.rajeev.smo.repositories;

import com.rajeev.smo.models.Grn;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GrnRepository extends JpaRepository<Grn, Long> {
}