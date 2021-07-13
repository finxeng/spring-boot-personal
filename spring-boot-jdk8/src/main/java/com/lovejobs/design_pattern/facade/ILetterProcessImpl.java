package com.lovejobs.design_pattern.facade;

public class ILetterProcessImpl implements ILetterProcess{
    @Override
    public void writeContext(String context) {
        System.out.println("填写信的内容。。。"+context);
    }

    @Override
    public void fillEnvelope(String address) {
        System.out.println("填写收件人的地址和姓名。。。");
    }

    @Override
    public void letterIntoEnvelope() {
        System.out.println("把信放到信封中。。。");
    }

    @Override
    public void sendLetter() {
        System.out.println("邮件信件。。。");
    }
}
