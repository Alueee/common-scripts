Font_Black="\033[30m"
Font_Red="\033[31m"
Font_Green="\033[32m"
Font_Yellow="\033[33m"
Font_Blue="\033[34m"
Font_Purple="\033[35m"
Font_SkyBlue="\033[36m"
Font_White="\033[37m"
Font_Suffix="\033[0m"

function get_char()
{
	SAVEDSTTY=`stty -g`
	stty -echo
	stty cbreak
	dd if=/dev/tty bs=1 count=1 2> /dev/null
	stty -raw
	stty echo
	stty $SAVEDSTTY
}

function nezha_m(){
	if [ -f "nezha.sh" ];then
		./nezha.sh
	else
		curl -L https://raw.githubusercontent.com/naiba/nezha/master/script/install.sh -o nezha.sh && chmod +x nezha.sh && ./nezha.sh
	fi
}

function xrayr_m(){
	if [ -f "xrayr" ];then
		xrayr
	else
		bash <(curl -Ls https://raw.githubusercontent.com/XrayR-project/XrayR-release/master/install.sh)
	fi
}

function warp_m(){
	if [ -f "menu.sh" ];then
		bash menu.sh
	else
		wget -N https://gitlab.com/fscarmen/warp/-/raw/main/menu.sh && bash menu.sh
	fi
}

function warpip_m(){
	bash <(curl -sSL https://gitlab.com/fscarmen/warp_unlock/-/raw/main/unlock.sh)
}

function zhudns_m(){
	if [ -f "dnsmasq_sniproxy.sh" ];then
		bash dnsmasq_sniproxy.sh
	else
		wget --no-check-certificate -O dnsmasq_sniproxy.sh https://raw.githubusercontent.com/myxuchangbin/dnsmasq_sniproxy_install/master/dnsmasq_sniproxy.sh && bash dnsmasq_sniproxy.sh -f
	fi
}

function menu(){
	clear
	echo "-------------------------------------------"
	echo "Alue常用的脚本合集"
	echo "-------------------------------------------"
	echo "1、哪吒探针"
	echo "2、安装XrayR"
	echo "3、安装warp"
	echo "4、刷warp IP"
	echo "5、安装dnsmasq解锁流媒体"
	echo "-------------------------------------------"
	echo "若中途有输入错误，按ctrl+backpace删除"
	echo "-------------------------------------------"
}

while true
do
    menu
    echo -n "请选择："
    read aNum1
    case $aNum1 in
        1) nezha_m
            ;;
        2) xrayr_m
            ;;
        3) warp_m
            ;;
        4) warpip_m
            ;;
        5) zhudns_m
            ;;
        0) echo "用户选择退出"
           break
            ;;
        *) echo -e "${Font_Red}输入错误，请重新输入${Font_Suffix}"
           sleep 2
            ;;
    esac
done
