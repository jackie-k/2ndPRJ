package poly.service;

import poly.dto.MainDTO;

import java.util.HashMap;
import java.util.List;

public interface IMainService {
    int reviewAdd(MainDTO rDTO) throws Exception;

    List<MainDTO> getsearch(HashMap<String, String> hMap) throws Exception;

    String usercheck(MainDTO mDTO) throws Exception;

    int userdup(MainDTO mDTO) throws Exception;

    MainDTO seqcheck(String email) throws Exception;

    MainDTO category(String type) throws Exception;

    String delimg(String file_name) throws Exception;

    List<MainDTO> getimg(MainDTO mDTO) throws Exception;

    List<MainDTO> collectFashion() throws Exception;

    String DelList(String top) throws Exception;

    List<MainDTO> getRecomList(String email) throws Exception;
}
