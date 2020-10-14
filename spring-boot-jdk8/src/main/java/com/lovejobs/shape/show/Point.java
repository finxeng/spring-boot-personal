package com.lovejobs.shape.show;

import lombok.Data;

/**
 * The type Point.
 * @author fengxin
 */
@Data
public class Point {

    private int x;
    private int y;


    public Point(int x, int y) {
        this.x = x;
        this.y = y;
    }

    public double distance(Point point){
        return Math.sqrt(Math.pow(this.x-point.getX(),2)+Math.pow(this.y-point.getY(),2));
    }

    @Override
    public String toString() {
        return"("+x+","+y+")";
    }
}
