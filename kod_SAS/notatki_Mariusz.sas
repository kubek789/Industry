proc import datafile="H:\warsztaty badawcze\odlewnictwo\Industry-master\Industry-master\dane\dane_po_etapie_4.txt" out=dane dbms=dlm replace;
delimiter=" ";
run;

data dane1;
set dane;
keep WE1-WE28 WY1-WY13;
run;

proc corr data=dane1 plots=scatter;
var WE6;
with WE28;
run;
