package com.jmonitor.config;

import java.util.HashMap;
import java.util.Map;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.context.annotation.PropertySource;

import lombok.Data;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Data
@PropertySource("classpath:swagger.properties")
@ConfigurationProperties(prefix = "swagger", ignoreUnknownFields = false)
@Configuration
@EnableSwagger2
@Profile({ "dev", "test" })
public class Swagger2Configuration
{
	private static final String TitleKey = "title";
	private static final String DescKey = "desc";
	private static final String AuthorKey = "author";
	private static final String AppVerKey = "appver";
	private static final String PackageKey = "package";

	private Map<String, String> config = new HashMap<String, String>();

	@Bean
	public Docket createConfigApi()
	{
		return new Docket(DocumentationType.SWAGGER_2).groupName("config")
				.apiInfo(apiInfo())
				// .globalOperationParameters(getParamterList())
				.select()
				.apis(RequestHandlerSelectors
						.basePackage(config.get(PackageKey)))
				.paths(PathSelectors.any()) // 过滤的接口
				.build();
	}

	private ApiInfo apiInfo()
	{
		return createApiInfo(config.get(TitleKey), config.get(DescKey),
				config.get(AuthorKey), config.get(AppVerKey));
	}

	private ApiInfo createApiInfo(String title, String description,
			String author, String version)
	{
		return new ApiInfoBuilder().title(title) // 大标题
				.description(description) // 详细描述
				.contact(new Contact(author, "", "")) // 作者
				.version(version).build();
	}

}