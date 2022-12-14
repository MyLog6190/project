package com.project.common.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

@Configuration
@MapperScan(basePackages = {"com.project.user.mapper", "com.project.exercise.mapper", "com.project.board.mapper", "com.project.program.mapper"})
public class MapperConfig {
   
   @Bean
   public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
         SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
         sessionFactory.setDataSource(dataSource);
         
         Resource[] res = new PathMatchingResourcePatternResolver().getResources("classpath:mapper/**/*Mapper.xml");
         sessionFactory.setMapperLocations(res);
         sessionFactory.setTypeAliasesPackage("com.project.user"); //여기 추가
         sessionFactory.setTypeAliasesPackage("com.project.exercise"); //여기 추가
         sessionFactory.setTypeAliasesPackage("com.project.board"); //여기 추가
         sessionFactory.setTypeAliasesPackage("com.project.program");
         return sessionFactory.getObject();
   }
}