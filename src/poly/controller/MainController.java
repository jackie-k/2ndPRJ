package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import poly.dto.MainDTO;
import poly.service.IMainService;
import poly.service.impl.MainService;
import poly.util.CmmUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class MainController {
    private Logger log = Logger.getLogger(this.getClass());

    @Resource(name = "MainService")
    private IMainService mainService;

    @RequestMapping(value = "main")
    public String main(){
        return "main";
    }

    @RequestMapping(value = "recom")
    public String recom(){
        return "recom";
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
        if(mList==null){
            session.invalidate();
            model.addAttribute("msg", " ex) 충남 -> 충청남도 ");
            model.addAttribute("url", "/main.do");

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

}
