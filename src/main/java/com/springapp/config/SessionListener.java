package com.springapp.config;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Created by Helloworld
 * User : USER
 * Date : 2015-12-11
 * Time : 오후 6:35
 * To change this template use File | Settings | File and Code Templates.
 *
 * 세션 타임 아웃은 2시간으로 설정
 */
public class SessionListener implements HttpSessionListener {

    @Override
    public void sessionCreated(HttpSessionEvent event) {
        System.out.println("==== Session is created ====");
        event.getSession().setMaxInactiveInterval(2*60*60);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent event) {
        System.out.println("==== Session is destroyed ====");
    }
}