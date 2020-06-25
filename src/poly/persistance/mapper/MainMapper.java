package poly.persistance.mapper;

import config.Mapper;
import poly.dto.MainDTO;

import java.util.HashMap;
import java.util.List;

@Mapper("MainMapper")
public interface MainMapper {
    List<MainDTO> getMyPage(String user_seq) throws Exception;

    List<MainDTO> getsearch(HashMap<String, String> hMap) throws Exception;

    String usercheck(MainDTO mDTO) throws Exception;

    int userdup(MainDTO mDTO) throws Exception;

    MainDTO seqcheck(String email)throws Exception;

    MainDTO category(String type) throws Exception;

    int insertFileInfo(MainDTO cDTO) throws Exception;
}
