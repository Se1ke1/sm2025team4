package edu.sm.sm2025team4.config;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
@Slf4j
@Configuration
@RequiredArgsConstructor
public class WebMvcConfig implements WebMvcConfigurer {

    private final CartInterceptor cartInterceptor;
    private final FavInterceptor favInterceptor;
    private final LoginInterceptor loginInterceptor;

    @Value("${app.dir.imgsdir}")
    String imgdir;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/imgs/**").addResourceLocations(imgdir);
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(cartInterceptor).addPathPatterns("/**").excludePathPatterns("/imgs/**");
        registry.addInterceptor(favInterceptor).addPathPatterns("/**").excludePathPatterns("/imgs/**");
        registry.addInterceptor(loginInterceptor).addPathPatterns("/fav","/account","/address","/addaddress","/delete","/order","/cart");
    }
}