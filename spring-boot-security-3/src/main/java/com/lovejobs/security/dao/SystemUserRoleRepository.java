package com.lovejobs.security.dao;

import com.lovejobs.security.entity.SystemUserRoleEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface SystemUserRoleRepository extends JpaRepository<SystemUserRoleEntity,Long>, JpaSpecificationExecutor<SystemUserRoleEntity> {
}
