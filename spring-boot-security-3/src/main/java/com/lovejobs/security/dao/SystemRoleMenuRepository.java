package com.lovejobs.security.dao;

import com.lovejobs.security.entity.SystemRoleMenuEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface SystemRoleMenuRepository extends JpaRepository<SystemRoleMenuEntity,Long>, JpaSpecificationExecutor<SystemRoleMenuEntity> {
}
