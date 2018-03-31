package edu.ouhk.comps380f.hellospring;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import java.util.Date;
import java.util.Hashtable;
import java.util.Map;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class GuestBookController  {
    
    private volatile int commentIdSequence = 1;
    private Map<Integer, GuestBookEntry> entries = new Hashtable<>();
    
    private synchronized int getNextCommentId() {
        return this.commentIdSequence++;
    }
     
    @RequestMapping("/GuestBook")
    public String index(ModelMap model) {
        model.addAttribute("entries", entries.values());
        return "GuestBook";
    }
    
    @RequestMapping(value="/AddComment", method=RequestMethod.GET)
    public ModelAndView addCommentForm() {
        return new ModelAndView("AddComment", "entry", new GuestBookEntry());
    }
    
    @RequestMapping(value="/AddComment", method=RequestMethod.POST)
    public View addCommentHandle(@ModelAttribute("entry") GuestBookEntry entry) {
        Integer id = getNextCommentId();
        entry.setId(id);
        entry.setDate(new Date());
        this.entries.put(id, entry);
        return new RedirectView("GuestBook"); // One way to redirect in Spring MVC
    }
    
    @RequestMapping(value="/EditComment/{id}", method=RequestMethod.GET)
    public String editCommentForm(@PathVariable("id") Integer entryId, ModelMap model) {
        GuestBookEntry entry = this.entries.get(entryId);
        model.addAttribute("entry", entry);
        return "EditComment";
    }
    
    @RequestMapping(value="/EditComment/{id}", method=RequestMethod.POST)
    public String editCommentHandle(@PathVariable("id") Integer entryId, @ModelAttribute("entry") GuestBookEntry entry) {
        entry.setDate(new Date());
        this.entries.put(entryId, entry);
        return "redirect:/GuestBook"; // Another way to redirect in Spring MVC
    }
    
}
