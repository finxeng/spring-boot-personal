package com.lovejobs.security.dao;

import com.lovejobs.security.entity.OrganizationEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface OrganizationRepository extends JpaRepository<OrganizationEntity,Long>, JpaSpecificationExecutor<OrganizationEntity> {
}
