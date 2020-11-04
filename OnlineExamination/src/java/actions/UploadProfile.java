package  actions;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import services.DbDao;

public class UploadProfile extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DbDao data = new DbDao();
        HttpSession session = request.getSession();
        boolean isuploaded=false;
        try{
        ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
        List<FileItem> multifiles = sf.parseRequest(request);
        for(FileItem item : multifiles){
            item.write(new File("D:/j2ee/servlets Example/OnlineExamination/web/Uploaded/"+item.getName()));
            String[] setdata = {item.getName()};
            String[] set = {"img"};
            if(data.updateRow("stu_profile", set, setdata, " WHERE `stu_id` = "+(String)session.getAttribute("stu_id"))){
                
                setdata[0] = "Completed";
                set[0] = "form_status";
                if(data.updateRow("students", set, setdata, " WHERE `stu_id` = "+(String)session.getAttribute("stu_id"))){
                    isuploaded = true;
                }
            }
            
        }
        }catch(Exception ex){System.out.println(ex);}
        if(isuploaded){
            response.sendRedirect("home.jsp");
        }
        
    }

}
