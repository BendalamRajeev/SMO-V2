package com.rajeev.smo.repositories;

import com.rajeev.smo.models.Qc;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface QcRepository extends JpaRepository<Qc, Long> {
}