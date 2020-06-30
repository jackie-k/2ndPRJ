package poly.service.impl;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import poly.dto.MainDTO;
import poly.persistance.mapper.MainMapper;
import poly.persistance.redis.IRedisMapper;
import poly.service.IMainService;
import poly.util.DateUtil;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service("MainService")
public class MainService implements IMainService {
    private Logger log = Logger.getLogger(this.getClass());

    @Resource(name = "MainMapper")
    private MainMapper mainMapper;

    @Resource(name = "RedisMapper")
    private IRedisMapper redisMapper;


    @Override
    public List<MainDTO> getsearch(HashMap<String, String> hMap) throws Exception {
        log.info(this.getClass().getName() + " : getProjectInfo 호출");

        List<MainDTO> rList = null;

        String key = "Coordination Info" + hMap.get("SearchQuery") + DateUtil.getDateTime("yyyyMMdd");

        if (redisMapper.getExists(key)) {
            rList = redisMapper.getCoorInfo(key);

            if (rList == null) {
                rList = new ArrayList<MainDTO>();
            }

            redisMapper.setTimeOutMinute(key, 1);
        } else {

            rList = mainMapper.getsearch(hMap);

            if (rList == null) {
                rList = new ArrayList<MainDTO>();
            }

            if (rList.size() > 0) {
                redisMapper.setCoorInfo(key, rList);

                redisMapper.setTimeOutMinute(key, 1);
            }
        }

        log.info(this.getClass().getName() + " : getCoordinationInfo 종료");

        return rList;
    }

    @Override
    public String usercheck(MainDTO mDTO) throws Exception {
        log.info("-------------------------------------------------------------");
        return mainMapper.usercheck(mDTO);
    }

    @Override
    public int userdup(MainDTO mDTO) throws Exception {
        return mainMapper.userdup(mDTO);
    }

    @Override
    public MainDTO seqcheck(String email) throws Exception {
        return mainMapper.seqcheck(email);
    }

    @Override
    public MainDTO category(String category) throws Exception {
        return mainMapper.category(category);
    }

    @Override
    public String delimg(String file_name) throws Exception {
        return mainMapper.delimg(file_name);
    }

    @Override
    public List<MainDTO> getimg(MainDTO mDTO) throws Exception {
        return mainMapper.getimg(mDTO);
    }

//    @Override
//    public List<MainDTO> getCorInfo(MainDTO pDTO) throws Exception {
//
//        log.info(this.getClass().getName() + " : getProjectInfo 호출");
//
//        List<MainDTO> rList = null;
//
//        System.out.println("pDTO : " + pDTO.getName());
//
//        String key = "PROJECT_INFO_" + DateUtil.getDateTime("yyyyMMdd");
//
//        if (redisMapper.getExists(key)) {
//            rList = redisMapper.getProjectInfo(key);
//
//            if (rList == null) {
//                rList = new ArrayList<MainDTO>();
//            }
//
//            redisMapper.setTimeOutMinute(key, 1);
//        } else {
//
//            rList = mainMapper.getProjectInfo(pDTO);
//
//            if (rList == null) {
//                rList = new ArrayList<MainDTO>();
//            }
//
//            if (rList.size() > 0) {
//                redisMapper.setProjectInfo(key, rList);
//
//                redisMapper.setTimeOutMinute(key, 10);
//            }
//        }
//
//        log.info(this.getClass().getName() + " : getProjectInfo 종료");
//
//        return rList;
//    }
}
