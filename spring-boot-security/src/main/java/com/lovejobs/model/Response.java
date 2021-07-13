package com.lovejobs.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class Response implements Serializable {

    private static final long serialVersionUID = -5848258434186305717L;
    private final String jwttoken;

    public Response(String jwttoken) {
        this.jwttoken = jwttoken;
    }
}
