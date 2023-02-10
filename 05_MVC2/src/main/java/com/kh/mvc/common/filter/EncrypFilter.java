package com.kh.mvc.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;

import com.kh.mvc.common.EncryptPasswordWrapper;

@WebFilter(filterName = "encrypy", servletNames = { "login", "enroll" })
public class EncrypFilter extends HttpFilter implements Filter {

	public EncrypFilter() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("암호화 필터 적용");
		// request 객체의 파라미터 값은 직접 수정할 수 없다.
		// 서블릿 래퍼클래스를 이용
		EncryptPasswordWrapper wrapper = new EncryptPasswordWrapper((HttpServletRequest) request);

		// request 대신 wrapper를 넘겨줌
		chain.doFilter(wrapper, response);
	}

}
