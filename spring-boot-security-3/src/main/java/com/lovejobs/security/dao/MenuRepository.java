package com.lovejobs.security.dao;

import com.lovejobs.security.entity.MenuEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface MenuRepository extends JpaRepository<MenuEntity,Long>, JpaSpecificationExecutor<MenuEntity> {
}
