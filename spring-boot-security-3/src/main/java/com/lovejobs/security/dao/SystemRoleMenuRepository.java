package com.lovejobs.security.dao;

import com.lovejobs.security.dto.SystemRoleMenuDTO;
import com.lovejobs.security.entity.SystemRoleMenuEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface SystemRoleMenuRepository extends JpaRepository<SystemRoleMenuEntity,Long>, JpaSpecificationExecutor<SystemRoleMenuEntity> {

    @Query(value = "select new com.lovejobs.security.dto.SystemRoleMenuDTO(r.roleCode,r.roleName,m.menuName,m.menuPath,m.menuUrl) from com.lovejobs.security.entity.SystemRoleMenuEntity role_menu " +
                   "left join com.lovejobs.security.entity.SystemRoleEntity r on role_menu.roleId = r.id " +
                   "left join com.lovejobs.security.entity.SystemMenuEntity m on role_menu.menuId = m.id where m.enabled=true")
    List<SystemRoleMenuDTO> findALLRoleMenu();
}
