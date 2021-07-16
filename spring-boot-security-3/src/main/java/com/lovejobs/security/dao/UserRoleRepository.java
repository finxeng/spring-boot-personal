package com.lovejobs.security.dao;

import com.lovejobs.security.entity.UserRoleEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface UserRoleRepository extends JpaRepository<UserRoleEntity,Long>, JpaSpecificationExecutor<UserRoleEntity> {
}
