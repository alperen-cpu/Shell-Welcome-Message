# Shell-Welcome-Message
# CentOS 7 guide
In order to send login information to your e-mail address, the msmtp tool must be installed.<br>

```bash
  yum install epel-release
  yum install msmtp
```
Edit config file ~/.msmtprc
```bash
# Set default values for all following accounts.
defaults
auth           on
tls            on
tls_trust_file /etc/ssl/certs/ca-bundle.crt
logfile        ~/.msmtp.log

# mail
account        mail
host           mail.example.com
port           465
tls_starttls   off
from           example@example.com
user           example@example.com
password       password

# Set a default account
account default : mail
```
Grant necessary authorization
```bash
chmod 600 ~/.msmtprc
```
Test if it works
```bash
echo -e "\nTest Mail." | msmtp -a mail example@example.com
```
## Run
```bash
nano /etc/profile
```
add command
```bash
bash path/centos.sh
```

<hr>
<h1>Debian 11 guide</h1>
<h3>msmtp Install and Conf</h3>

In order to send login information to your e-mail address, the msmtp tool must be installed.<br>

```bash
  apt-get install msmtp
```
Edit config file ~/.msmtprc
```bash
# Default settings
defaults
auth    on
tls    on
tls_trust_file    /etc/ssl/certs/ca-certificates.crt
logfile ~/.msmtp.log
# mail
account    mail
host       mail.example.com
port       465
from       example@example.com
user       example@example.com
password   password

account default : mail  
```
Grant necessary authorization
```bash
chmod 600 ~/.msmtprc
```
Test if it works
```bash
echo -e "\nTest Mail." | msmtp -a mail example@example.com
```
## Run
```bash
nano /etc/update-motd.d/01-custom
chmod +x /etc/update-motd.d/01-custom
```
<img align="left" alt="Twitter" width="700px"
        src="https://user-images.githubusercontent.com/85456369/210991754-d70db4bb-c326-4db4-8948-12df560bdc54.png" /></a>

