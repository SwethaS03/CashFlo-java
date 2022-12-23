package com.Bank.config;

import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import java.util.Properties;

public class MailConfig {

    @Bean
    public static JavaMailSenderImpl getMailConfig(){
        JavaMailSenderImpl emailConfig = new JavaMailSenderImpl();

        //Set properties;
        Properties props = emailConfig.getJavaMailProperties();
        props.put("mail.transport.protocol","smtp");
        props.put("mail.smtp.auth","true");
        props.put("mail.smtp.starttls.enable","true");
        props.put("mail.debug","true");

        //Set Mail Credentials:
        emailConfig.setHost("smtp.mailtrap.io");
        emailConfig.setPort(2525);
        emailConfig.setUsername("aa117a866b7567");
        emailConfig.setPassword("f4d741d96cf27a");
        return emailConfig;
    }
}
