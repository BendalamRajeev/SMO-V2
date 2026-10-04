package com.rajeev.smo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rajeev.smo.models.EmployeeLogin;

public interface EmployeeLoginRepository extends JpaRepository<EmployeeLogin, Long> {
}
