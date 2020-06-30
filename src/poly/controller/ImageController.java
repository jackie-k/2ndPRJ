package poly.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
import java.io.*;
import java.util.*;

@Controller
public class ImageController {
    private Logger log = Logger.getLogger(this.getClass());

    private static String SAVE_PATH = "usr/local/apache-tomcat-8.5.54/webapps/ROOT/";

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

                String path = "usr/local/apache-tomcat-8.5.54/webapps/ROOT/" + user_seq; //폴더 경로
                File Folder = new File(path);

                // 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
                if (!Folder.exists()) {
                    try{
                        Folder.mkdir(); //폴더 생성합니다.
                        System.out.println("Folder created.");


                    }
                    catch(Exception e){
                        e.getStackTrace();
                    }

                    //원본 파일경로
                    String orilogoFilePath = "/usr/local/apache-tomcat-8.5.54/webapps/ROOT/Assets/img/logoimg0.jpg";
                    //복사될 파일경로
                    String copylogoFilePath = "/usr/local/apache-tomcat-8.5.54/webapps/ROOT/" + user_seq + "/logoimg0.jpg";

                    //파일객체생성
                    File orilogoFile = new File(orilogoFilePath);
                    //복사파일객체생성
                    File copylogoFile = new File(copylogoFilePath);

                    try {

                        FileInputStream fis = new FileInputStream(orilogoFile); //읽을파일
                        FileOutputStream fos = new FileOutputStream(copylogoFile); //복사할파일

                        int fileByte = 0;
                        // fis.read()가 -1 이면 파일을 다 읽은것
                        while((fileByte = fis.read()) != -1) {
                            fos.write(fileByte);
                        }
                        //자원사용종료
                        fis.close();
                        fos.close();

                    } catch (FileNotFoundException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    } catch (IOException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                    //원본 파일경로
                    String orishortsleeveFilePath = "/usr/local/apache-tomcat-8.5.54/webapps/ROOT/Assets/img/logoimg1.jpg";
                    //복사될 파일경로
                    String copyshortsleeveFilePath = "/usr/local/apache-tomcat-8.5.54/webapps/ROOT/" + user_seq + "/logoimg1.jpg";

                    //파일객체생성
                    File orishortsleeveFile = new File(orishortsleeveFilePath);
                    //복사파일객체생성
                    File copyshortsleeveFile = new File(copyshortsleeveFilePath);

                    try {

                        FileInputStream fis = new FileInputStream(orishortsleeveFile); //읽을파일
                        FileOutputStream fos = new FileOutputStream(copyshortsleeveFile); //복사할파일

                        int fileByte = 0;
                        // fis.read()가 -1 이면 파일을 다 읽은것
                        while((fileByte = fis.read()) != -1) {
                            fos.write(fileByte);
                        }
                        //자원사용종료
                        fis.close();
                        fos.close();

                    } catch (FileNotFoundException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    } catch (IOException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }

                    //원본 파일경로
                    String orilongsleeveFilePath = "/usr/local/apache-tomcat-8.5.54/webapps/ROOT/Assets/img/logoimg2.jpg";
                    //복사될 파일경로
                    String copylongsleeveFilePath = "/usr/local/apache-tomcat-8.5.54/webapps/ROOT/" + user_seq + "/logoimg2.jpg";

                    //파일객체생성
                    File orilongsleeveFile = new File(orilongsleeveFilePath);
                    //복사파일객체생성
                    File copylongsleeveFile = new File(copylongsleeveFilePath);

                    try {

                        FileInputStream fis = new FileInputStream(orilongsleeveFile); //읽을파일
                        FileOutputStream fos = new FileOutputStream(copylongsleeveFile); //복사할파일

                        int fileByte = 0;
                        // fis.read()가 -1 이면 파일을 다 읽은것
                        while((fileByte = fis.read()) != -1) {
                            fos.write(fileByte);
                        }
                        //자원사용종료
                        fis.close();
                        fos.close();

                    } catch (FileNotFoundException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    } catch (IOException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }

                    //원본 파일경로
                    String orishortpantsFilePath = "/usr/local/apache-tomcat-8.5.54/webapps/ROOT/Assets/img/logoimg3.jpg";
                    //복사될 파일경로
                    String copyshortpantsFilePath = "/usr/local/apache-tomcat-8.5.54/webapps/ROOT/" + user_seq + "/logoimg3.jpg";

                    //파일객체생성
                    File orishortpantsFile = new File(orishortpantsFilePath);
                    //복사파일객체생성
                    File copyshortpantsFile = new File(copyshortpantsFilePath);

                    try {

                        FileInputStream fis = new FileInputStream(orishortpantsFile); //읽을파일
                        FileOutputStream fos = new FileOutputStream(copyshortpantsFile); //복사할파일

                        int fileByte = 0;
                        // fis.read()가 -1 이면 파일을 다 읽은것
                        while((fileByte = fis.read()) != -1) {
                            fos.write(fileByte);
                        }
                        //자원사용종료
                        fis.close();
                        fos.close();

                    } catch (FileNotFoundException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    } catch (IOException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }

                    //원본 파일경로
                    String orilongpantsFilePath = "/usr/local/apache-tomcat-8.5.54/webapps/ROOT/Assets/img/logoimg4.jpg";
                    //복사될 파일경로
                    String copylongpantsFilePath = "/usr/local/apache-tomcat-8.5.54/webapps/ROOT/" + user_seq + "/logoimg4.jpg";

                    //파일객체생성
                    File orilongpantsFile = new File(orilongpantsFilePath);
                    //복사파일객체생성
                    File copylongpantsFile = new File(copylongpantsFilePath);

                    try {

                        FileInputStream fis = new FileInputStream(orilongpantsFile); //읽을파일
                        FileOutputStream fos = new FileOutputStream(copylongpantsFile); //복사할파일

                        int fileByte = 0;
                        // fis.read()가 -1 이면 파일을 다 읽은것
                        while((fileByte = fis.read()) != -1) {
                            fos.write(fileByte);
                        }
                        //자원사용종료
                        fis.close();
                        fos.close();

                    } catch (FileNotFoundException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    } catch (IOException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }

                    //원본 파일경로
                    String orithickouterFilePath = "/usr/local/apache-tomcat-8.5.54/webapps/ROOT/Assets/img/logoimg6.jpg";
                    //복사될 파일경로
                    String copythickouterFilePath = "/usr/local/apache-tomcat-8.5.54/webapps/ROOT/" + user_seq + "/logoimg6.jpg";

                    //파일객체생성
                    File orithickouterFile = new File(orithickouterFilePath);
                    //복사파일객체생성
                    File copythickouterFile = new File(copythickouterFilePath);

                    try {

                        FileInputStream fis = new FileInputStream(orithickouterFile); //읽을파일
                        FileOutputStream fos = new FileOutputStream(copythickouterFile); //복사할파일

                        int fileByte = 0;
                        // fis.read()가 -1 이면 파일을 다 읽은것
                        while((fileByte = fis.read()) != -1) {
                            fos.write(fileByte);
                        }
                        //자원사용종료
                        fis.close();
                        fos.close();

                    } catch (FileNotFoundException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    } catch (IOException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }

                    //원본 파일경로
                    String orithinouterFilePath = "/usr/local/apache-tomcat-8.5.54/webapps/ROOT/Assets/img/logoimg5.jpg";
                    //복사될 파일경로
                    String copythinouterFilePath = "/usr/local/apache-tomcat-8.5.54/webapps/ROOT/" + user_seq + "/logoimg5.jpg";

                    //파일객체생성
                    File orithinouterFile = new File(orithinouterFilePath);
                    //복사파일객체생성
                    File copythinouterFile = new File(copythinouterFilePath);

                    try {

                        FileInputStream fis = new FileInputStream(orithinouterFile); //읽을파일
                        FileOutputStream fos = new FileOutputStream(copythinouterFile); //복사할파일

                        int fileByte = 0;
                        // fis.read()가 -1 이면 파일을 다 읽은것
                        while((fileByte = fis.read()) != -1) {
                            fos.write(fileByte);
                        }
                        //자원사용종료
                        fis.close();
                        fos.close();

                    } catch (FileNotFoundException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    } catch (IOException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }


                }else {
                    System.out.println("이미 폴더가 생성되어 있습니다.");
                }

                byte[] data = file.getBytes();
                FileOutputStream fos = new FileOutputStream(path + "/" + fileName);
                fos.write(data);
                fos.close();

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
    @RequestMapping(value = "DelImg" , method = RequestMethod.POST)
    public @ResponseBody String DelImg(HttpServletRequest request) throws Exception{
        String seq =request.getParameter("seq");
        String file_name = request.getParameter("img");

        return mainService.delimg(file_name);
    }
}


