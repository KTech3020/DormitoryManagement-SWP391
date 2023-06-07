/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

//mail: ktx.fpt.demo@gmail.com
//PASS: Hthy1109@

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
/**
 *
 * @author MSI GL63
 */
public class SendMailContext {
    public static String sendMail(String sub, String msg){
        final String fromEmail = "ktx.fpt.demo@gmail.com";
        final String password = "vgryybbkhetguyyb";
        final String toEmail = "ktx.fpt.demo@gmail.com";
        String messageResult = "";
        Properties pr = new Properties();
        //System.getProperties()
        pr.put("mail.smtp.auth", "true");
        pr.put("mail.smtp.starttls.enable", "true");
        pr.put("mail.smtp.host", "smtp.gmail.com");
        pr.put("mail.smtp.port", "587");
        pr.put("mail.smtp.socketFactory.port", "465");
        pr.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");

        Session session = Session.getInstance(pr, new Authenticator(){
            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(fromEmail,password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            InternetAddress[] toAddresses = {new InternetAddress(toEmail)};
            message.addRecipients(Message.RecipientType.TO, toAddresses);
            message.setSubject(sub);
            message.setText(msg);
            message.setSentDate(new Date());
            Transport.send(message);
            messageResult = "The email was sent successfully!";
        } catch (Exception e) {
            e.printStackTrace();
            messageResult = "There were an error:" + e.getMessage();
        }
        return messageResult;
    }

}