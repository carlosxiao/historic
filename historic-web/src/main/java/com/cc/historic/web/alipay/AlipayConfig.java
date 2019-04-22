package com.cc.historic.web.alipay;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */
public class AlipayConfig {
	
    //↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016092600597664";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDKcli8steu1iHQvuIyqWI/KJB2Eff6nj7IdsuV1AW8bDw0apMpD2GzpJ9YLa5LhQgIkTEwdlUj5E5XOiiz6wPlNQZIM/GTuBylzlb2lnXKMhMbT5Pq24j0QcKMmoUuOV/Hvlow6nvKE4ljLuSbUFBQ4j/H7CwoH+d8Bu76yqdyp4JY6gNs28tJK9zhn9jz2Tu0C7W5fv49mHsgZtrd28HC4ncL35Ymgzdzq/FpdOeLChHqMF1MyEavkKkoZyep2K16ECcVvMWGmMjWkCl8X1hyOccKFgJjE3FiDrYwWZVjaBWrJIst34OgqNR+KWjZRC0ec4vApIeeA0MvqAVuHWYLAgMBAAECggEBAJBN/7jKFnnWwxXj6qLIIHL6vDadSlEHmaMVIrsy/b+4uxV13l4HS9JchwS40yObuQU6UYDE6J2D8N+2YisVW5p3OHohJJLySuFZep2c1GuDVCFEkSB4yl+pvD6zKjmvxflAU1PI4OJDGMxtMaEQF6AAFgyw6SzUyRGcc56q878CKYTKVaVbjRyyjJ3ea4UHH/ORuXHZXTHDsh9s3GHKw2z4tJtyW4dErsgiI23bDtlCn/dC9eGIDVTlEexaz0Y3W7nvAx/GHi0cxA6X0Oy1uHTpL5PB0NcnRbH15H4YzseSOBCfxrf82B/qb8g4JfjGMsccOq+ssuBPquZF42HBKdECgYEA6JV4TIQTIRwoT/FI7SR2KY3oVug3DS9rYGSPPnRRXGMntZQDqTq3qb7+TajQh5bYgDc2EO+KHS/jrWK46OLb+BCEew/GuyEQSeGMXE1hwiVLub91UjTWl86NP20cbFpCZfkyZURUOgmtX1ukM9AQq6ZmgRLKaqAQMLhtNJhFubkCgYEA3tQhuFBbAbDQ7gEkIUgodN45s5L5WiaeJbRCCM3JQZ4+vUI55E76KTa98I+OAcWulBsBdb3GKTVlppwtIc9GZMAAB4CzoNgmBMnjPHxZRzhX5WyvGPFTkiuGNQeW+/oOIS6ctmDbnmUKIn9sfyMvxVOaaVB98QO+kRUVWyoW7+MCgYEA1nLy38IrjSzUMpmr/xPOa5QvtOoZ0Gt3mwI9XX2Mgx3dwDuAgKnmLHoxKlPMKii46Md/b3AeLbk5OWY8TmbWIUzBimJKf8IFrclsTLMAvyz6PIM+3pRfhMtrSx8ExRcX/8QcZmjxLC4+EB2EMk3XAR3Fh59WyadaJkH2VzdLmukCgYBWJ1i+RbtaJP4y95f7kkWqIf3XU307gPDmjRJ3CvHEgCWr0T5G6s5IPxUjPK3gO4lrVCG1X2GNr0qVJ48/oj+KVr3sKLPK/ad9dH16dm2iXsOFPgdZMn1oZ5GlUUDsPdtWswn+beacEF7hxbiyU2118wQhsfBvzk3RFIDEVbq2lwKBgQCafY/dmqjDVYZ5QF90u4HkE6UxgNTGtHe1rM9LUEhCFNWGCDorDQAFaCS1ehvp3NapEVH/FW9/qw5ZT/YYYZ5F8nXy29Hl3uXNgTdFsLlh5g+dnkdCuvchFuMAGywFngVNof7mcmb10kIOCNTPtA15phwY7411MPkdcyax39qptw==";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAynJYvLLXrtYh0L7iMqliPyiQdhH3+p4+yHbLldQFvGw8NGqTKQ9hs6SfWC2uS4UICJExMHZVI+ROVzoos+sD5TUGSDPxk7gcpc5W9pZ1yjITG0+T6tuI9EHCjJqFLjlfx75aMOp7yhOJYy7km1BQUOI/x+wsKB/nfAbu+sqncqeCWOoDbNvLSSvc4Z/Y89k7tAu1uX7+PZh7IGba3dvBwuJ3C9+WJoM3c6vxaXTniwoR6jBdTMhGr5CpKGcnqditehAnFbzFhpjI1pApfF9YcjnHChYCYxNxYg62MFmVY2gVqySLLd+DoKjUfilo2UQtHnOLwKSHngNDL6gFbh1mCwIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:9000/goods/alipayNotifyNotice";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:9000/goods/alipayReturnNotice";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

