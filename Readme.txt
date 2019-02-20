这个部署脚本经过多次测试，已无问题

部署环境：
vps：ubuntu 18.04
python3

注意：
1.因为此脚本为windows下编辑，故存在格式问题，建议将脚本内容copy至ubuntu上进行保存，再将其运行。
2.此蜜罐的用户名和密码均已硬编码至脚本中，为cowrie：cowrie
3.运行前需将三个脚本更改权限：chmod 755 *
4.运行时，只需要运行第一个脚本，也就是cowrie_step1.sh即可，开启后就不用再管了，其会一直运行，在中断和vps的连接后也有服务

补充：
1.cowrie蜜罐将攻击者下载的位置放于：/home/cowrie/cowrie/var/lib/cowrie/downloads目录下
2.本脚本只开启了ssh服务，当然也有其他服务可开启，本脚本里有说明修改位置，照猫画虎即可
3.本脚本设置的伪ssh端口为62222，且做了22到62222的重定向。真实ssh端口改为81，请root用户连接时换为81，别连不上怪我
4.本脚本在cowrie项目中重新添加了log目录，绝对路径：/home/cowrie/cowrie/log，将日志分两种形式记录，一为json，一为log


作者：D.L luan
如有问题，请联系lsjfy0411@163.com