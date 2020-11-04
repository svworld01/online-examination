package beans;

public class Admin {
    
    /*.....INSTANSE VARIABLES......*/
    private int id;
    private String name;
    private String email;
    private String password;
    private String last_login;
    
    /*......CONSTRUCTORS..........*/
    public Admin() {
        
    }
    public Admin(int id, String name, String email, String password, String last_login) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.last_login = last_login;
    }
    public Admin(String name, String email, String password, String last_login) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.last_login = last_login;
    }
    
    /*.....SETTERS AND GETTERS.........*/
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLast_login() {
        return last_login;
    }

    public void setLast_login(String last_login) {
        this.last_login = last_login;
    }
    
}
