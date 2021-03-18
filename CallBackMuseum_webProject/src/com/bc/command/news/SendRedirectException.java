package com.bc.command.news;

public class SendRedirectException extends RuntimeException {
	private static final long serialVersionUID = 1L;
	
	private String path;
	
	public SendRedirectException(String path) {
		super("리다이렉트 처리");
		this.path = path;
	}
	
	public String getPath() {
		return path;
	}
}
