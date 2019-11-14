package com.web.config;

import java.beans.PropertyVetoException;
import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
@EnableTransactionManagement
//@PropertySource("classpath:db.properties")
public class RootAppConfig {
	
//	Environment env;
//	@Autowired
//	public void setEnv(Environment env) {
//		this.env = env;
//	}
//
//	@Bean
//	public DataSource dataSource() {
//		ComboPooledDataSource ds = new ComboPooledDataSource();	
//			ds.setUser(env.getProperty("spring.database.user"));
//			ds.setPassword(env.getProperty("spring.database.password"));
//			try {
//				ds.setDriverClass(env.getProperty("spring.database.driverclass"));
//			} catch (PropertyVetoException e) {
//				e.printStackTrace();
//			}
//			ds.setJdbcUrl(env.getProperty("spring.database.url"));
//			ds.setInitialPoolSize(4);
//			ds.setMaxPoolSize(8);
//			return ds;
//	
//	}
	
	@Bean
    public DataSource dataSource() {
        ComboPooledDataSource ds = new ComboPooledDataSource();
        ds.setUser("sasa");

        ds.setPassword("word");

        try {
            ds.setDriverClass("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (PropertyVetoException e) {
            e.printStackTrace();
        }
        ds.setJdbcUrl("jdbc:sqlserver://localhost:1433;databaseName=PetDB");
        ds.setInitialPoolSize(4);
        ds.setMaxPoolSize(8);
        return ds;
    }
    
    @Bean
    public LocalSessionFactoryBean sessionFactory() {
        LocalSessionFactoryBean factory = new LocalSessionFactoryBean();
        factory.setDataSource(dataSource());
        factory.setPackagesToScan(new String[] {
                    "com.web"
                });
        factory.setHibernateProperties(additionalProperties());
        return factory;
    }
    @Bean(name="transactionManager")
    @Autowired
    public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {
         HibernateTransactionManager txManager = new HibernateTransactionManager();
         txManager.setSessionFactory(sessionFactory);
         return txManager;
      }    
    
    private Properties additionalProperties()  {
        Properties properties=new Properties();
        properties.put("hibernate.dialect", org.hibernate.dialect.SQLServer2012Dialect.class);
        properties.put("hibernate.show_sql", Boolean.TRUE);
        properties.put("hibernate.format_sql", Boolean.TRUE);
        properties.put("default_batch_fetch_size", 10);
        properties.put("hibernate.hbm2ddl.auto", "update");
        return properties;
    }
    
    // 06_JdbcTemplate需要的bean 借我放><
    @Bean
    public JdbcTemplate jdbctemplate() {
    	JdbcTemplate jdbcTemplate = new JdbcTemplate();
    	jdbcTemplate.setDataSource(dataSource());
    	return jdbcTemplate;

    }
}
