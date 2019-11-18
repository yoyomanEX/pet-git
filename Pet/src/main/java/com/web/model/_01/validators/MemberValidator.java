package com.web.model._01.validators;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.web.model._01.MemberBean;

public class MemberValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		boolean b = MemberBean.class.isAssignableFrom(clazz);
		return b;
	}

	@Override
	public void validate(Object target, Errors errors) {
		MemberBean memberBean = (MemberBean)target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "account", "member.account.not.empty","帳號欄不能空白(預設值)");
		
	}

}
