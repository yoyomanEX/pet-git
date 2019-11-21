package com.web.model._01.validators;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.web.model._01.MemberBean;
@Component
public class MemberValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		boolean b = MemberBean.class.isAssignableFrom(clazz);
		return b;
	}

	@Override
	public void validate(Object target, Errors errors) {
		MemberBean memberBean = (MemberBean)target; 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_Id", "member.account.not.empty","帳號欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "member.account.not.empty","暱稱欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "member.account.not.empty","email欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "member.account.not.empty","密碼欄不能空白");
		if(!memberBean.getMember_Id().isEmpty()) {
			if(memberBean.getMember_Id().length()<6 || memberBean.getMember_Id().length()>12) {
				errors.rejectValue("member_Id","", "帳號欄須介於6~12個字元");
			}
			String[] list1 = new String[] {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
			String[] list2 = new String[] {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"};
			String[] list3 = new String[] {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};
			boolean f1 = false;
			for(String s1:list1) {
				if(memberBean.getMember_Id().contains(s1)) {
					f1=true;
				}
			}
			if(!f1) {
				errors.rejectValue("member_Id","", "帳號欄須包含數字");
			}
			boolean f2 = false;
			for(String s2:list2) {
				if(memberBean.getMember_Id().contains(s2)) {
					f2=true;
				}
			}
			if(!f2) {
				errors.rejectValue("member_Id","", "帳號欄須包含小寫英文字母");
			}
			boolean f3 = false;
			for(String s3:list3) {
				if(memberBean.getMember_Id().contains(s3)) {
					f3=true;
				}
			}
			if(!f3) {
				errors.rejectValue("member_Id","", "帳號欄須包含大寫英文字母");
			}
		}
		if(!memberBean.getPassword().isEmpty()) {
			if(memberBean.getPassword().length()<8 || memberBean.getPassword().length()>16) {
				errors.rejectValue("password","", "密碼欄須介於8~16個字元");
			}
			//~!@#$%^&*
			String[] list = new String[] {"~","!","@","#","$","%","^","&","*"};
			boolean f1 = false;
			for(String ss:list) {
				if(memberBean.getPassword().contains(ss)) {
					f1=true;
				}
			}
			if(!f1) {
				errors.rejectValue("password","", "密碼欄須包含一個特殊字元(~!@#$%^&*)");
			}
			if (!memberBean.getPassword().equals(memberBean.getCheckPassword())) {
				errors.rejectValue("checkPassword", "", "要與密碼欄一致");
			}
		}
		if(!memberBean.getName().isEmpty()) {
			if(memberBean.getName().length()<3) {
				errors.rejectValue("name","", "暱稱欄不能小於三個字元");
			}
		}
		if(!memberBean.getEmail().isEmpty()) {
			if(!memberBean.getEmail().contains("@")) {
				errors.rejectValue("email","", "Email格式錯誤.");
			}
		}
	}

}
