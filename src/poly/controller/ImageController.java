package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ImageController {
    private Logger log = Logger.getLogger(this.getClass());

    @RequestMapping(value = "picAdd")
    public String picAdd(){
        return "/Image/picAdd";
    }

    @RequestMapping(value = "myPage")
    public String myPage() {return "/Mypage/myPage";}
}
