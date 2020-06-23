package poly.controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import poly.service.impl.UploadService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ImageController {
    private Logger log = Logger.getLogger(this.getClass());

    @RequestMapping(value = "myPage")
    public String myPage() {return "/Mypage/myPage";}

    @Autowired
    UploadService UploadService;

    @RequestMapping( "/form" )
    public String form() {
        return "/Image/form";
    }

    @RequestMapping( "/upload" )
    public String upload(
            Model model,
            @RequestParam("file1") MultipartFile file) {

        String url = UploadService.restore(file);
        model.addAttribute("url", url);
        return "/Image/result";
    }
}

