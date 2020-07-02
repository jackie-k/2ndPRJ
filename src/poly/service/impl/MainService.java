package poly.service.impl;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;
import poly.dto.MainDTO;
import poly.persistance.mapper.MainMapper;
import poly.persistance.redis.IRedisMapper;
import poly.service.IMainService;
import poly.util.DateUtil;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

@Service("MainService")
public class MainService implements IMainService {
    private Logger log = Logger.getLogger(this.getClass());

    @Resource(name = "MainMapper")
    private MainMapper mainMapper;

    @Resource(name = "RedisMapper")
    private IRedisMapper redisMapper;


    @Override
    public int reviewAdd(MainDTO rDTO) throws Exception {
        return mainMapper.reviewAdd(rDTO);
    }

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

    @Override
    public List<MainDTO> collectFashion() throws Exception {

        log.info(this.getClass().getName() + ".collectFashion Start");

        int res = 0;

        List<MainDTO> pList = new ArrayList<MainDTO>();

        String url = "https://store.musinsa.com/app/";

        Document doc = null;

        doc = Jsoup.connect(url).get();

        Elements element = doc.select("body");

        Iterator<Element> FashionRankList = element.select("dd.listItem").iterator();

        while (FashionRankList.hasNext()) {

            Element FashionInfo = FashionRankList.next();

            String rank = FashionInfo.select("a span.rank").text(); // 영화 번호
            String word = FashionInfo.select("a span.word").text(); // 영화 제목

            System.out.println(rank + word);

            FashionInfo = null;

            MainDTO pDTO = new MainDTO();
            pDTO.setRank(rank);
            pDTO.setWord(word);


            pList.add(pDTO);

        }

        return pList;

    }

    @Override
    public String DelList(String top) throws Exception {
        return mainMapper.DelList(top);
    }

    @Override
    public List<MainDTO> getRecomList(String email) throws Exception {
        return mainMapper.getRecomList(email);
    }

}
