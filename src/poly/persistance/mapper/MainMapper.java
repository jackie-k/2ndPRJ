package poly.persistance.mapper;

import config.Mapper;
import poly.dto.MainDTO;

import java.util.HashMap;
import java.util.List;

@Mapper("MainMapper")
public interface MainMapper {
    int reviewAdd(MainDTO rDTO) throws Exception;

    List<MainDTO> getMyPage(String user_seq) throws Exception;

    List<MainDTO> getsearch(HashMap<String, String> hMap) throws Exception;

    String usercheck(MainDTO mDTO) throws Exception;

    int userdup(MainDTO mDTO) throws Exception;

    MainDTO seqcheck(String email)throws Exception;

    MainDTO category(String type) throws Exception;

    int insertFileInfo(MainDTO cDTO) throws Exception;

    String delimg(String file_name) throws Exception;

    List<MainDTO> getimg(MainDTO mDTO) throws Exception;

    List<MainDTO> getCoorInfo(MainDTO pDTO) throws Exception;

    String DelList(String top) throws Exception;

    List<MainDTO> getRecomList(String email) throws Exception;
}
