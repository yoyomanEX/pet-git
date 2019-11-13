package com.web.service.impl._07;

import org.springframework.transaction.annotation.Transactional;

import com.web.model._01.AdminBean;

public interface AdminService07 {

	AdminBean checkAdminIdPassword(String userId, String password);

}