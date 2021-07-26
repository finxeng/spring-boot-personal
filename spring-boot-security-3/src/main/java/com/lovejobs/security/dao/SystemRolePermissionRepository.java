package com.lovejobs.security.dao;

import com.lovejobs.security.dto.SystemRolePermissionDTO;
import com.lovejobs.security.entity.SystemRolePermissionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * @author fengxin
 * @version 1.0
 * @description: TODO
 * @date 2021/7/26 16:20
 */
public interface SystemRolePermissionRepository extends JpaRepository<SystemRolePermissionEntity,Long>, JpaSpecificationExecutor<SystemRolePermissionEntity> {

    @Query(value = "select new com.lovejobs.security.dto.SystemRolePermissionDTO(r.roleCode,r.roleName,p.url) " +
            "from com.lovejobs.security.entity.SystemPermissionEntity p " +
            "left join com.lovejobs.security.entity.SystemRolePermissionEntity rp on p.id = rp.permissionId " +
            "left join com.lovejobs.security.entity.SystemRoleEntity r on rp.roleId=r.id")
    List<SystemRolePermissionDTO> findAllRolePermission();
}
