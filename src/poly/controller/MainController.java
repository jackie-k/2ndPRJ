package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import poly.dto.MainDTO;
import poly.service.IMainService;
import poly.service.impl.MainService;
import poly.service.impl.UploadService;
import poly.util.CmmUtil;

import javax.annotation.Resource;
import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class MainController {
    private Logger log = Logger.getLogger(this.getClass());

    @Autowired
    UploadService uploadService;

    @Resource(name = "MainService")
    private IMainService mainService;

    @RequestMapping(value = "main")
    public String main(){
        return "main";
    }

    @RequestMapping(value = "recom")
    public String recom(Model model, HttpSession session,HttpServletRequest request) throws Exception{
       String avgtemp = request.getParameter("avgtemp");
       double avg=Double.parseDouble(avgtemp);
       log.info(avgtemp);

       String a[] = {"0","0","0"};

       if(avg < 5){
           a[0]="2";
           a[1]="4";
           a[2]="6";
       } else if (5 < avg && avg < 10){
           a[0]="2";
           a[1]="4";
           a[2]="5";
       } else if (10 < avg && avg < 15) {
           a[0]="0";
           a[1]="2";
           a[2]="4";
       } else if (15 < avg && avg <20) {
           a[0]="0";
           a[1]="1";
           a[2]="4";
       } else {
           a[0]="0";
           a[1]="1";
           a[2]="3";
       }


       String c[]=new String[3];
       String email = (String) session.getAttribute("user_mail");
       log.info(email);
       MainDTO mDTO = new MainDTO();
       mDTO = mainService.seqcheck(email);
       log.info(mDTO.getSeq());
       List<MainDTO> mList = new ArrayList<>();

           for (int i = 0; i < 3; i++) {
               mDTO.setCategory(a[i]);
               log.info("a[i] : " + mDTO.getCategory());
               mList = mainService.getimg(mDTO);
               if (mList.size()<1){
                   mList = new ArrayList<>();
                   c[i]="0";
               }else {

                   int randomnum = (int) (Math.random() * mList.size());
                   log.info("random number : " + randomnum);

                   c[i] = mList.get(randomnum).getFile_name();
                   log.info(c[i]);
               }

       }

           if (c[0] == c[1] && c[1] == c[2] && c[2] == "0") {
               model.addAttribute("msg", "본인의 옷 이미지를 업로드 해 주세요");
               model.addAttribute("url", "/main.do");

               return "/Redirect";
           }else {

               for (int i = 0; i < 3; i++) {
                   log.info(c[i]);
                   if (c[i] == "0")
                       c[i] = "logoimg" + a[i] + ".jpg";
               }

               model.addAttribute("mDTO", mDTO);
               model.addAttribute("c", c);
               return "recom";
           }
    }


    @RequestMapping(value="search")
    public String search(HttpServletRequest request, Model model, HttpSession session) throws Exception {
        String SearchQuery = CmmUtil.nvl((String) request.getParameter("SearchQuery"));

        HashMap<String, String> hMap = new HashMap<String, String>();

        log.info("original search query : " + SearchQuery);

        //검색 쿼리 공백 제거
        SearchQuery = SearchQuery.replaceAll(" ","");
        log.info("trim search query : " + SearchQuery);

        hMap.put("SearchQuery", SearchQuery);

        List<MainDTO> mList = new ArrayList<>();

        try {
            mList = mainService.getsearch(hMap);
            log.info("mlist : " + mList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(mList.size()<1){
            model.addAttribute("msg", " 검색어를 정확하게 입력해주세요. (ex. 충남 -> 충청남도 )");
            model.addAttribute("url", "/main.do");

            return "/Redirect";

        }else{
            for(int i = 0; i<mList.size();i++){
                log.info("이름 : "+mList.get(i).getName());
                log.info("X : "+mList.get(i).getX());
                log.info("Y : "+mList.get(i).getY());

                model.addAttribute("mList",mList);
            }
        }




        return "/search";
    }

//    @RequestMapping(value = "getCorInfo")
//    @ResponseBody
//    public List<MainDTO> getCorInfo(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
//
//        String SearchQuery = CmmUtil.nvl((String) request.getParameter("SearchQuery"));
//
//        HashMap<String, String> hMap = new HashMap<String, String>();
//
//        log.info("original search query : " + SearchQuery);
//
//        //검색 쿼리 공백 제거
//        SearchQuery = SearchQuery.replaceAll(" ","");
//        log.info("trim search query : " + SearchQuery);
//
//        hMap.put("SearchQuery", SearchQuery);
//
//        List<MainDTO> rList = new ArrayList<>();
//
//        log.info(this.getClass().getName() + " : getCorInfo 호출");
//
//        MainDTO pDTO = new MainDTO();
//
//        rList = mainService.getCorInfo();
//
//        log.info("rList : " + rList.size());
//
//        if (rList == null) {
//            rList = new ArrayList<MainDTO>();
//        }
//
//        log.info("rList : " + rList.size());
//
//        log.info(this.getClass().getName() + " : getCorInfo 종료");
//
//        return rList;
//    }

}
