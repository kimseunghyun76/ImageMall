package com.springapp2.others;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

/**
 * Created by jooyoung on 2015-11-25.
 */

@Configuration
@ComponentScan({ "com.springapp2.*" })
@MapperScan("com.springapp2.others")
public class AppConfig2 {


    @Bean(name = "dataSourceforproduct")
    public DriverManagerDataSource dataSourceForProduct() {
        DriverManagerDataSource driverManagerDataSource = new DriverManagerDataSource();
        driverManagerDataSource.setDriverClassName("net.sf.log4jdbc.DriverSpy");
        driverManagerDataSource.setUrl("jdbc:log4jdbc:mysql://106.248.162.104:36361/hyundai?useUnicode=true&characterEncoding=utf8");
        driverManagerDataSource.setUsername("hyundai-manager");
        driverManagerDataSource.setPassword("hyundai)(*&");

        return driverManagerDataSource;
    }


    @Bean
    public DataSourceTransactionManager transactionManagerForProduct() {
        return new DataSourceTransactionManager(dataSourceForProduct());
    }


    @Bean
    public SqlSessionFactoryBean sqlSessionFactoryForProduct() throws Exception {
        SqlSessionFactoryBean sessionFactoryForProduct = new SqlSessionFactoryBean();
        sessionFactoryForProduct.setDataSource(dataSourceForProduct());
        sessionFactoryForProduct.setTypeAliasesPackage("com.springapp.domain");
        return sessionFactoryForProduct;
    }
}
