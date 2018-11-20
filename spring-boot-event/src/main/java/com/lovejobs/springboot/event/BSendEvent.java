package com.lovejobs.springboot.event;

import lombok.Getter;
import lombok.Setter;
import org.springframework.context.ApplicationEvent;

public class BSendEvent extends ApplicationEvent {

    @Getter
    @Setter
    private String sendTo;

    public BSendEvent(Object source, String sendTo) {
        super(source);
        this.sendTo=sendTo;
    }
}
