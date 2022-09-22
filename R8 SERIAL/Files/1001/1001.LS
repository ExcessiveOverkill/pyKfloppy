/PROG 1001
/ATTR
OWNER           = voids;
COMMENT         = "Autodesk";
PROG_SIZE       = 0;
CREATE          = DATE 2022-02-15  TIME 17:49:22;
MODIFIED        = DATE 2022-02-15  TIME 17:49:22;
FILE_NAME       = ;
VERSION         = 0;
LINE_COUNT      = 0;
MEMORY_SIZE     = 0;
PROTECT         = READ_WRITE;
TCD:  STACK_SIZE        = 0,
      TASK_PRIORITY     = 50,
      TIME_SLICE        = 0,
      BUSY_LAMP_OFF     = 0,
      ABORT_REQUEST     = 0,
      PAUSE_REQUEST     = 0;
DEFAULT_GROUP   = 1,*,*,*,*;
CONTROL_CODE    = 00000000 00000000;
/MN
  1:  ! CALL JOB: TOOL_CHANGE (3)
  2:  ! CALL JOB: SPINLDE_SPEED (3400)
  3:  CALL JOB:2D_Contour1 ;
/END
