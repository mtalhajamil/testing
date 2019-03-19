#!/bin/bash

sqlplus -s  DEVMS8_GLOBALVIEW_DB/V15taJ3t@ukdcoracledev12c.vistajet.local:1521/VJDEV <<EOF
spool count-disticnt-record-view-output1.txt
set linesize 200
set head off
select count(Distinct(id)) from ITMS_CO_DESC_TX_INFO;
spool off;
EOF

