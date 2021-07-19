package com.lovejobs.security.dao;

import com.lovejobs.security.entity.SystemUserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface SystemUserRepository extends JpaRepository<SystemUserEntity,Long>, JpaSpecificationExecutor<SystemUserEntity> {

    SystemUserEntity findByUserName(String userName);
}
