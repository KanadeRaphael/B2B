package com.myapp.service.impl;

import com.myapp.service.JsonService;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.Scanner;
import java.util.concurrent.TimeUnit;

@Service
public class JsonServiceImpl implements JsonService {
//    @Value(value = "classpath:resource/rest.json")
//    private Resource data;

    @Override
    public String getData(File file) {
        try {
            long t0 = System.nanoTime();
            String jsonData = this.jsonRead(file);
            long t1 = System.nanoTime();
            long millis = TimeUnit.NANOSECONDS.toMillis(t1 - t0);
//            System.out.println(millis + "ms");
            return jsonData;
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 读取文件类容为字符串
     *
     * @param file
     * @return
     */
    private String jsonRead(File file) {
        Scanner scanner = null;
        StringBuilder buffer = new StringBuilder();
        try {
            scanner = new Scanner(file, "utf-8");
            while (scanner.hasNextLine()) {
                buffer.append(scanner.nextLine());
            }
        } catch (Exception e) {

        } finally {
            if (scanner != null) {
                scanner.close();
            }
        }
        return buffer.toString();
    }

}