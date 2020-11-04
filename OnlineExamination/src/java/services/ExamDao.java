/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;
import beans.Exam;
import dbcon.DbCon;
public class ExamDao extends DbCon{
    private Exam exam;

    public boolean saveData(Exam exam){
        
        return false;
    }
    public Exam getExam() {
        return exam;
    }

    public void setExam(Exam exam) {
        this.exam = exam;
    }
    
    
    
}
