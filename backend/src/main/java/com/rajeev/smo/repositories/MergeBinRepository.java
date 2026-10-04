package com.rajeev.smo.repositories;

import com.rajeev.smo.models.MergeBin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MergeBinRepository extends JpaRepository<MergeBin, Long> {
}