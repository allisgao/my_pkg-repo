#!/bin/bash
# o_repoid oracle repo的名
##o_repoid 从oraclelinux的yum库中取出的repo id 
o_repoid=(ol7_latest ol7_u0_base ol7_u1_base ol7_u2_base ol7_u3_base ol7_UEKR3 ol7_UEKR4 ol7_optional_latest ol7_addons ol7_UEKR3_OFED20 ol7_UEKR4_OFED ol7_MySQL57 ol7_MySQL56 ol7_MySQL55 ol7_openstack21 ol7_openstack20 ol7_ceph ol7_ceph10 ol7_spacewalk22_client ol7_software_collections ol7_spacewalk24_server ol7_spacewalk24_client)
#循环语句，开始同步——全量同步oracle官方的public-repo
#切换到目标目录，否则会乱
Dir_for_ol7=/MyRepo/repo_from_oracle/ol7


cd $Dir_for_ol7
#开始一个个的repo同步
for rid in ${o_repoid[*]};
do 
#	echo $rid
#	/usr/bin/reposync --repoid=ol7_u0_base  /MyRepo/repo_from_oracle
       /usr/bin/reposync -n -d --repoid=$rid 
done
#echo ${o_repoid}
##########repodata##########
for rid_dir in ${o_repoid[*]};
do
       /usr/bin/createrepo -p -d -o --update  $Dir_for_ol7/$rid_dir $Dir_for_ol7/$rid_dir
done












