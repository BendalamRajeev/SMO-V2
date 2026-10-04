package com.rajeev.smo.repositories;

import com.rajeev.smo.models.StyleVariant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StyleVariantRepository extends JpaRepository<StyleVariant, Long> {
}