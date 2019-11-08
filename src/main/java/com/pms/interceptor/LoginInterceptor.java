package com.pms.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.pms.entity.User;

public class LoginInterceptor implements HandlerInterceptor {

	/**
	 * 
	 * @Title: preHandle
	 * @Description: 该方法在Controller业务方法执行之前执行，其返回值为boolean类型。
	 *               则紧接着会执行controller方法，且会将afterCompletion()方法压栈进入入到一个专门的方法栈中等待执行。
	 *               该方法主要用于准备资源数据，然后把它们当做请求属性放到webRequest中。
	 * @param: request
	 * @param: response
	 * @param: handler
	 * @param: @return  返回值决定请求是放行还是拦截
	 * @param: @return  false:表示拦截
	 * @param: @return  true:表示放行
	 * @param: @throws  Exception
	 * @see HandlerInterceptor#preHandle(HttpServletRequest,
	 *      HttpServletResponse, Object)
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
//		System.out.println("进入 preHandle 方法..." + request.getRequestURI().toString() + "," + request.getRequestURL());
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user != null) { // 表示已经登录
			return true;
		} else { // 表示未登录
			response.sendRedirect(request.getContextPath() + "/login.jsp");
		}
		return false;
	}

	/**
	 * 
	 * @Title: postHandle
	 * @Description: 该方法在Controller的业务方法执行之后，返回视图之前执行，controller方法若最终未被执行，则该方法不会执行。
	 *               由于该方法是在controller方法执行完后执行，且该方法参数中包含ModelAndView，所以该方法可以修改controller方法的处理结果数据，且可以修改跳转方向。
	 * @param: @param  request
	 * @param: @param  response
	 * @param: @param  handler
	 * @param: @param  modelAndView
	 * @param: @throws Exception
	 * @see HandlerInterceptor#postHandle(HttpServletRequest,
	 *      HttpServletResponse, Object,
	 *      ModelAndView)
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
//		System.out.println("进入 postHandle 方法..." + request.getRequestURI().toString() + "," + request.getRequestURL());
	}

	/**
	 * 
	 * @Title: afterCompletion
	 * @Description: 在Controller的业务方法执行结束并且视图解析完成后执行，主要进行用于一些资源的释放。
	 *               当preHandle()方法返回true时，会将该方法放到专门的方法栈中，等到对请求进行响应的所有工作完成之后才执行该方法。
	 *               即该方法是在中央调度器渲染（数据填充）了响应页面之后执行的，此时对ModelAndView再操作也对响应无济于事。
	 * @param: @param  request
	 * @param: @param  response
	 * @param: @param  handler
	 * @param: @param  ex
	 * @param: @throws Exception
	 * @see HandlerInterceptor#afterCompletion(HttpServletRequest,
	 *      HttpServletResponse, Object,
	 *      Exception)
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
//		System.out.println("进入 afterCompletion 方法..." + request.getRequestURI().toString() + "," + request.getRequestURL());
	}

}