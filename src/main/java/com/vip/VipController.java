package com.vip;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

/**
 * @author TangFD@HF 2018/7/16
 */
@Controller
public class VipController {
    private static Map<String, String> URL_MAP;

    static {
        URL_MAP = new HashMap<>(3);
        URL_MAP.put("youku", "http://so.youku.com/search_video/q_");
        URL_MAP.put("iqiyi", "http://so.iqiyi.com/so/q_");
        URL_MAP.put("qq", "https://v.qq.com/x/search/?q=");
    }

    @RequestMapping("/")
    public String index() {
        return "vip";
    }

    @RequestMapping(value = "/vip-search", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String search(@RequestParam String type, @RequestParam String key) throws IOException {
        GetMethod method = new GetMethod(URL_MAP.get(type) + URLEncoder.encode(key, "utf-8"));
        HttpClient client = new HttpClient();
        client.executeMethod(method);
        int statusCode = method.getStatusCode();
        if (statusCode != HttpStatus.SC_OK) {
            return "";
        }

        String result = toStringValue(method.getResponseBodyAsStream());
        try {
            if ("youku".equals(type)) {
                result = result.split("\"domid\":\"bpmodule-main\"")[1].split("bigview.beforePageletArrive")[0];
                result = result.replace("\\n", "").replace("\\t", "").replace("&quot;", "").replace("})", "").replace("\\", "");
                result = result.split(",\"html\":\"")[1].split("</script>")[0];
                result = result.replace("display:none;", "display:block;");
                result = result.replace("<img alt=\"", "<img src=\"").replace("src=\"//img", "alt=\"//img");
                result = result.replace("href=\"//v.youku.com", "href=\"http://v.youku.com");
                result = result.replace("href=\"/search_video/q_", "href=\"http://so.youku.com/search_video/q_");
            } else if ("iqiyi".equals(type)) {
                result = result.split("<!-- 搜索内容 -->")[1].split("<!-- 侧边结构 -->")[0];
                result = result.replace("href=\"/so/q_", "href=\"http://so.iqiyi.com/so/q_");
                result = result.replace("src=\"            //pic", "src=\"/vip/vip-IQYImg?url=http://pic");
                result = result.replace("src=\"//pic", "src=\"/vip/vip-IQYImg?url=http://pic");
            } else if ("qq".equals(type)) {
                int start = result.indexOf("<div class=\"wrapper\">");
                int end = result.indexOf("<div class=\"wrapper_main none\"");
                result = result.substring(start, end);
                result = result.replace("class=\"result_relative\"", "class=\"result_relative none\"");
                result = result.replace("class=\"tip_download\"", "class=\"tip_download none\"");
            } else {
                return "";
            }

            result = result.replace("href=\"http://v.youku.com", "href=\"javascript:void(0);\" data-type=\"go-vip\" data-url=\"http://v.youku.com");
            result = result.replace("href=\"http://www.mgtv.com", "href=\"javascript:void(0);\" data-type=\"go-vip\" data-url=\"http://www.mgtv.com");
            result = result.replace("href=\"http://www.iqiyi.com", "href=\"javascript:void(0);\" data-type=\"go-vip\" data-url=\"http://www.iqiyi.com");
            result = result.replace("href=\"http://v.qq.com", "href=\"javascript:void(0);\" data-type=\"go-vip\" data-url=\"http://v.qq.com");
            result = result.replace("href=\"https://v.qq.com", "href=\"javascript:void(0);\" data-type=\"go-vip\" data-url=\"https://v.qq.com");
            result = result.replace("href=\"https://v.youku.com", "href=\"javascript:void(0);\" data-type=\"go-vip\" data-url=\"https://v.youku.com");
            result = result.replace("href=\"https://www.mgtv.com", "href=\"javascript:void(0);\" data-type=\"go-vip\" data-url=\"https://www.mgtv.com");
            result = result.replace("href=\"https://www.iqiyi.com", "href=\"javascript:void(0);\" data-type=\"go-vip\" data-url=\"https://www.iqiyi.com");
            return result;
        } catch (Exception e) {
            return "";
        }
    }

    private String toStringValue(InputStream inputStream) throws IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
        StringBuilder stringBuilder = new StringBuilder();
        String str;
        while ((str = reader.readLine()) != null) {
            stringBuilder.append(str);
        }

        return stringBuilder.toString();
    }

    @RequestMapping("/vip-IQYImg")
    @ResponseBody
    public void IQYImg(@RequestParam String url, HttpServletResponse response) throws IOException {
        GetMethod method = new GetMethod(url);
        HttpClient client = new HttpClient();
        client.executeMethod(method);
        int statusCode = method.getStatusCode();
        if (statusCode != HttpStatus.SC_OK) {
            return;
        }

        BufferedImage bi = ImageIO.read(method.getResponseBodyAsStream());
        ImageIO.write(bi, "JPEG", response.getOutputStream());
    }
}
