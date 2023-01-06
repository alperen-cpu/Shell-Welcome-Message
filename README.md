# Shell-Welcome-Message

## msmtp Install and Conf

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
port       587
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

