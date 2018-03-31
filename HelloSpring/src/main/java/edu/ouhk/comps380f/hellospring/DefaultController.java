package edu.ouhk.comps380f.hellospring;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DefaultController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(ModelMap map) {
        return "myindexstatic";
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(ModelMap map) {
        return "index";
    }
    @RequestMapping(value="/login",method = RequestMethod.POST)
    public String submit(Model model, @ModelAttribute("loginBean") LoginBean loginBean) {
        if (loginBean != null && loginBean.getUserName() != null & loginBean.getPassword() != null) {
            if (loginBean.getUserName().equals("c") && loginBean.getPassword().equals("d")) {
                model.addAttribute("msg", "welcome" + loginBean.getUserName());
                return "mainpage";
            } else {
                model.addAttribute("error", "Invalid Details");
                return "index";
            }
        } else {
            model.addAttribute("error", "Please enter Details");
            return "index";
        }
    }
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register_page(ModelMap map) {
        return "register";
    }
    @RequestMapping(value="/register",method = RequestMethod.POST)
    public String register_submit(Model model, @ModelAttribute("loginBean") LoginBean loginBean) {
           
            loginBean.setUserName("c") ;
            loginBean.setPassword("d");
            model.addAttribute("error", "create successful");
            return "register";     
     
    }
    @RequestMapping(value = "/additem", method = RequestMethod.GET)
    public String item_page(ModelMap map) {
        return "item";
    }
    @RequestMapping("/dynamic")
    public String dynamicindex(ModelMap map) {
        map.addAttribute("hello", "Welcome to COMPS380F Spring Lecture !");
        return "myindex";
    }

    @RequestMapping(value = "/myform", method = RequestMethod.GET)
    public ModelAndView myform() {
        return new ModelAndView("myform", "command", new MyData());
    }

    @RequestMapping(value = "/formhandle", method = RequestMethod.POST)
    public String formHandle(MyData mydata, ModelMap map) {
        map.addAttribute("hello", mydata.getName() + ":" + mydata.getNum());
        return "myindex";
    }

}
