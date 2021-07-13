package com.lovejobs.design_pattern.facade;

public class ModenPostOffice {
    private ILetterProcess process = new ILetterProcessImpl();

    private Police police = new Police();

    public void sendLetter(String context,String address){
        process.writeContext(context);
        process.fillEnvelope(address);
        process.letterIntoEnvelope();
        police.checkLetter(process);
        process.sendLetter();

    }
}
