package com.nwpu.healthsystem.backend.service;

import com.nwpu.healthsystem.backend.entity.answer.SpeakAnytime;
import com.nwpu.healthsystem.backend.entity.answer.Video;
import com.nwpu.healthsystem.backend.entity.depression.Media;
import com.nwpu.healthsystem.backend.mapper.answer.SpeakAnytimeMapper;
import com.nwpu.healthsystem.backend.mapper.answer.VideoMapper;
import com.nwpu.healthsystem.backend.mapper.depression.MediaMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.AsyncResult;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.concurrent.Future;


@Service
@Slf4j
@EnableScheduling
public class AsyncTaskService {
    private final SpeakAnytimeMapper speakAnytimeMapper;
    private final VideoMapper videoMapper;
    private final MediaMapper mediaMapper;

    AsyncTaskService(SpeakAnytimeMapper speakAnytimeMapper,
                     VideoMapper videoMapper,
                     MediaMapper mediaMapper) {
        this.speakAnytimeMapper = speakAnytimeMapper;
        this.videoMapper = videoMapper;
        this.mediaMapper = mediaMapper;
    }

    /**
     * 异步任务1、调用python脚本推断 audio 情感
     * @return
     * @throws InterruptedException
     */
    @Async("executor")
    public Future<String> audioInferenceTask(String filePath) throws InterruptedException {
        long currentTimeMillis = System.currentTimeMillis();
        log.info("audioInferenceTask, filepath：" + filePath);

        // 保存python的输出
        ArrayList<String> output = new ArrayList<String>();
        // 子线程执行的具体任务：
        // 1、执行python脚本进行推断
        try {
            String absoluteFilePath = "./HealthSystemFiles" + filePath;
            // 最后的命令可能会变
//            String[] args = new String[] { "python", "./SER/main.py", filePath};
            String[] args = new String[] { "python", "C:\\Users\\299\\Desktop\\a.py", absoluteFilePath};
            Process exec = Runtime.getRuntime().exec(args);
            BufferedReader in = new BufferedReader(new InputStreamReader(exec.getInputStream()));
            String line = null;
            while ((line = in.readLine()) != null) {
                log.info(line);
                // 音频需要转换一下结果
                if(line.equals("0")) {
                    line = "Angry";
                } else if(line.equals("1")) {
                    line = "Happy";
                } else if(line.equals("2")) {
                    line = "Neutral";
                } else if(line.equals("3")) {
                    line = "Sad";
                }
                output.add(line);
            }
            in.close();
            exec.waitFor();
        }catch (IOException e) {
            e.printStackTrace();
        }
        // 计算耗时
        long currentTimeMillis1 = System.currentTimeMillis();
        long costMillis = currentTimeMillis1 - currentTimeMillis;
        // 2、保存推断结果到数据库 (filepath, inference, costTime)
        SpeakAnytime speakAnytime = new SpeakAnytime(filePath, output.get(0), (int)costMillis);
        int i = this.speakAnytimeMapper.updateInference(speakAnytime);

        log.info("audioInferenceTask任务耗时:" + costMillis + "ms");
        return new AsyncResult<String>("audioInferenceTask执行完毕");
    }

    /**
     * 异步任务2、调用python脚本推断 video 情感
     * @return
     * @throws InterruptedException
     */
    @Async("executor")
    public Future<String> videoInferenceTask(String filePath) throws InterruptedException {
        long currentTimeMillis = System.currentTimeMillis();
        log.info("videoInferenceTask, filepath：" + filePath);

        ArrayList<String> output = new ArrayList<String>();
        // 子线程执行的具体任务：
        try {
            String absoluteFilePath = "./HealthSystemFiles" + filePath;
            String[] args = new String[] { "python", "./Visual_emotion/emotion_http.py", "-file", absoluteFilePath};
            Process exec = Runtime.getRuntime().exec(args);
            BufferedReader in = new BufferedReader(new InputStreamReader(exec.getInputStream()));
            String line = null;
            while ((line = in.readLine()) != null) {
                log.info(line);
                output.add(line);
            }
            in.close();
            exec.waitFor();
        }catch (IOException e) {
            e.printStackTrace();
        }
        // 计算耗时
        long currentTimeMillis1 = System.currentTimeMillis();
        long costMillis = currentTimeMillis1 - currentTimeMillis;

        Video video = new Video(filePath, output.get(0), (int)costMillis);
        int i = this.videoMapper.updateInference(video);

        log.info("videoInferenceTask 任务耗时:" + costMillis + "ms");

        return new AsyncResult<String>("videoInferenceTask执行完毕");
    }

    /**
     * 异步任务2、调用python脚本推断 video 情感
     * @return
     * @throws InterruptedException
     */
    @Async("executor")
    public Future<String> depressionVideoInferenceTask(String filePath) throws InterruptedException {
        long currentTimeMillis = System.currentTimeMillis();
        log.info("videoInferenceTask, filepath：" + filePath);
        ArrayList<String> output = new ArrayList<>();
        // 子线程执行的具体任务：
        try {
            String absoluteFilePath = "/home/user01/back/HealthSystemFiles" + filePath;
            String cmd = "cd assess;python3 --version; python3 cal.py " + absoluteFilePath;

            String[] args = new String[] { "/bin/zsh", "-c", cmd};
            log.info("cmd: " + cmd);
            log.info("args: " + args.toString());

            Process exec = Runtime.getRuntime().exec(args);
            BufferedReader in = new BufferedReader(new InputStreamReader(exec.getInputStream()));
            String line = null;
            while ((line = in.readLine()) != null) {
                System.out.println(line);
                output.add(line);
            }
            in.close();
            exec.waitFor();
        }catch (IOException e) {
            e.printStackTrace();
        }
        // 计算耗时
        long currentTimeMillis1 = System.currentTimeMillis();
        long costMillis = currentTimeMillis1 - currentTimeMillis;

        int size = output.size();
        String last_line = output.get(size - 1);
        int result = Integer.valueOf(last_line);
        log.info("PHQ9 result: " + result);

        Media video = new Media(filePath, result, (int)costMillis);
        int i = this.mediaMapper.updateInference(video);

        log.info("videoInferenceTask 任务耗时:" + costMillis + "ms");

        return new AsyncResult<String>("videoInferenceTask执行完毕");
    }

    // 定时任务实现
//    @Scheduled(cron = "*/5 * * * * ?")
    public void test() throws InterruptedException {
        System.out.println("11111111");
//        Thread.sleep(16000);
        System.out.println("Scheduled test");
    }

}
