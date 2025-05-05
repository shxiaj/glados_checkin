# glados_checkin
Glados Checkin 自动签到, 也添加了飞兔云的自动签到(域名随时换, 不稳定)
Bash脚本, 运行方便, 为解析签到结果需要安装`jq`
安装命令: yum install jq

### 一. Glados 自动签到
1. 浏览器登录glados账户
2. F12 打开浏览器控制台
3. 点击签到按钮后, 在控制台网络中查看登录参数
4. 将登录认证参数填在glados_checkin.sh 指定位置
5. 启动 ./glados_checkin.sh <logDir> 设置日志保存位置, 默认当前目录
通过crontab 添加定时任务即可

### 一. 飞兔云 自动签到
1. 浏览器登录飞兔云账户
2. F12 打开浏览器控制台
3. 点击签到按钮后, 在控制台网络中查看登录参数
4. 将登录认证参数填在feitu_checkin.sh 指定位置
5. 启动 ./feitu_checkin.sh <logDir> 设置日志保存位置, 默认当前目录
通过crontab 添加定时任务即可
