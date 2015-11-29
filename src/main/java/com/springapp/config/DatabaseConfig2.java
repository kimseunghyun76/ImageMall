package com.springapp.config;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * Created by jooyoung on 2015-11-28.
 */
@Configuration
@EnableTransactionManagement
@MapperScan(basePackages = {"com.springapp.persistence2"}, sqlSessionFactoryRef = "secondSqlSessionFactory")
public class DatabaseConfig2 {


    @Bean(name = "dataSource2")
    public DriverManagerDataSource dataSource2() {
        DriverManagerDataSource driverManagerDataSource = new DriverManagerDataSource();
        driverManagerDataSource.setDriverClassName("net.sf.log4jdbc.DriverSpy");
        driverManagerDataSource.setUrl("jdbc:log4jdbc:mysql://106.248.162.104:36361/hyundai?useUnicode=true&characterEncoding=utf8");
        driverManagerDataSource.setUsername("hyundai-manager");
        driverManagerDataSource.setPassword("hyundai)(*&");
//        driverManagerDataSource.setUrl("jdbc:log4jdbc:mysql://localhost:3306/product?useUnicode=true&characterEncoding=utf8");
//        driverManagerDataSource.setUsername("dbuser");
//        driverManagerDataSource.setPassword("1212");

        return driverManagerDataSource;
    }

    @Bean
    public DataSourceTransactionManager transactionManager() {
        return new DataSourceTransactionManager(dataSource2());
    }


    @Bean(name="secondSqlSessionFactory")
    public SqlSessionFactoryBean secondSqlSessionFactory() throws Exception {
        SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
        sessionFactory.setDataSource(dataSource2());
        sessionFactory.setTypeAliasesPackage("com.springapp.domain");
        sessionFactory.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:mybatis/hyundaidb/*.xml"));
        return sessionFactory;
    }


}
