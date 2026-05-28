package com.nwpu.healthsystem.backend.service;

import com.nwpu.healthsystem.backend.service.answer.AnswerService;
import com.nwpu.healthsystem.backend.service.answer.EMAAnswerService;
import com.nwpu.healthsystem.backend.service.scale.SdsService;
import com.nwpu.healthsystem.backend.service.scale.PerceivedStressService;
import com.nwpu.healthsystem.backend.service.scale.SASService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class ScheduledService {

   @Autowired
   AnswerService answerService;

   @Scheduled(cron = "0 1/30 * * * *")
   public void dailyAnswer(){
      try{
         answerService.remindInput();
      }catch (Exception e){
         e.printStackTrace();
      }
   }

   @Autowired
   EMAAnswerService emaAnswerService;
   @Scheduled(cron = "0 1/30 * * * *")
   public void emaAnswer(){
      try{
         emaAnswerService.remindInput();
      }catch (Exception e){
         e.printStackTrace();
      }
   }

   @Autowired
   SdsService sdsService;
   @Scheduled(cron = "0 1 * * * *")
   public void PHQ(){
      try{
         sdsService.remindInput();
      }catch (Exception e){
         e.printStackTrace();
      }
   }

   @Autowired
   PerceivedStressService perceivedStressService;
   @Scheduled(cron = "0 1 * * * *")
   public void PSS(){
      try{
         perceivedStressService.remindInput();
      }catch (Exception e){
         e.printStackTrace();
      }
   }

   @Autowired
   SASService sasService;
   @Scheduled(cron = "0 1 * * * *")
   public void SAS(){
      try{
         sasService.remindInput();
      }catch (Exception e){
         e.printStackTrace();
      }
   }
}