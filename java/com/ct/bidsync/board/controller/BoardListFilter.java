package com.ct.bidsync.board.controller;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Servlet Filter implementation class BoardListFilter
 */
@WebFilter("/list.bo")
public class BoardListFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public BoardListFilter() {
        super();
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("리스트 필터 통과");
		
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpServletResponse httpResponse = (HttpServletResponse)response;
		
		// 카테고리값
		String ctg = request.getParameter("ctg");
		String ctgName = "";
		
		switch(ctg ) {
		case "fashion" :
			ctgName = "패션";
			break;
		case "digital" :
			ctgName = "디지털 · 가전";
			break;
		case "sport" :
			ctgName = "스포츠";
			break;
		case "deco" :
			ctgName = "홈 · 데코";
			break;
		case "toy" :
			ctgName = "완구";
			break;
		case "art" :
			ctgName = "미술";
			break;
		case "jewelry" :
			ctgName = "쥬얼리";
			break;
		default :
			request.setAttribute("errorMsg", "잘못된 접근입니다.");
			request.setAttribute("responseURL", httpRequest.getContextPath());
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		// 핕터값 (테스트중)
		String sqlType = "";
		sqlType = request.getParameter("sql");
		if(sqlType == null) {
			sqlType = "selectListCount";
		}
		
		
		request.setAttribute("sqlType", sqlType);
		request.setAttribute("ctgName", ctgName);
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {}

}
