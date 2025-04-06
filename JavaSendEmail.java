import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class JavaSendEmail {
    public static void sendMail(String recepient) throws MessagingException {
        System.out.println("Preparing Email...");
        Properties properties = new Properties();
        
        // Fixing incorrect property keys
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587"); 

        // Sender email credentials
        String email = "miniproject54324@gmail.com";
        String password = "qjkq ntro xhcc kmzw";

        // Authenticator to login
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(email, password);
            }
        });

        Message message = prepareMessage(session, email, recepient);
        try {
            Transport.send(message);
            System.out.println("Email sent successfully.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static Message prepareMessage(Session session, String email, String recepient) throws MessagingException {
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(email));
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient));
        message.setSubject("-----Test-----");
        message.setText("Hello, this is a test email.");
        return message;
    }
}