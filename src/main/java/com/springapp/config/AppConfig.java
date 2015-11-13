package com.springapp.config;

import org.springframework.context.annotation.*;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

/**
 * Created by Helloworld
 * User : USER
 * Date : 2015-11-13
 * Time : 오전 11:03
 * To change this template use File | Settings | File and Code Templates.
 */
@EnableWebMvc
@Configuration
@ComponentScan({ "com.springapp.*" })
@Import({ SecurityConfig.class })
public class AppConfig extends WebMvcConfigurerAdapter {


    @Bean(name = "dataSource")
    public DriverManagerDataSource dataSource() {
        DriverManagerDataSource driverManagerDataSource = new DriverManagerDataSource();
        driverManagerDataSource.setDriverClassName("com.mysql.jdbc.Driver");
        driverManagerDataSource.setUrl("jdbc:mysql://localhost:3306/mall");
        driverManagerDataSource.setUsername("dbuser");
        driverManagerDataSource.setPassword("1212");
        return driverManagerDataSource;
    }

    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setViewClass(JstlView.class);
        viewResolver.setPrefix("/WEB-INF/pages/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }

    /*
    * Configure ResourceHandlers to serve static resources like CSS/ Javascript etc...
    * /webjars/jquery/2.1.3/dist/
    */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
        if (!registry.hasMappingForPattern("/webjars/**")) {
            registry.addResourceHandler("/webjars/**").addResourceLocations("classpath:/META-INF/resources/webjars/");
        }
    }


    @Bean(name = "multipartResolver")
    @Scope(value = WebApplicationContext.SCOPE_SESSION,proxyMode = ScopedProxyMode.TARGET_CLASS)
    public CommonsMultipartResolver getMultipartResolver() {
        CommonsMultipartResolver mr = new CommonsMultipartResolver();
        mr.setMaxUploadSize(10000);
        return mr;
    }


}
