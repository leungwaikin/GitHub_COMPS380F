package ouhk.comps380f.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {

    @RequestMapping("/")
    public String index() {
        return "redirect:/item/list";
    }

    @RequestMapping("login")
    public String login() {
        return "login";
    }
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String loadregisterpage(ModelMap map) {
        return "register";
    }
    /*@RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerpage(ModelMap map,@ModelAttribute("entry") GuestBookEntry entry) {
        conn=MySqlConnect.connectDB();
        String Sql="INSERT INTO users VALUES"+ "(?,?)";
        /*String Sql2="INSERT INTO USERS"
				+ "(username,role) VALUES"
				+ "(?,'ROLE_USER')";*/
        /*String name=entry.getUsername();
        String password=entry.getPassword();
        try{
            pst=conn.prepareStatement(Sql);
            pst.setString(1,name);
            pst.setString(2,password);
            pst.executeUpdate();
            conn.close();
        } catch (SQLException e) {
          System.out.println(e.getMessage());
        } 
	return "register";
    }*/		
}
