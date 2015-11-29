package com.springapp.config;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;
import java.io.IOException;

/**
 * Created by jooyoung on 2015-11-28.
 */
@Configuration
@EnableTransactionManagement
@MapperScan(basePackages = {"com.springapp.persistence"}, sqlSessionFactoryRef = "masterSqlSessionFactory")
public class DatabaseConfig {


    @Bean(name = "dataSource")
    public DriverManagerDataSource dataSource() {
        DriverManagerDataSource driverManagerDataSource = new DriverManagerDataSource();
        driverManagerDataSource.setDriverClassName("net.sf.log4jdbc.DriverSpy");
        driverManagerDataSource.setUrl("jdbc:log4jdbc:mysql://localhost:3306/mall?useUnicode=true&characterEncoding=utf8");
        driverManagerDataSource.setUsername("dbuser");
        driverManagerDataSource.setPassword("1212");

        return driverManagerDataSource;
    }

    @Bean
    public DataSourceTransactionManager transactionManager() {
        return new DataSourceTransactionManager(dataSource());
    }


    @Bean(name="masterSqlSessionFactory")
    public SqlSessionFactoryBean sqlSessionFactory() throws Exception {
        SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
        sessionFactory.setDataSource(dataSource());
        sessionFactory.setTypeAliasesPackage("com.springapp.domain");
        sessionFactory.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:mybatis/masterdb/*.xml"));
        return sessionFactory;
    }


}
