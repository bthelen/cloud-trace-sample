package com.tag.math.compute.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.stream.IntStream;

@Slf4j
@Service
public class ComputeService {

    @Autowired
    private RestTemplate restTemplate;

    @Value("${factservice.host}")
    private String factServiceHost;

    @Value("${fibservice.host}")
    private String fibServiceHost;

    public Long findFib(int number){
        log.info("Find Fibonacci for number = " + number);
        String url = fibServiceHost + "/api/fib/" + number;
        return getResponse(url);
    }

    public Long findFact(int number){
        log.info("Find Factorial for number = " + number);
        String url =  factServiceHost + "/api/fact/" + number;;
        return getResponse(url);
    }

    public Long sumFact(int number){
        log.info("Sum Factorial for number = " + number);
        return IntStream.rangeClosed(1, number)
                .parallel()
                    .mapToObj(i ->  factServiceHost + "/api/fact/" + i)
                    .mapToLong(this::getResponse)
                    .sum();
    }

    private Long getResponse(String url){
        return this.restTemplate.getForObject(url, Long.class);
    }

}
