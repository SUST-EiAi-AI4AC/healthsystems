package com.nwpu.healthsystem.backend.config;

import com.github.xiaoymin.knife4j.spring.annotations.EnableKnife4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.ParameterBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.schema.ModelRef;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.service.Parameter;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.util.ArrayList;
import java.util.List;

@Configuration
@EnableSwagger2
@EnableKnife4j
@ConditionalOnProperty(name = "swagger.enable", havingValue = "true")
public class Swagger2Config {
    public static final String SWAGGER_SCAN_BASE_PACKAGE = "com.nwpu.healthsystem.backend.controller";
    public static final String VERSION = "1.0.0";

    @Bean
    public Docket createRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .select()
                .apis(RequestHandlerSelectors.basePackage(SWAGGER_SCAN_BASE_PACKAGE))
                .paths(PathSelectors.any())
                .build()
                .globalOperationParameters(globalOperation());
    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("HealthSystem 接口文档")
                .description("HealthSystem-NWPU")
                .version(VERSION)
                .termsOfServiceUrl("https://www.nwpu.edu.cn")
                .contact(new Contact("精神健康管理系统开发组", "", ""))
                .build();
    }

    private List<Parameter> globalOperation(){
        ParameterBuilder tokenPar = new ParameterBuilder();
        List<Parameter> pars = new ArrayList<>();
        tokenPar.name("Authorization").description("jwt的字符串").modelRef(new ModelRef("string")).parameterType("header").required(false).build();
        pars.add(tokenPar.build());
        return pars;
    }
}