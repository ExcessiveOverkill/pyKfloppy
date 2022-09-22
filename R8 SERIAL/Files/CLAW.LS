/PROG  CLAW
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 376;
CREATE		= DATE 121-08-20  TIME 16:53:22;
MODIFIED	= DATE 121-08-20  TIME 17:22:11;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 13;
MEMORY_SIZE	= 1078;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
/MN
   1:  DO[7:CLAW ACT]=ON ;
   2:L P[1] 700mm/sec CNT10 ACC70    ;
   3:L P[2] 200mm/sec FINE    ;
   4:L P[3] 200mm/sec FINE    ;
   5:  DO[7:CLAW ACT]=OFF ;
   6:  WAIT    .80(sec) ;
   7:L P[4] 100mm/sec FINE    ;
   8:  DO[7:CLAW ACT]=ON ;
   9:  WAIT    .50(sec) ;
  10:L P[5] 700mm/sec CNT10 ACC70    ;
  11:L P[6] 700mm/sec FINE ACC70    ;
  12:  DO[7:CLAW ACT]=OFF ;
  13:  WAIT   1.00(sec) ;
/POS
P[1]{
   GP1:
	UF : 5, UT : 3,		CONFIG : 'N, 0, 0, 0',
	X =  2891.60  mm,	Y =   290.05  mm,	Z =   751.99  mm,
	W =    27.78 deg,	P =    12.98 deg,	R =   160.78 deg
};
P[2]{
   GP1:
	UF : 5, UT : 3,		CONFIG : 'N, 0, 0, 0',
	X =  2884.69  mm,	Y =   343.63  mm,	Z =   845.73  mm,
	W =    27.78 deg,	P =    12.98 deg,	R =   160.78 deg
};
P[3]{
   GP1:
	UF : 5, UT : 3,		CONFIG : 'N, 0, 0, 0',
	X =  2886.41  mm,	Y =   330.27  mm,	Z =   822.36  mm,
	W =    27.78 deg,	P =    12.98 deg,	R =   160.78 deg
};
P[4]{
   GP1:
	UF : 5, UT : 3,		CONFIG : 'N, 0, 0, 0',
	X =  2884.17  mm,	Y =   347.75  mm,	Z =   852.92  mm,
	W =    27.78 deg,	P =    12.98 deg,	R =   160.78 deg
};
P[5]{
   GP1:
	UF : 5, UT : 3,		CONFIG : 'N, 0, 0, 0',
	X =  2886.20  mm,	Y =   332.07  mm,	Z =   825.48  mm,
	W =    27.78 deg,	P =    12.98 deg,	R =   160.78 deg
};
P[6]{
   GP1:
	UF : 5, UT : 3,		CONFIG : 'N, 0, 0, 0',
	X =  2675.94  mm,	Y =  -119.63  mm,	Z =  1068.18  mm,
	W =    27.78 deg,	P =    12.98 deg,	R =   160.78 deg
};
/END
