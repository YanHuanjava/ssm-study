package com.seecen.interceptor;

import com.seecen.pojo.UserInfo;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AuthInterceptor extends HandlerInterceptorAdapter {
    /**在控制层方法执行之前被调用
     * @param request
     * @param response
     * @param handler
     * @return   true 放行  false 终止请求
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("\n执行请求之前调用的方法");
        //可以在这个方法做权限验证
        UserInfo userInfo = (UserInfo) request.getSession().getAttribute("user_info");
        if (userInfo!=null){
            return true;
        }else {
            response.sendRedirect("/login");
            return false;
        }
    }

    /**
     * 在控制层方法被执行完成之后调用postHandle
     * 这时还没有渲染HTML页面
     * @param request
     * @param response
     * @param handler
     * @param modelAndView  保存了视图和数据
     * @throws Exception
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("\n执行了postHandle");
    }

    /**
     * servlet执行完之后调用的方法
     * @param request
     * @param response
     * @param handler
     * @param ex
     * @throws Exception
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("\n执行了afterComletion");
    }
}
