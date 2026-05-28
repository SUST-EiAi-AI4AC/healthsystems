package com.nwpu.healthsystem.backend.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadPoolExecutor;


@Configuration
@EnableAsync
public class ExecutorConfig {

    @Bean("executor")
    public Executor asyncServiceExecutor() {
        Executor executor = Executors.newSingleThreadExecutor();
        return executor;
    }
}

