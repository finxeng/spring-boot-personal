package com.lovejobs.security.dao;

import com.lovejobs.security.entity.SystemMenuEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface SystemMenuRepository extends JpaRepository<SystemMenuEntity,Long>, JpaSpecificationExecutor<SystemMenuEntity> {
}
