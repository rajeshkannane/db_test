#!/bin/bash
set -e
cd ~
sudo curl -O https://sfc-repo.snowflakecomputing.com/snowsql/bootstrap/1.2/linux_x86_64/snowsql-1.2.24-linux_x86_64.bash
gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys 630D9F3CAB551AF3
sudo curl -O https://sfc-repo.snowflakecomputing.com/snowsql/bootstrap/1.2/linux_x86_64/snowsql-1.2.24-linux_x86_64.bash.sig
gpg --verify snowsql-1.2.24-linux_x86_64.bash.sig snowsql-1.2.24-linux_x86_64.bash
SNOWSQL_DEST=~/bin SNOWSQL_LOGIN_SHELL=~/.profile bash snowsql-1.2.24-linux_x86_64.bash
cp ~/.snowsql/config ~/.snowsql/configCopy
cat ~/.snowsql/configCopy |sed --expression "s@../snowsql_rt.log@~/.snowsql_rt.log@; s@# log_bootstrap_file@log_bootstrap_file@" > ~/.snowsql/config
echo "[connections.snowsqlTest]" >> ~/.snowsql/config
echo "accountname = vc70422.europe-west2.gcp" >> ~/.snowsql/config
echo "username = RAJESHKANNANE" >> ~/.snowsql/config
echo "dbname = testrun" >> ~/.snowsql/config
echo "schemaname = TESTSCHEMA" >> ~/.snowsql/config
echo "warehousename = compute_wh" >> ~/.snowsql/config
#accountname = vc70422.europe-west2.gcp  
#region = defaultregion
#username = RAJESHKANNANE
#dbname = testrun
#schemaname = TESTSCHEMA
#warehousename = compute_wh
#snowsql -c snowsqlTest
