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
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import org.fautapo.util.Mail;

/**
 *
 * @author FNZABALETAA
 */
public class Email {

    public void sendEmail(Mail mail) throws FileNotFoundException, IOException, AddressException, MessagingException {
        Properties prop = new Properties();
        prop.put("mail.smtp.auth", true);
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "25");
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        Session session = Session.getInstance(prop, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("soporte@uabjb.edu.bo", "sismokey2019.-$");
            }
        });
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(mail.getFrom()));
        message.setRecipients(
                Message.RecipientType.TO, InternetAddress.parse(mail.getTo()));
        message.setSubject(mail.getSubject());

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
        String html = cad.replace("${token}", mail.getModel().get("token").toString());

        MimeBodyPart mimeBodyPart = new MimeBodyPart();
        mimeBodyPart.setContent(html, "text/html");

        Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(mimeBodyPart);

        message.setContent(multipart);

        Transport.send(message);

    }
}
