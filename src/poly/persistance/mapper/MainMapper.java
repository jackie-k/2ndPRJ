package poly.persistance.mapper;

import config.Mapper;
import poly.dto.MainDTO;

import java.util.HashMap;
import java.util.List;

@Mapper("MainMapper")
public interface MainMapper {
    List<MainDTO> getsearch(HashMap<String, String> hMap) throws Exception;
}
