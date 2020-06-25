package poly.service.impl;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import poly.dto.MainDTO;
import poly.persistance.mapper.MainMapper;
import poly.service.IMainService;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@Service("MainService")
public class MainService implements IMainService {
    private Logger log = Logger.getLogger(this.getClass());

    @Resource(name = "MainMapper")
    private MainMapper mainMapper;

    @Override
    public List<MainDTO> getsearch(HashMap<String, String> hMap) throws Exception {

        return mainMapper.getsearch(hMap);
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
}
