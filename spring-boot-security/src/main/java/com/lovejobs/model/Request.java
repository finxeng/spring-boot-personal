package com.lovejobs.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class Request implements Serializable {

    private static final long serialVersionUID = -678819923716057395L;
    private String username;
    private String password;
}
