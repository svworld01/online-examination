/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

/**
 *
 * @author Saurabh Kr. Verma
 */
public class Alert {
    
    private static String message;
    public static void setMessage(String msg, String type){
        message = "<div class='alert alert-"+type+"' role='alert'>\n" +
"                    <button type='button' class='close' data-dismiss='alert'><span aria-hidden='true'>×</span><span class='sr-only'>Close</span></button>\n" +
"                    <strong>Oh snap!</strong> "+msg+"\n" +
"                </div>";
    }
    public static String getMessage(){
        return message;
    }
    public static void setMessage(String msg, String type, String url){
        message = "<div class='alert alert-"+type+"' role='alert'>\n" +
"                    <button type='button' class='close' data-dismiss='alert'><span aria-hidden='true'>×</span><span class='sr-only'>Close</span></button>\n" +
"                    <strong>Oh snap!</strong> "+msg+"\n" +
"                </div> <script>setTimeout(function(){ window.location.href='"+url+"' }, 1000);</script>";
    }
    public static void setMessage(String msg, String type, String url,int time){
        message = "<div class='alert alert-"+type+"' role='alert'>\n" +
"                    <button type='button' class='close' data-dismiss='alert'><span aria-hidden='true'>×</span><span class='sr-only'>Close</span></button>\n" +
"                    <strong>Oh snap!</strong> "+msg+"\n" +
"                </div> <script>setTimeout(function(){ window.location.href='"+url+"' }, "+time+");</script>";
    }
   public static void setIconMessage(String msg, String type,String icon){
        message = "<div class='alert alert-"+type+"' role='alert'>\n" +
"                    <button type='button' class='close' data-dismiss='alert'><span aria-hidden='true'>×</span><span class='sr-only'>Close</span></button>\n" +
"                    <strong><span class='"+icon+"'></span></strong> "+msg+"\n" +
"                </div> ";
    }
   public static void setIconMessage(String msg, String type, String url,String icon){
        message = "<div class='alert alert-"+type+"' role='alert'>\n" +
"                    <button type='button' class='close' data-dismiss='alert'><span aria-hidden='true'>×</span><span class='sr-only'>Close</span></button>\n" +
"                    <strong><span class='"+icon+"'></span></strong> "+msg+"\n" +
"                </div> <script>setTimeout(function(){ window.location.href='"+url+"' }, 1000);</script>";
    }
    
}
