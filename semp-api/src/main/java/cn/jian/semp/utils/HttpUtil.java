package cn.jian.semp.utils;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * http工具类
 */
@Slf4j
public class HttpUtil {
    static String DefaultEncoding = "UTF-8";
    static String DefaultContentType = "application/json";

    /**
     * 获取请求真实ip
     * @param request
     * @return
     */
    public static String getIpAddr(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

    /**
     * post方式发送请求，允许指定编码格式
     * 默认编码为utf-8，contenttype为application/json
     * @param url
     * @param body
     * @return
     */
    public static String post(String url, String body) throws Exception {
        return post(url,body,DefaultEncoding,DefaultContentType);
    }

    /**
     * post方式发送请求，允许指定编码格式
     * 默认编码为utf-8，contenttype为application/json
     * @param url
     * @param body
     * @param encoding 可选，不传则使用utf-8编码
     * @return
     */
    public static String post(String url, String body, String encoding) throws Exception {
        if(StringUtils.isBlank(encoding))
            encoding = DefaultEncoding;

        return post(url,body,encoding,DefaultContentType);
    }

    /**
     * post方式发送请求，允许指定编码和contenttype
     * 默认编码为utf-8，contenttype为application/json
     * @param url
     * @param body
     * @param encoding 可选，不传则使用utf-8编码
     * @param contentType 可选，不传则使用application/json
     * @return
     */
    public static String post(String url, String body, String encoding,String contentType) throws Exception{
        if(StringUtils.isBlank(encoding))
            encoding = DefaultEncoding;

        if(StringUtils.isBlank(contentType))
            contentType = DefaultContentType;

        Map<String,String> headers = new HashMap<>();
        headers.put("Content-Type",contentType);

        return post(url,body,encoding,headers);
    }

    /**
     * post方式发送请求，允许指定编码和请求头信息
     * @param url
     * @param body
     * @param encoding 可选，不传则使用utf-8
     * @param headers 可选，不传则使用标准header
     * @return
     */
    public static String post(String url, String body, String encoding, Map<String,String> headers) throws Exception{
        CloseableHttpClient httpclient = null;
        CloseableHttpResponse response = null;
        String returnString = null;
        String tmpId =  System.currentTimeMillis()+"";

        try {
            httpclient = getHttpClient();
            //操作计时
            long startTime = System.currentTimeMillis();
            log.info(String.format("[HttpClient #%s] 开始发送请求:%s，请求参数 %s ",tmpId,url,body));
            HttpPost httpost = new HttpPost(url);
            //设置请求头
            if (headers != null) {
                for (String key : headers.keySet()) {
                    httpost.setHeader(key, headers.get(key));
                }
            }
            //设置发送内容
            httpost.setEntity(new StringEntity(body, encoding));
            //发送请求
            response = httpclient.execute(httpost);

            long usedTime = System.currentTimeMillis() - startTime;
            //判断http响应结果，响应为空时，抛出异常
            if (response == null)
                throw new Exception(String.format("[HttpClient #%s] 请求失败，服务器返回信息为空。耗时：%s毫秒",tmpId,usedTime));

            //判断http响应状态码，针对非200状态码，抛出异常
            if(response.getStatusLine().getStatusCode() != HttpStatus.SC_OK)
                throw new Exception(String.format("[HttpClient #%s] 请求失败，服务器返回状态码：%s 耗时：%s毫秒",tmpId,
                        response.getStatusLine().toString(),
                        usedTime));

            //读取响应内容
            HttpEntity entity = response.getEntity();
            returnString = EntityUtils.toString(entity, encoding);
            log.info(String.format("[HttpClient #%s] 请求响应结果:%s 耗时：%s毫秒",tmpId,returnString, usedTime));
        } catch (Exception ex) {
            log.error(String.format("[HttpClient #%s] 处理异常，异常信息：%s",tmpId,ex));
            throw ex;
        } finally {
            releaseConnection(httpclient,response);
        }
        return returnString;
    }

    /**
     * 获取http连接实例
     * @return
     */
    public static CloseableHttpClient getHttpClient() {
        RequestConfig defaultConfig = RequestConfig.custom()
                .setConnectTimeout(5000)//建立连接请求的超时时间
                .setConnectionRequestTimeout(5000)//从连接池获取连接的超时时间
                .setSocketTimeout(30000)//从服务器读取数据的超时时间
                .build();

        CloseableHttpClient httpClient = HttpClients.custom().setDefaultRequestConfig(defaultConfig).build();
        return httpClient;
    }

    /**
     * get请求
     * @param url 请求url
     * @return 结果字符串
     * @throws Exception
     */
    public static String get(String url) throws Exception{
        return get(url,null);
    }

    /**
     * get请求
     * @param url 请求url
     * @param headers 请求头
     * @return 结果字符串
     * @throws Exception
     */
    public static String get(String url, Map<String,String> headers) throws Exception {
        CloseableHttpClient httpclient = null;
        CloseableHttpResponse response = null;
        String rspString = null;
        String tmpId =  System.currentTimeMillis()+"";

        try {
            httpclient = getHttpClient();
            //请求计时
            long startTime = System.currentTimeMillis();
            log.info(String.format("[HttpClient #%s] 开始发送请求:%s",tmpId,url));

            //执行请求
            HttpGet httpGet = new HttpGet(url);// 创建get请求
            //设置请求头
            if (headers != null) {
                for (String key : headers.keySet()) {
                    httpGet.setHeader(key, headers.get(key));
                }
            }
            response = httpclient.execute(httpGet);

            long usedTime = System.currentTimeMillis() - startTime;
            //解析响应结果
            HttpEntity entity = response.getEntity();// 从响应中取得一个响应实体

            //判断http响应结果，响应为空时，抛出异常
            if (response == null)
                throw new Exception(String.format("[HttpClient #%s] 请求失败，服务器返回信息为空。耗时：%s毫秒",tmpId,usedTime));

            //判断http响应状态码，针对非200状态码，抛出异常
            if(response.getStatusLine().getStatusCode() != HttpStatus.SC_OK)
                throw new Exception(String.format("[HttpClient #%s] 请求失败，服务器返回状态码：%s 耗时：%s毫秒",tmpId,
                        response.getStatusLine().toString(),
                        usedTime));

            //转换为文本内容
            rspString = EntityUtils.toString(entity,"UTF-8");// 把响应实体转成文本信息
            log.info(String.format("[HttpClient #%s] 请求响应结果:%s 耗时：%s毫秒",tmpId, rspString,usedTime));
        } catch (Exception ex) {
            log.error(String.format("[HttpClient #%s] 处理异常，异常信息：%s", tmpId, ex));
            throw ex;
        }finally {
            releaseConnection(httpclient,response);
        }

        return rspString;
    }

    /**
     * 释放http连接
     * @param httpClient
     * @param response
     */
    private static void releaseConnection(CloseableHttpClient httpClient,CloseableHttpResponse response){
        //关闭响应连接
        if (response != null) {
            try {
                response.close();
            }catch (IOException ex){
                log.warn("[HttpClient] 关闭Response出现异常",ex);
            }
        }
        //关闭连接
        if (httpClient != null) {
            try {
                httpClient.close();
            } catch (IOException ex) {
                log.warn("[HttpClient] 关闭HttpClient出现异常",ex);
            }
        }
    }
}
