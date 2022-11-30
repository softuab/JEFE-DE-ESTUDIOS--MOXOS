/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.service;
 
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;  

public class JavaMail {

     
    private JavaMailSender mailSender;

    public void setMailSender(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    public void sendEmail(String fromAddress, String toAddress, String subject, String body) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();

        mailMessage.setTo(toAddress);
        mailMessage.setFrom("emailWhichYouWishToShow@gmail.com");
        mailMessage.setSubject(subject);
        mailMessage.setText(body);

        mailSender.send(mailMessage);
    }
}
