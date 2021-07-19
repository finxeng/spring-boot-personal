package com.lovejobs.security.dao;

import com.lovejobs.security.entity.SystemRoleEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface SystemRoleRepository extends JpaRepository<SystemRoleEntity,Long>, JpaSpecificationExecutor<SystemRoleEntity> {

    @Query(value = "select r.* from user left join user_role ur on user.id = ur.user_id left join role r on ur.role_id = r.id where ur.user_id=?", nativeQuery = true)
    List<SystemRoleEntity> queryRoleByUserId(Long userId);
}
