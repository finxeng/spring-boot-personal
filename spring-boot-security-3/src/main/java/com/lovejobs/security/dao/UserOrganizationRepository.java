package com.lovejobs.security.dao;

import com.lovejobs.security.entity.MenuEntity;
import com.lovejobs.security.entity.UserOrganizationEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface UserOrganizationRepository extends JpaRepository<UserOrganizationEntity,Long>, JpaSpecificationExecutor<UserOrganizationEntity> {
}
