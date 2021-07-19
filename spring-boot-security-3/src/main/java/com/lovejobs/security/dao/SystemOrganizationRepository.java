package com.lovejobs.security.dao;

import com.lovejobs.security.entity.SystemOrganizationEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface SystemOrganizationRepository extends JpaRepository<SystemOrganizationEntity,Long>, JpaSpecificationExecutor<SystemOrganizationEntity> {
}
