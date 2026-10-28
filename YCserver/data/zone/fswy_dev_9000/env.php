<?php
/**----------------------------------------------------+
 * PHP环境配置文件
 * @author yeahoo2000@gmail.com
 +-----------------------------------------------------*/

// 环境初始化
define('DEBUG', false);

// 错误报告设置
if(DEBUG){ 
    error_reporting(E_ALL);
    ini_set('display_errors', 1);
}else{
    error_reporting(0);
    ini_set('display_errors', 0);
}

//系统目录结构
define('ROOT',                  getenv('ROOT'));
define('VAR_DIR',               ROOT.'/var');
define('WEB_DIR',               ROOT.'/www');
define('LIB_DIR',               "//data//web");

require LIB_DIR.'/global.php';

// 平台标识
define('PLATFORM',              "dev");
// 游戏区号
define('ZONE_ID',               9000);
// 语言设置
define('LANG',                  "zh_CN");
// 主密钥
define('SERVER_KEY',            "3vbz881dzoo21zb");
// 其它密钥
define('OTHER_KEY',             "");
// 管理后台通讯密钥
define('ADMIN_KEY',             "");
// 充值密钥
define('API_KEY',               "");

// --------------------------------------------------------
// 配置
// --------------------------------------------------------

$GLOBALS['cfg'] = array(
    'game_name' => '', // 该平台上使用的游戏名字，不同平台可能会使用不同的游戏名
    'zone_name' => 'fswy开发服9000', // 游戏分区名称，有时也作为页面title
    'ver' => '', // 当前版本号
    'host' => '42.192.118.16', // 游戏节点服务器地址，此处不带'http://'前缀
    'port' => 17000, // 游戏节点服务器端口
    'url_main' => 'http://42.192.118.16', // 服务器URL
    'url_login' => '', // 游戏登录地址URL
    'url_official' => 'http://fswy.syg', // 官网地址
    'url_bbs' => '', // 论坛地址
    'url_card' => '', // 新手卡地址
    'url_gm' => '', // 点GM按钮跳转链接,为空时正常弹出面板，默认为空
    'url_fcm' => '', // 防沉迷信息提交地址，默认为空
    'url_event' => '', // 游戏事件接收地址，用于社交平台，默认为空
    'url_pay' => '', // 游戏内充值地址
    'url_phone_reg' => '', // 手机梆定地址
    'url_reserve' => '', // 首服预约
    'wechat' => '', // 微信相关信息
    'contact' => '', // GM联系方式
    'time_open' => '1420713826', // 开服时间
    'time_open_test' => '0', // 开服测试时间
    'merge_time' => '0', // 合服时间
    'combine' => '', // 合服列表
    'mode_guest' => '0', // 是否使用游客模式(0:否 1:是)

    'server_key' => '3vbz881dzoo21zb', // 服务器主密钥
    'other_key' => '', // 其它密钥
    'key_admin' => '', // 管理后台主密钥
    'key_api' => '', // API接口密钥

    'ticket_lifetime' => 300, // ticket通用有效时长，单位：秒

    // erlang节点信息
    'erl' => array(
        'cookie' => '6bc1t325xjo21c1',
        'nodename' => 'fswy_dev_9000@42.192.118.16',
    ),

    // 充值接口相关配置
    'pay' => array(
        'key' => '', // 充值请求加密密钥
        'url' => '', // 充值地址
        'ticket_lifetime' => 60, // ticket失效时长，单位:秒
        'allow_ips' => array(), // 充值请求IP白名单，留空表示不启用
    ),

    // 数据库服务器信息
    'database' => array(
        'driver' => 'mysql',
        'encode' => 'utf8',
        'host' => 'localhost',
        'user' => 'root',
        'pass' => '123456',
        'dbname' => 'fswy_dev_9000'
    ),

    // 用于验证的一些正则表达式
    're' => array(
        'name' => '/^[a-z0-9_]{3,20}$/' // 角色名规则
    )
);

// --------------------------------------------------------
// 常规初始化
// --------------------------------------------------------

// 时区设置，不建议使用php.ini中的统一设置，失去了灵活性
date_default_timezone_set("");

// 设置session文件的失效时间，默认为6小时，必要时可在相应模块重设此值
ini_set("session.gc_maxlifetime", 21600);
// session文件清除机率，默认为20%，访问量大的网站可以设小一些
ini_set('session.gc_probability', 20);
// session保存到指定目录，最好使用内存虚拟的目录，以保证在大量访问时的效率
session_save_path(VAR_DIR.'/sess');

// 支持页面回跳
header('Cache-control: private, must-revalidate');
// 解决IE中iframe跨域访问cookie/session的问题
header('P3P: CP=CAO PSA OUR');
// 防止cookie被js获取
@ini_set("session.cookie_httponly", 1);

// 使用gz_handler压缩输出页面
// ob_start('ob_gzhandler'); //不能启用，在IE5,IE6中有时会白屏

// // 注册类自动加载方法
// set_include_path(LIB_DIR.'/base'.PATH_SEPARATOR. get_include_path());
// spl_autoload_register('class_loader');

// 如果PHP没有自动转义Request数据则在这里进行转义处理
if (!get_magic_quotes_gpc()) {
    $_GET = addQuotes($_GET);
    $_POST = addQuotes($_POST);
    $_FILES= addQuotes($_FILES);
    $_COOKIE= addQuotes($_COOKIE);
}
// 
// /**
//  * 类自动加载函数
//  * @param string $class 类名
//  */
// function class_loader($class){
//     if (class_exists($class) || interface_exists($class)) {
//         return;
//     }
//     include $class.'.class.php';
// }
