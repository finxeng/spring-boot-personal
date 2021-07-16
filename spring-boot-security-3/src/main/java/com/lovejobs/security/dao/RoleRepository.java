package com.lovejobs.security.dao;

import com.lovejobs.security.entity.RoleEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface RoleRepository extends JpaRepository<RoleEntity,Long>, JpaSpecificationExecutor<RoleEntity> {
}
