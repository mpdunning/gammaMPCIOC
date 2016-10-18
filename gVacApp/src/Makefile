TOP=../..

include $(TOP)/configure/CONFIG

PROD_IOC = gVac

DBD += gVac.dbd

gVac_DBD += base.dbd
gVac_DBD += stream.dbd
gVac_DBD += asyn.dbd
gVac_DBD += asSupport.dbd
gVac_DBD += drvAsynIPPort.dbd

gVac_SRCS += gVac_registerRecordDeviceDriver.cpp
gVac_SRCS_DEFAULT += gVacMain.cpp

gVac_LIBS += asyn
gVac_LIBS += autosave
gVac_LIBS += stream

gVac_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES

