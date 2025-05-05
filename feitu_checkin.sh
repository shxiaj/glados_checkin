# 用法: ./feitu_checkin.sh <logDir> 设置日志保存位置, 默认当前目录
if [ -z "$1" ];then
  dir=$PWD
else
  dir=$1
fi
# 通过浏览器查看当前账户认证参数, 修改 -H authorization 内容即可
curl -k -o $dir/result_feitu.json 'https://gtm-1120.91tutu.xyz/ft/gateway/cn/user/sign' \
  -H 'accept: */*' \
  -H 'accept-language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7' \
  -H 'authorization: 填写此处内容' \
  -H 'dnt: 1' \
  -H 'origin: https://xn--9kq10e0y7h.site' \
  -H 'priority: u=1, i' \
  -H 'referer: https://xn--9kq10e0y7h.site/' \
  -H 'sec-ch-ua: "Chromium";v="136", "Microsoft Edge";v="136", "Not.A/Brand";v="99"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Windows"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: cross-site' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0'

date >> $dir/checkin.log
printf "飞兔云签到结果: $(cat $dir/result_feitu.json | jq .message) \n\n" >> $dir/checkin.log