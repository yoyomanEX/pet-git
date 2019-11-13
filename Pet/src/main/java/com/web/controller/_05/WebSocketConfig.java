package com.web.controller._05;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;

@Configuration
public class WebSocketConfig {
	
	@Bean
    public ServerEndpointExporter serverEndpointExporter() {
        return new ServerEndpointExporter();
    }
//implements ServerApplicationConfig{

//	@Override
//	public Set<ServerEndpointConfig> getEndpointConfigs
//	(Set<Class<? extends Endpoint>> endpointClasses) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public Set<Class<?>> getAnnotatedEndpointClasses(Set<Class<?>> scanned) {
//		System.err.println("START CONFIG:" + scanned.size());
//        return scanned;
//	}

}
