package com.lovejobs.security.dao;

import com.lovejobs.security.entity.RoleMenuEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface RoleMenuRepository extends JpaRepository<RoleMenuEntity,Long>, JpaSpecificationExecutor<RoleMenuEntity> {
}
