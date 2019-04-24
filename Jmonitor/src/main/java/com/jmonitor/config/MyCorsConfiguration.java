package com.jmonitor.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.web.servlet.config.annotation.CorsRegistration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

import com.google.common.net.HttpHeaders;

@Configuration
public class MyCorsConfiguration extends WebMvcConfigurationSupport{
	 @Override
	  public void addCorsMappings(CorsRegistry registry) {
		 this._configCorsParams(registry.addMapping("/**"));
	  }
	
	

	  private void _configCorsParams(CorsRegistration corsRegistration) {
	          corsRegistration
	          .allowedOrigins("*")
	          .allowedMethods(HttpMethod.GET.name(), HttpMethod.HEAD.name(), HttpMethod.POST.name(), HttpMethod.PUT.name(),HttpMethod.DELETE.name(),HttpMethod.OPTIONS.name())
	          .allowedHeaders("*")
	          .exposedHeaders(HttpHeaders.SET_COOKIE)
	          .allowCredentials(true)
	          .maxAge(3600);
	  }

     @Override
     public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("swagger-ui.html")
                .addResourceLocations("classpath:/META-INF/resources/");
        registry.addResourceHandler("/jmonitor/static/**")
                .addResourceLocations("classpath:/static/");
        registry.addResourceHandler("/webjars/**")
                .addResourceLocations("classpath:/META-INF/resources/webjars/");

     }
}
