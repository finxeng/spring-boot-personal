package com.lovejobs.security.dao;

import com.lovejobs.security.entity.SystemUserOrganizationEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface SystemUserOrganizationRepository extends JpaRepository<SystemUserOrganizationEntity,Long>, JpaSpecificationExecutor<SystemUserOrganizationEntity> {
}
