package cn.jian.semp.model;

import cn.jian.semp.constants.ApiCodeConst;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.util.List;

@JsonInclude(JsonInclude.Include.NON_NULL)
@Data
public class JsonResponse<T> {
    @JsonProperty("timestamp")
    private Long timestamp = System.currentTimeMillis();
    @JsonProperty("state")
    private JsonResultState state;
    @JsonProperty("data")
    private T data;
    @JsonProperty("pagingRows")
    private JsonPagingResultData<T> pagingRows;

    /**
     * 无结果响应
     * @param state
     */
    public JsonResponse(JsonResultState state){
        setState(state);
        setData(null);
    }

    /**
     * 单一对象结果
     * @param state
     * @param data
     */
    public JsonResponse(JsonResultState state,T data){
        setState(state);
        setData(data);
    }

    /**
     * 分页访问结果
     * @param state
     * @param pagingDatas
     */
    public JsonResponse(JsonResultState state,JsonPagingResultData<T> pagingDatas){
        setState(state);
        setPagingRows(pagingDatas);
    }

    /**
     * 单一对象响应
     * @param jsonData
     * @param <T>
     * @return
     */
    public static <T> HttpEntity<Object> success(T jsonData) {
        JsonResponse responseData = new JsonResponse(new JsonResultState(ApiCodeConst.成功, "操作成功"),jsonData);
        return new ResponseEntity<>(responseData, HttpStatus.OK);
    }

    /**
     * 分页响应
     * @param totalCount
     * @param rows
     * @param <T>
     * @return
     */
    public static <T> HttpEntity<Object> success(long totalCount, List<T> rows) {
        JsonResponse responseData = new JsonResponse(new JsonResultState(ApiCodeConst.成功, "操作成功"),new JsonPagingResultData(totalCount,rows));
        return new ResponseEntity<>(responseData, HttpStatus.OK);
    }

    /**
     * 无结果响应
     * @return
     */
    public static HttpEntity<Object> success() {
        JsonResponse responseData = new JsonResponse(new JsonResultState(ApiCodeConst.成功, "操作成功"));
        return new ResponseEntity<>(responseData, HttpStatus.OK);
    }

    /**
     * 错误响应
     * @param code
     * @param message
     * @return
     */
    public static HttpEntity<Object> error(String code, String message) {
        JsonResponse responseData = new JsonResponse(new JsonResultState(code, message));
        return new ResponseEntity<>(responseData, HttpStatus.OK);
    }
}