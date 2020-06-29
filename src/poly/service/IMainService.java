package poly.service;

import poly.dto.MainDTO;

import java.util.HashMap;
import java.util.List;

public interface IMainService {
    List<MainDTO> getsearch(HashMap<String, String> hMap) throws Exception;

    String usercheck(MainDTO mDTO) throws Exception;

    int userdup(MainDTO mDTO) throws Exception;

    MainDTO seqcheck(String email) throws Exception;

    MainDTO category(String type) throws Exception;

    String delimg(String file_name) throws Exception;

    List<MainDTO> getimg(MainDTO mDTO) throws Exception;
}
