//_07廠商用 excel表下載
package com.web.viewresolver;

import java.util.Locale;

import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;

import com.web.view.MultipleOrdersExcelView;


public class ExcelViewResolver implements ViewResolver{

	@Override
	public View resolveViewName(String viewName, Locale locale) throws Exception {
		
		View view = null;
		if (viewName.startsWith("_07/showOrders")) {
			view = new MultipleOrdersExcelView();
		}
//		 else if (viewName.startsWith("_01/cnvr/displayMember"))  {
//			view = new MultipleOrdersExcelView();
//		} 
		System.out.println("ExcelViewResolver, viewName=" + viewName + ", return value=" + view);
		return view;
      }
	
}