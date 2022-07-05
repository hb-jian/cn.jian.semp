package cn.jian.semp.constants;



public class ApiCodeConst {
    private ApiCodeConst(){}
    //成功
    public static final String 成功="0";
    //公共异常
    public static final String 系统内部错误="-99999";
    public static final String 缺少必要参数="-99900";
    public static final String 参数不合法="-99901";
    public static final String 未授权的操作="-99000";
    public static final String Token已过期="-99001";
    public static final String Token已禁用="-99002";
    public static final String 无效的Token="-99003";
    public static final String 操作太频繁="-99004";
    //登录
    public static final String 登录_无效的验证码="-90000";
    public static final String 登录_用户名或密码不正确="-90001";
    public static final String 登录_账号已禁用="-90002";

    //用户注册
    public static final String 用户注册_账号重复="-90100";
    //用户角色
    public static final String 用户角色_错误的权限配置="-90200";
    public static final String 用户角色_无效的角色记录="-90201";
}
