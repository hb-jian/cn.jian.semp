package cn.jian.semp.model;

import lombok.Data;

import java.util.List;

@Data
public class JsonPagingResultData<T> {
    private long totalCount;
    private List<T> rows;

    public JsonPagingResultData(long totalCount,List<T> rows){
        setTotalCount(totalCount);
        setRows(rows);
    }
}
