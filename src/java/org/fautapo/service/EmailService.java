/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import org.fautapo.util.Mail;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper; 

public class EmailService {

    public EmailService() {
    }
    private JavaMailSenderImpl emailSender;
     

    public EmailService(JavaMailSenderImpl emailSender) {
        this.emailSender = emailSender;
    }

    public void setEmailSender(JavaMailSenderImpl emailSender) {
        this.emailSender = emailSender;
    }
 

    public boolean sendEmail(Mail mail) throws FileNotFoundException, IOException {

        try {
            MimeMessage message = emailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true);

            String rootPath = System.getProperty("catalina.home");
            File documento = new File(rootPath + File.separator + "imagenes" + File.separator + "template.txt");

            //Creamos el objeto con el que vamos a leer
            BufferedReader in = new BufferedReader(new FileReader(documento.getAbsolutePath()));
            String inputLine;
            String contenido = "";
            while ((inputLine = in.readLine()) != null) {
                contenido += inputLine + "\n";
            }
            in.close();
            String cad = contenido.replace("${nombrecompleto}", mail.getModel().get("nombrecompleto").toString());

            String html = cad.replace("${token}", mail.getModel().get("token").toString());;

            helper.setFrom(mail.getFrom());
            helper.setTo(mail.getTo());
            helper.setSubject(mail.getSubject());
            helper.setText(html, true);

           emailSender.send(message);
        } catch (MessagingException mx) {
            mx.printStackTrace();
            return false;
        }
        return true;
    }

}
