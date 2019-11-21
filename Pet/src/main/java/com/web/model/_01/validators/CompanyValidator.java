package com.web.model._01.validators;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.web.model._01.CompanyBean;
@Component
public class CompanyValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		boolean b = CompanyBean.class.isAssignableFrom(clazz);
		return b;
	}

	@Override
	public void validate(Object target, Errors errors) {
		CompanyBean companyBean = (CompanyBean)target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "company_id", "company_id.not.empty","帳號欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "company_name", "company_name.not.empty","暱稱欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "company_email", "company_email.not.empty","email欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "company_password", "company_password.not.empty","密碼欄不能空白");
		if(!companyBean.getCompany_id().isEmpty()) {
			if(companyBean.getCompany_id().length()<6 || companyBean.getCompany_id().length()>12) {
				errors.rejectValue("company_id","", "帳號欄須介於6~12個字元");
			}
			String[] list1 = new String[] {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
			String[] list2 = new String[] {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"};
			String[] list3 = new String[] {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};
			boolean f1 = false;
			for(String s1:list1) {
				if(companyBean.getCompany_id().contains(s1)) {
					f1=true;
				}
			}
			if(!f1) {
				errors.rejectValue("company_id","", "帳號欄須包含數字");
			}
			boolean f2 = false;
			for(String s2:list2) {
				if(companyBean.getCompany_id().contains(s2)) {
					f2=true;
				}
			}
			if(!f2) {
				errors.rejectValue("company_id","", "帳號欄須包含小寫英文字母");
			}
			boolean f3 = false;
			for(String s3:list3) {
				if(companyBean.getCompany_id().contains(s3)) {
					f3=true;
				}
			}
			if(!f3) {
				errors.rejectValue("company_id","", "帳號欄須包含大寫英文字母");
			}
		}
		if(!companyBean.getCompany_password().isEmpty()) {
			if(companyBean.getCompany_password().length()<8 || companyBean.getCompany_password().length()>16) {
				errors.rejectValue("company_password","", "密碼欄須介於8~16個字元");
			}
			//~!@#$%^&*
			String[] list = new String[] {"~","!","@","#","$","%","^","&","*"};
			boolean f1 = false;
			for(String ss:list) {
				if(companyBean.getCompany_password().contains(ss)) {
					f1=true;
				}
			}
			if(!f1) {
				errors.rejectValue("company_password","", "密碼欄須包含一個特殊字元(~!@#$%^&*)");
			}
			if (!companyBean.getCompany_password().equals(companyBean.getCheckPassword())) {
				errors.rejectValue("checkPassword", "", "要與密碼欄一致");
			}
		}
		if(!companyBean.getCompany_name().isEmpty()) {
			if(companyBean.getCompany_name().length()<3) {
				errors.rejectValue("company_name","", "暱稱欄不能小於三個字元");
			}
		}
		if(!companyBean.getCompany_email().isEmpty()) {
			if(!companyBean.getCompany_email().contains("@")) {
				errors.rejectValue("company_email","", "Email格式錯誤.");
			}
		}		
	}

}
