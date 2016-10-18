#!../../bin/linux-x86_64/gVac

epicsEnvSet( "STREAM_PROTOCOL_PATH","../../gVacApp/Db:.")

< envPaths

cd ${TOP}

dbLoadDatabase "dbd/gVac.dbd"
gVac_registerRecordDeviceDriver pdbbase

epicsEnvSet("P",         "ESB:GVAC01")
epicsEnvSet("PROTOFILE", "gVac.proto")
epicsEnvSet("LOC",       "B062-38-09")
#epicsEnvSet("DELAY1",    "0.1")

save_restoreSet_status_prefix( "")
save_restoreSet_IncompleteSetsOk( 1)
save_restoreSet_DatedBackupFiles( 1)
set_savefile_path( "/nfs/slac/g/testfac/esb/$(IOC)","autosave")
set_pass0_restoreFile( "gVac.sav")
set_pass1_restoreFile( "gVac.sav")

drvAsynIPPortConfigure ("L0","ts-esb-11:2102",0,0,0)

#asynSetTraceMask("L0",-1,0x9)
#asynSetTraceIOMask("L0",-1,0x2)

dbLoadRecords("db/gVac01.db","IOC=${IOC},P=$(P),PROTOFILE=$(PROTOFILE),PORT=L0,LOC=$(LOC)")
dbLoadRecords("db/asynRecord.db","P=$(P):,R=asyn,PORT=L0,ADDR=0,OMAX=0,IMAX=0")

cd ${TOP}/iocBoot/${IOC}
iocInit()

create_monitor_set( "gVac.req",30,"P=$(P)")

