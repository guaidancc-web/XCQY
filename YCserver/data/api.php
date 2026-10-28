<?php
/*************************************************************************
 * 
 *edit_qq: 1902161476
 *edit_time: 2020/10/20
 *
 *************************************************************************/

//MYSQL配置信息
$dbip='127.0.0.1'; 				//数据库IP
$dbport='3306'; 		        //数据库端口
$dbuser='root'; 				//数据库帐号
$dbpwd='123456'; 		        //数据库密码
$dbname='account'; 		        //数据库名称

date_default_timezone_set('PRC');

function get_ip()
{
    $ip = FALSE;
    //客户端IP 或 NONE 
    if (!empty($_SERVER["HTTP_CLIENT_IP"])) {
        $ip = $_SERVER["HTTP_CLIENT_IP"];
    }
    //多重代理服务器下的客户端真实IP地址（可能伪造）,如果没有使用代理，此字段为空
    if (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
        $ips = explode(", ", $_SERVER['HTTP_X_FORWARDED_FOR']);
        if ($ip) {
            array_unshift($ips, $ip);
            $ip = FALSE;
        }
        for ($i = 0; $i < count($ips); $i++) {
            if (!preg_match("^(10│172.16│192.168).", $ips[$i])) {
                $ip = $ips[$i];
                break;
            }
        }
    }
    //客户端IP 或 (最后一个)代理服务器 IP 
    return ($ip ? $ip : $_SERVER['REMOTE_ADDR']);
}


//客户端接收的返回值：0:注册成功;  1:账号或密码错误;  2:账号已存在.； OK: 登陆成功；  其他值：未知错误,请联系客服
$username = (string)trim($_GET['account']);				//账号
$password = (string)trim($_GET['pwd']);					//密码
$time = (string)trim($_GET['time']);					//客户端请求时间戳
$sign = (string)trim($_GET['sign']);					//签名

if(substr($username, 4) == '' || $password == '' || $time == '' || $sign == ''){
	die('3');		//非法请求
}
if($sign != strtoupper(md5($username . $time . '!!##123'))){
	die('3');		//签名验证错误（可能存在另一个加密方式，如无法通过，请注释）
}
$conn = mysqli_connect($dbip, $dbuser, $dbpwd, $dbname, $dbport);
if (!$conn) {
    die('3');		//数据库连接错误
}
if(!mysqli_query($conn, "set names utf8")){
	die('3');		//数据库设置字符集错误
}
$ip = get_ip();
$username = substr($username, 4);
$par_username = addslashes($username);

$sql = "select * from user where username = '$par_username'";
$result = mysqli_query($conn, $sql);
$rowarr = mysqli_fetch_array($result, MYSQLI_ASSOC);
if(!$rowarr){
	//账号不存在，插入记录
	$sql = "insert into user (username, password, regip, regtime) values ('$username', '$password', '$ip', '$time')";
	$result = mysqli_query($conn, $sql);
	if(!$result){
		die('3');
	}
	die('0');
} 

if($password != $rowarr['password']){
	die('1');			
}

//登陆成功
$num = $rowarr['loginnum'] + 1;      //登陆次数加 1
$sql = "update user set loginip='$ip', logintime='$time', loginnum='$num' WHERE id='$rowarr[id]'";
mysqli_query($conn, $sql);

die('OK');
