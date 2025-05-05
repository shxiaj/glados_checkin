# 用法: ./glados_checkin.sh <logDir> 设置日志保存位置, 默认当前目录
if [ -z "$1" ];then
  dir=$PWD
else
  dir=$1
fi
# 通过浏览器查看当前账户认证参数, 修改 -b 内容即可
curl -k -o $dir/result.json 'https://glados.rocks/api/user/checkin' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'accept-language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7' \
  -H 'content-type: application/json;charset=UTF-8' \
  -b '填写此处内容' \
  -H 'origin: https://glados.rocks' \
  -H 'priority: u=1, i' \
  -H 'sec-ch-ua: "Chromium";v="136", "Microsoft Edge";v="136", "Not.A/Brand";v="99"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Windows"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0' \
  --data-raw '{"token":"glados.one"}'

# 获取签到结果
message=$(cat $dir/result.json | jq .message)
business=$(cat $dir/result.json| jq .list[0].business)
change=$(cat $dir/result.json| jq .list[0].change)
balance=$(cat $dir/result.json| jq .list[0].balance)

date >> $dir/checkin.log
printf "Glados 签到结果: %s, 当前总点数: %s, 最近签到时间: %s, 最近获得点数: %s\n\n" "$message" "$balance" "$business" "$change" >> $dir/checkin.log

