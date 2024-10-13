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
@WebFilter({"/list.bo", "/detail.bo"})
public class BoardFilter extends HttpFilter implements Filter {
       
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * @see HttpFilter#HttpFilter()
     */
    public BoardFilter() {
        super();
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	@SuppressWarnings("null")
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("리스트 필터 통과");
		
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpServletResponse httpResponse = (HttpServletResponse)response;
		
		// 카테고리값
		String ctg = request.getParameter("ctg");
		String ctgName = "";
		
		switch(ctg) {
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
			// ctg값이 없거나 잘못된 URL로 접근하면 errorPage로 이동
			request.setAttribute("errorMsg", "잘못된 접근입니다.");
			request.setAttribute("responseURL", httpRequest.getContextPath());
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		// 핕터값
		// 넘겨받은 값에 따라 판별 -> Controller로 전달 -> Dao에서 사용
		String type = "%";
		String typeArr[] = request.getParameterValues("type");
		if(typeArr != null && typeArr.length == 1) {
			if("경매".equals(String.valueOf(typeArr[0]))) {
				type = "경매";
			}
			else {
				type = "중고";
			}
		}
		
		String status = "Y";
		if("N".equals(request.getParameter("status"))) {
			System.out.println(request.getParameter(status));
			status = "%";
		}
		
		// 전달 -> 이동
		request.setAttribute("ctgName", ctgName);
		request.setAttribute("type", type);
		request.setAttribute("status", status);
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {}

}
