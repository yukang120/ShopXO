#!/usr/bin/bash
#修改shopxo后台版权显示
#每次都找太麻烦了
#联系我：443644290@qq.com
#版本1.01
if [ -f "/etc/redhat-release" ]; then
        shopxo_system="centos"
    elif [ -f "/etc/lsb-release" ]; then
        shopxo_system="ubuntu"
    elif [ -f "/etc/debian_version" ]; then
        shopxo_system="debian"
    else
        shopxo_system="unknown"
    fi
if [ `id -u` = 0 ]  && [ -f application/index/view/default/public/footer_nav.html ] && [ -f application/admin/view/default/admin/login_info.html ] && [ -f application/admin/view/default/public/header.html ] && [ -f application/admin/view/default/public/nav.html ] && [ -f application/admin/controller/Index.php ] && [ -f application/admin/view/default/index/init.html ];then
	echo "开始运行..."
else
	echo "权限不足或者运行文件不在网站根目录"
	exit;
fi
echo "正在安装依赖..."

if [ "$shopxo_system" -eq "centos" ];then
		echo -e "检测到系统分支：CentOS"
        echo -e "正在安装必需组件……"
		yum -y install lrzsz vim &>/dev/null
	elif [ "$shopxo_system" -eq "ubuntu"   ];then
		echo -e "检测到系统分支：CentOS"
        echo -e "正在安装必需组件……"
		apt-get -y install lrzsz vim &>/dev/null
	elif [ "$shopxo_system" -eq "debian" ];then
		echo -e "检测到系统分支：CentOS"
        echo -e "正在安装必需组件……"
		apt-get -y install lrzsz vim &>/dev/null
	elif [ "$shopxo_system" -eq "unknown" ];then
		echo -e "系统分支未知，取消环境安装，建议手动安装环境！"
		fi


echo "安装完成"
echo -e "\e[34m

shopxo_mulu(){


#=========================================================
# 修改shopxo版权工具
# 支持平台:  CentOS/Debian/Ubuntu
# 作者微信:  ting64
# E-mail:    443644290@qq.com
# 请输入选项修改：      
#       1.第一次修改默认参数
#       2.第二次修改参数
#	    3.还原修改
#		4.退出
#       注意：这个没修改小程序底部版权
#========================================================
\e[0m"
while 1
do
	read -p "请输入选项: " test
	case $test in

1)	
	shopxo_shuru
	;;
2)	
	shopxo_vim
	;;
3)	
	shopxo_huanyuan
	;;
4)	
	exit;
	;;
*)
	echo "Error,正在退出..."
	;;
	esac
done
}
shopxo_vim(){
        echo -e "\e[34m
#=========================================================
# 修改shopxo版权vim工具
# 支持平台:  CentOS/Debian/Ubuntu
# 作者:      ting64
# E-mail:    443644290@qq.com
# 请输入选项修改：      
#       1.前端底部
#       2.后台登录页面ShopXO
#       3.后台浏览器标题
#       4.后台管理顶部导航左侧
#       5.后台首页底部左侧
#       6.后台首页底部右侧修改团队
#	7.修改favicon.ico文件
#========================================================
\e[0m"

       read -p "请输入选项: " vimzj
        case $vimzj in
1)
        vim +87 application/index/view/default/public/footer_nav.html
cp   application/index/view/default/public/footer_nav.html application/index/view/default/public/footer_nav.html.old
  echo "操作完成"
	exit;
	;;
2)
        vim +7 application/admin/view/default/admin/login_info.html
cp application/admin/view/default/admin/login_info.html application/admin/view/default/admin/login_info.html.old
        echo "操作完成"
	        exit;

	;;
3)
        vim  +7 application/admin/view/default/public/header.html
        cp application/admin/view/default/public/header.html application/admin/view/default/public/header.html.old
		echo "操作完成"
	        exit;

	;;
4) 
        vim +4 application/admin/view/default/public/nav.html
		cp  application/admin/view/default/public/nav.html application/admin/view/default/public/nav.html.old
	   echo "操作完成"
	        exit;

	;;
5)
        vim +69 application/admin/controller/Index.php
        cp application/admin/controller/Index.php application/admin/controller/Index.php.old
		echo "操作完成"
	        exit;

	;;
6)
        vim +180 application/admin/view/default/index/init.html
        cp application/admin/controller/Index.php application/admin/controller/Index.php.old
		echo "操作完成"
	        exit;

	;;
