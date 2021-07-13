package com.lovejobs.design_pattern.facade;

public class Client {
    public static void main(String[] args) {
        ILetterProcess process = new ILetterProcessImpl();
        process.writeContext("这是信件内容");
        process.fillEnvelope("这是信封地址");
        process.letterIntoEnvelope();
        process.sendLetter();

        ModenPostOffice modenPostOffice = new ModenPostOffice();
        String context = "this is context";
        String address = "this is address";
        modenPostOffice.sendLetter(context,address);
    }
}
