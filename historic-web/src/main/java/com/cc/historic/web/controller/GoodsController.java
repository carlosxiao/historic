package com.cc.historic.web.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.cc.historic.web.alipay.AlipayConfig;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import static com.sun.xml.internal.ws.api.message.Packet.State.ServerResponse;

/**
 * @author xiao
 * 商品控制器
 */
@Controller
@RequestMapping("goods")
@Slf4j
public class GoodsController {

    @RequestMapping("{id}")
    public String good(@PathVariable() Integer id) {
        return "goods_details";
    }

    /**
     * 生成订单
     * @return
     */
    @PostMapping("createOrder")
    public String createOrder() {

        String orderId = "";
        return orderId;
    }

    /**
     * 确认订单
     * @return
     */
    @GetMapping
    public String confirmOrder() {

        return "confirm_order";
    }

    @PostMapping(value = "/aliPay", produces = "text/html; charset=UTF-8")
    public String aliPay(String orderId, HttpServletRequest request, HttpServletRequest response) throws AlipayApiException {
        // 订单信息

        // 产品信息

        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

        //商户订单号，商户网站订单系统中唯一订单号，必填
        String out_trade_no = orderId;
        //付款金额，必填
        String total_amount = "1";
        //订单名称，必填
        String subject = "iphone";
        //商品描述，可空
        String body = "用户订购商品个数：1";

        // 该笔订单允许的最晚付款时间，逾期将关闭交易。取值范围：1m～15d。m-分钟，h-小时，d-天，1c-当天（1c-当天的情况下，无论交易何时创建，都在0点关闭）。 该参数数值不接受小数点， 如 1.5h，可转换为 90m。
        String timeout_express = "30m";

        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                + "\"total_amount\":\""+ total_amount +"\","
                + "\"subject\":\""+ subject +"\","
                + "\"body\":\""+ body +"\","
                + "\"timeout_express\":\""+ timeout_express +"\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        //请求
        String result = alipayClient.pageExecute(alipayRequest).getBody();

        return result;
    }

    @RequestMapping("alipay_callback.do")
    @ResponseBody
    public Object alipayCallback(HttpServletRequest request) {
        Map<String, String> params = new HashMap<>();
        Map requestParams = request.getParameterMap();
        for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
            }
            params.put(name, valueStr);
        }
        log.info("支付宝回调，sign:{},trade_status:{},参数:{}", params.get("sign"), params.get("trade_status"), params.toString());

        //非常重要，验证回调的正确性，是不是支付宝发的，并且还要避免重复通知

        params.remove("sign");
        try {
            boolean alipayRSACheckedV2 = AlipaySignature.rsaCheckV2(params, AlipayConfig.alipay_public_key, "UTF-8", AlipayConfig.sign_type);
            if (!alipayRSACheckedV2) {
                //return ServerResponse.createByErrorMessage("非法请求,验证不通过,在请求我就报警了！");
            }

        } catch (AlipayApiException e) {
            log.error("支付宝验证回调异常...", e);
        }
        //验证各种数据
        // 验证订单合法性
        // 订单状态
        // 生成支付信息
        //ServerResponse serverResponse = iOrderService.alipayCallback(params);
//        if (serverResponse.isSuccess()) {
//            return Const.AlipayCallback.RESPONSE_SUCCESS;
//        }

        return null;

    }
}