7)
	read -p "确认删除原favicon.ico文件[y/n]: " jin
        if [ "$jin" = 'y' ];then
		mv  public/favicon.ico public/favicon.ico.old
		cd public/
		rz
		echo "上传完成。。。"
		cd -
		exit;
        else
                exit;
        fi
	;;
*)
        echo "Error"
        exit;
        ;;
        esac
}
          
shopxo_shuru(){
read -p "前端底部把Powered by修改为: "   power
read -p "前端底部把超链接http://shopxo.net/修改为: "  wangzhi
read -p "前端底部把Shop修改为: " shop
read -p "前端底部把XO修改为: " xo
read -p "后台登录页面把（ShopXO）修改为: "  shopxo
read -p "后台浏览器标题和后台管理顶部导航左侧把（ShopXO后台管理系统）修改为：" houtai
read -p "把软件版本SHOPXO修改为: " banben
cat   <<-EOF
Poweredby修改为: $power
超链接http://shopxo.net/:$wangzhi
shop: $shop
XO:$xo
shopxo:$shopxo
SHOPXO后台管理系统:$houtai
软件版本SHOPXO：$banben
EOF
read -p "请确认修改：[y/n]: " yes
case $yes in
y|Y|yes|YES)
        echo "正在替换..."
        shopxo_tihuan
        ;;
n|N|no|NO)
        echo "正在退出"
        exit;
        ;;
*)
        echo "输入错误,请重新输入:"
		shopxo_mulu
        ;;
        esac
}
shopxo_tihuan(){
sed -ri.old "87,115s/Powered by/$power/g" application/index/view/default/public/footer_nav.html
sed -ri "87,115s#"http://shopxo.net/"#$wangzhi#g" application/index/view/default/public/footer_nav.html
sed -ri "88,116s/Shop/$shop/g" application/index/view/default/public/footer_nav.html
sed -ri "88,116s/XO/$xo/g" application/index/view/default/public/footer_nav.html
#后台登录页面   
sed -ri.old "7s/ShopXO/$shopxo/g"   application/admin/view/default/admin/login_info.html
#后台浏览器标题         
sed -ri.old "7s/ShopXO后台管理系统/$houtai/g"  application/admin/view/default/public/header.html
#后台管理顶部导航左侧
sed -ri.old "4s/ShopXO/$shopxo/g"  application/admin/view/default/public/nav.html
#后台首页底部修改
sed -ri.old "69s/ShopXO/$banben/g"  application/admin/controller/Index.php
#sed -ri.old "181,209s/^/#/g" application/admin/view/default/index/init.html
cp public/favicon.ico public/favicon.ico.old
read -p "确认删除原favicon.ico文件[y/n]: " jin
if [ "$jin" = 'y' ];then
        mv public/favicon.ico public/favicon.ico.old
        cd public/
        rz
        echo "上传完成。。。"
        cd -
fi
cp application/admin/view/default/index/init.html application/admin/view/default/index/init.html.old
read -p "最后一个文件参数比较多，可以选择(1或者其他任意键值)[1.自动屏蔽/其他：修改]: " xiugai
if [ "$xiugai" -eq "1" ];then
	sed -ri "181,209s/^/#/g" application/admin/view/default/index/init.html
else
	vim +181 application/admin/view/default/index/init.html
	echo "替换完成,退出程序"
	exit;
fi
}
shopxo_huanyuan(){
rm -rf application/admin/view/default/index/init.html public/favicon.ico application/admin/controller/Index.php application/index/view/default/public/footer_nav.html application/admin/view/default/admin/login_info.html application/admin/view/default/public/header.html application/admin/view/default/public/nav.html application/admin/view/default/index/init.html
cp application/admin/view/default/index/init.html.old application/admin/view/default/index/init.html
cp public/favicon.ico application/admin/controller/Index.php.old public/favicon.ico application/admin/controller/Index.php
cp application/index/view/default/public/footer_nav.html.old application/index/view/default/public/footer_nav.html
cp application/admin/view/default/admin/login_info.html.old application/admin/view/default/admin/login_info.html
cp application/admin/view/default/public/header.html.old application/admin/view/default/public/header.html
cp application/admin/view/default/public/nav.html.old application/admin/view/default/public/nav.html
cp application/admin/view/default/index/init.html.old application/admin/view/default/index/init.html
echo "还原完成"
exit;
}
#加载目录
shopxo_mulu
	
