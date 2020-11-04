/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import java.time.LocalDateTime;

/**
 *
 * @author Saurabh Kr. Verma
 */
public class DateTime {
    private static String datetime;
    private static String date;

    public DateTime() {
        datetime = setDateTime();
        date = setDate();
    }
    
    public static String setDateTime(){
        LocalDateTime now = LocalDateTime.now();
        int year = now.getYear();
        int month = now.getMonthValue();
        int day = now.getDayOfMonth();
        int hour = now.getHour();
        int minute = now.getMinute();
        datetime = ""+day+month+year+" "+hour+minute;
        
        return datetime;
    }
    public static String getDateTime(){
        return datetime;
    }

    public static String getDate() {
        return date;
    }

    public static String setDate() {
        String currentdate="";
        LocalDateTime now = LocalDateTime.now();
        int year = now.getYear();
        int month = now.getMonthValue();
        int day = now.getDayOfMonth();
        currentdate = ""+day+month+year;
        return currentdate;
    }
    
}
