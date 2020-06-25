package poly.service.impl;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import poly.dto.MainDTO;
import poly.persistance.mapper.MainMapper;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import javax.annotation.Resource;
import java.io.File;
import java.util.List;


@Service("UploadService")
public class UploadService {
    private Logger log = Logger.getLogger(this.getClass());

    @Resource(name = "MainMapper")
    private MainMapper mainMapper;

    public List<MainDTO> getMyPage(String user_seq) throws Exception {
        return mainMapper.getMyPage(user_seq);
    }

    // 리눅스 기준으로 파일 경로를 작성 ( 루트 경로인 /으로 시작한다. )
    // 윈도우라면 workspace의 드라이브를 파악하여 JVM이 알아서 처리해준다.
    // 따라서 workspace가 C드라이브에 있다면 C드라이브에 upload 폴더를 생성해 놓아야 한다.

    public int insertFileInfo(MainDTO cDTO) throws Exception {
        return mainMapper.insertFileInfo(cDTO);
    }
}
