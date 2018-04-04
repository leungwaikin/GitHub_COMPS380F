package edu.ouhk.comps380f.controller;

import edu.ouhk.comps380f.model.GuestBookEntry;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import java.util.Date;
import java.util.Hashtable;
import java.util.Map;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping("guestbook")
public class GuestBookController  {
    
    private volatile int commentIdSequence = 1;
    private Map<Integer, GuestBookEntry> entries = new Hashtable<>();
        
    private synchronized int getNextCommentId() {
        return this.commentIdSequence++;
    }
     
    @RequestMapping(value={"", "view"})
    public String index(ModelMap model) {
        model.addAttribute("entries", entries);
        return "GuestBook";
    }
     
    
    @RequestMapping(value="add", method=RequestMethod.GET)
    public ModelAndView addCommentForm() {
        return new ModelAndView("AddComment", "command", new GuestBookEntry());
    }
    
    @RequestMapping(value="add", method=RequestMethod.POST)
    public View addCommentHandle(GuestBookEntry entry) {
        entry.setId(getNextCommentId());
        entry.setDate(new Date());
        entries.put(entry.getId(), entry);
        return new RedirectView("/guestbook/view", true);
    }
    
    @RequestMapping(value="edit", method=RequestMethod.GET)
    public String editCommentForm(@RequestParam("id") Integer entryId, ModelMap model) {
        GuestBookEntry entry = entries.get(entryId);
        model.addAttribute("entry", entry);
        return "EditComment";
    }
    
    @RequestMapping(value="edit", method=RequestMethod.POST)
    public View editCommentHandle(GuestBookEntry entry) {
        entry.setDate(new Date());
        entries.put(entry.getId(), entry);
        return new RedirectView("/guestbook/view", true);
    }
    @RequestMapping(value="bid", method=RequestMethod.GET)
    public String bitCommentForm(@RequestParam("id") Integer entryId, ModelMap model) {
        GuestBookEntry entry = entries.get(entryId);
        model.addAttribute("entry", entry);
        return "bitComment";
    }
    @RequestMapping(value="bid", method=RequestMethod.POST)
    public View bitCommentHandle(GuestBookEntry entry) {
        entry.setDate(new Date());
        entries.put(entry.getId(), entry);
        return new RedirectView("/guestbook/view", true);
    }
    @RequestMapping(value="newcomment", method=RequestMethod.GET)
    public String newcommentCommentForm(@RequestParam("id") Integer entryId, ModelMap model) {
        GuestBookEntry entry = entries.get(entryId);
        model.addAttribute("entry", entry);
        return "NewComment";
    }
    @RequestMapping(value="newcomment", method=RequestMethod.POST)
    public View newcommentCommentHandle(GuestBookEntry entry) {
        entry.setDate(new Date());
        entries.put(entry.getId(), entry);
        return new RedirectView("/guestbook/view", true);
    }
}
