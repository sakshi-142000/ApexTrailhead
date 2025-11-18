public with sharing class EmailManager {
    public EmailManager() {

    }

    public void sendMail(String address, String subject, String body){
        Messaging.SingleEmailMessage mail= new Messaging.SingleEmailMessage();
        String[] toAddresses= new String[] {address};
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);

        //sending this email using build in sendEmail method of Messaging Class

        Messaging.SendEmailResult[] results=Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
        inspectResults(results);
    }

    public void inspectResults(Messaging.SendEmailResult[] results){
        // Boolean emailSent=true;

        for(Messaging.SendEmailResult result: results){
            if(result.isSuccess()==true) {
                System.debug('Email Sent Successfully');
            }
            else {
                // emailSent=false;
                System.debug('Email failed');
            }
        }

        // return emailSent;
    }
}