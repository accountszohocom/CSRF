//$Id$
package com.advenent.actions;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements ServletRequestAware{
	private static final long serialVersionUID = 1L;
	public HttpServletRequest request;
	DbStoreValue dbstorevalue=new DbStoreValue();
	
	public String execute() throws Exception{
		System.out.println("Execute");
		String dbvalue=dbstorevalue.list(request);
		return "Success";
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
		
	}
	

}
