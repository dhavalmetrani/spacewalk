#Add LC_CTYPE="en_US.UTF-8" to /etc/sysconfig/i18n
# rpm -Uvh http://yum.spacewalkproject.org/2.0/RHEL/6/x86_64/spacewalk-repo-2.0-3.el6.noarch.rpm

# cat > /etc/yum.repos.d/jpackage-generic.repo << EOF
# [jpackage-generic]
# name=JPackage generic
# #baseurl=http://mirrors.dotsrc.org/pub/jpackage/5.0/generic/free/
# mirrorlist=http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=5.0
# enabled=1
# gpgcheck=1
# gpgkey=http://www.jpackage.org/jpackage.asc
# EOF

# cat > /root/spacewalk_answers.txt << EOF
# admin-email = kyle@glasgownet.com
# ssl-set-org = Spacewalk Org
# ssl-set-org-unit = spacewalk
# ssl-set-city = My City
# ssl-set-state = My State
# ssl-set-country = US
# ssl-password = spacewalk
# ssl-set-email = kyle@glasgownet.com
# ssl-config-sslvhost = Y
# db-backend=postgresql
# db-name=spacewalke
# db-user=spacewalkuser
# db-password=spacewalkpw
# db-host=localhost
# db-port=5432
# enable-tftp=Y
# EOF

# yum update -y
# yum install vim -y
# yum install spacewalk-setup-postgresql -y
# yum install spacewalk-postgresql -y

cat << EOL >> /etc/sysconfig/i18n
LC_CTYPE="en_US.UTF-8"
EOL

sudo yum update -y

# TODO: This URL would change with every release of spacewalk. Change this. 
rpm -Uvh http://yum.spacewalkproject.org/latest/RHEL/6/x86_64/spacewalk-repo-2.4-3.el6.noarch.rpm
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm

cat << EOL >/etc/yum.repos.d/jpackage-generic.repo
[jpackage-generic]
name=JPackage generic
mirrorlist=http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=5.0
enabled=1
gpgcheck=1
gpgkey=http://www.jpackage.org/jpackage.asc
EOL

yum clean all && yum repolist
yum install spacewalk-setup-postgresql spacewalk-postgresql -y
