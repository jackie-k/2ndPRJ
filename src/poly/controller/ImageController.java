package poly.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import poly.dto.MainDTO;
import poly.service.IMainService;
import poly.service.impl.UploadService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import poly.util.CmmUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

@Controller
public class ImageController {
    private Logger log = Logger.getLogger(this.getClass());

    private static String SAVE_PATH = "C:\\Users\\data-16\\IdeaProjects\\realfinal\\WebContent\\";

    @RequestMapping(value = "myPage")
    public String myPage(HttpSession session, HttpServletRequest request, Model model) throws Exception {

        String email = (String) session.getAttribute("user_mail");
        log.info(email);

        MainDTO mDTO = new MainDTO();
        mDTO = mainService.seqcheck(email);

        String user_seq = CmmUtil.nvl((String) mDTO.getSeq());

        List<MainDTO> iList = new ArrayList<>();

        try {
            iList = uploadService.getMyPage(user_seq);
            System.out.println("List Size : " + iList.size());
        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("iList",iList);


        return "/Mypage/myPage";
    }

    @Autowired
    UploadService uploadService;

    @Resource(name = "MainService")
    private IMainService mainService;

    @RequestMapping("/upload")
    public String upload(
            Model model,
            @RequestParam("file1") MultipartFile file, HttpSession session, HttpServletRequest request) throws Exception {

        //사용자 이메일 - userseq
        String email = (String) session.getAttribute("user_mail");
        log.info(email);

        MainDTO mDTO = new MainDTO();
        mDTO = mainService.seqcheck(email);

        String user_seq = CmmUtil.nvl((String) mDTO.getSeq());

        String msg;
        if (file == null) {
            msg = "파일없음";
            model.addAttribute("msg", msg);
            model.addAttribute("url", "myPage.do");
        } else {
            System.out.println("파일업로드시작");
            try {
                // 파일 정보
                String originFilename = file.getOriginalFilename();
                String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
                Long size = file.getSize();

                // 서버에서 저장 할 파일 이름
                String fileName = "";
                Calendar calendar = Calendar.getInstance();
                fileName += calendar.get(Calendar.YEAR);
                fileName += calendar.get(Calendar.MONTH);
                fileName += calendar.get(Calendar.DATE);
                fileName += calendar.get(Calendar.HOUR);
                fileName += calendar.get(Calendar.MINUTE);
                fileName += calendar.get(Calendar.SECOND);
                fileName += calendar.get(Calendar.MILLISECOND);
                fileName += extName;

                System.out.println("originFilename : " + originFilename);
                System.out.println("extensionName : " + extName);
                System.out.println("size : " + size);
                System.out.println("saveFileName : " + fileName);

                //라디오 버튼으로 옷 종류 분류
                String type = CmmUtil.nvl((String) request.getParameter("type"));
                log.info("clothing type : " + type);

                String category = "";

                if (type.equals("01")) {
                    category = "1";

                } else if (type.equals("02")) {
                    category = "2";

                } else if (type.equals("03")) {
                    category = "3";

                } else if (type.equals("04")) {
                    category = "4";

                } else if (type.equals("05")) {
                    category = "5";

                } else {
                    category = "6";
                }

                log.info("category: " + category);

                MainDTO cDTO = new MainDTO();

                cDTO.setCategory(category);
                cDTO.setFile_name(fileName);
                cDTO.setSeq(user_seq);

                int res = uploadService.insertFileInfo(cDTO);

                if (res > 0) {
                    msg = "업로드 성공";
                    model.addAttribute("msg", msg);
                    model.addAttribute("url", "myPage.do");
                } else {
                    msg = "업로드 실패";
                    model.addAttribute("msg", msg);
                    model.addAttribute("url", "myPage.do");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        return "/Redirect";
    }
}


