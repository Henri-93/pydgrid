!=======================================================================
! Generated by  : PSCAD v4.2.0
!
! Warning:  The content of this file is automatically generated.
!           Do not modify, as any changes made here will be lost!
!-----------------------------------------------------------------------
! Component     : Main
! Description   :  EXAMPLE 11
!-----------------------------------------------------------------------


!=======================================================================

      SUBROUTINE DSDyn()

!---------------------------------------
! Standard includes
!---------------------------------------

      INCLUDE 'nd.h'
      INCLUDE 'emtconst.h'
      INCLUDE 'emtstor.h'
      INCLUDE 's0.h'
      INCLUDE 's1.h'
      INCLUDE 's2.h'
      INCLUDE 's4.h'
      INCLUDE 'branches.h'
      INCLUDE 'pscadv3.h'
      INCLUDE 'fnames.h'
      INCLUDE 'radiolinks.h'
      INCLUDE 'matlab.h'

!---------------------------------------
! Function/Subroutine Declarations
!---------------------------------------

      REAL    VM3PH2        ! '3 Phase RMS Voltage Measurement'
!     SUBR    NEWSNC        ! Synchronous Machine Simulation

!---------------------------------------
! Variable Declarations
!---------------------------------------


! Subroutine Parameters

! Electrical Node Indexes
      INTEGER NT_1(3)

! Control Signals
      INTEGER LRR, S2M, InitGv, InitEx
      REAL    POUT, QOUT, TM, EF, W, Tmstdy, Vrms
      REAL    RT_1, IF, RT_2, RT_3, RT_4(3), Rang

! Internal Variables
      INTEGER SP_TQ, M_ACTV
      REAL    RVD1_1, Pw_O, Qva_O, Vn_O, Cn_O
      REAL    LdA_O, Tht_O, Tesd_O, Tmsd_O, Z_O1
      REAL    Z_O2, Z_O3, Z_O4, Z_O5, Z_O6, SP_IN
      REAL    RVD1_2, MCVTPU, MVTPU, SBASE_I

! Indexing variables
      INTEGER ISTOI, ISTOF, IT_0                  ! Storage Indexes
      INTEGER IPGB                                ! Control/Monitoring
      INTEGER ISUBS, SS(1), INODE                 ! SS/Node/Branch/Xfmr


!---------------------------------------
! Record local indexes
!---------------------------------------

! Dsdyn <-> Dsout transfer index storage
      NTXFR = NTXFR + 1
      TXFR(NTXFR,1) = NSTOL
      TXFR(NTXFR,2) = NSTOI
      TXFR(NTXFR,3) = NSTOF

! Record Offset and Increment Storage Counters
      ISTOI     = NSTOI
      NSTOI     = NSTOI + 4
      ISTOF     = NSTOF
      NSTOF     = NSTOF + 15
      IPGB      = NPGB
      NPGB      = NPGB + 7
      INODE     = NNODE + 2
      NNODE     = NNODE + 5

! Initialize Subsystem Mapping

      ISUBS = NSUBS + 0
      NSUBS = NSUBS + 1

      DO 100  IT_0 = 1,1
         SS(IT_0) = SUBS(ISUBS + IT_0)
  100 CONTINUE

!---------------------------------------
! Transfers from storage arrays
!---------------------------------------

      POUT     = STOF(ISTOF + 1)
      QOUT     = STOF(ISTOF + 2)
      TM       = STOF(ISTOF + 3)
      EF       = STOF(ISTOF + 4)
      W        = STOF(ISTOF + 5)
      Tmstdy   = STOF(ISTOF + 6)
      Vrms     = STOF(ISTOF + 7)
      RT_1     = STOF(ISTOF + 8)
      LRR      = STOI(ISTOI + 1)
      S2M      = STOI(ISTOI + 2)
      IF       = STOF(ISTOF + 9)
      RT_2     = STOF(ISTOF + 10)
      RT_3     = STOF(ISTOF + 11)
      Rang     = STOF(ISTOF + 15)
      InitGv   = STOI(ISTOI + 3)
      InitEx   = STOI(ISTOI + 4)

! Array(1:3) quantities...
      DO 101  IT_0 = 1,3
         RT_4(IT_0) = STOF(ISTOF + 11 + IT_0)
  101 CONTINUE

!---------------------------------------
! Transfer from Imports
!---------------------------------------


!---------------------------------------
! Electrical Node Lookup
!---------------------------------------


! Array(1:3) quantities...
      DO 102  IT_0 = 1,3
         NT_1(IT_0) = NODE(INODE + 0 + IT_0)
  102 CONTINUE

!---------------------------------------
! Read Model data (if any)
!---------------------------------------

      IF ( TIMEZERO ) THEN
         FILENAME = 'Main.dta'
         CALL EMTDC_OPENFILE
         SECTION = 'DATADSD:'
         CALL EMTDC_GOTOSECTION
      ENDIF

!---------------------------------------
! Generated code from module definition
!---------------------------------------


! 10:[const] Real Constant 
      EF = 5000.0

! 30:[const] Real Constant 
      TM = 0.0

! 50:[pgb] Output Channel 'MECHANICAL TORQUE'

      PGB(IPGB+2) = TM

! 60:[pgb] Output Channel 'FIELD VOLTAGE'

      PGB(IPGB+3) = EF

! 70:[timerdefn]  
!  Timer
      IF(TIME.GE.5.0)THEN
        LRR = 1
      ELSE
        LRR = 0
      END IF
!

! 80:[timerdefn]  
!  Timer
      IF(TIME.GE.0.3)THEN
        S2M = 1
      ELSE
        S2M = 0
      END IF
!

! 90:[sync_machine] Synchronous Machine 'HydroGener'
      CALL E_CPFSYNC(0.904570533342,0.390527439094,1.0,0.0,13.85,RVD1_1,&
     &RVD1_2)
!  Synchronous machine model
      STORI(NSTORI) = NINT(STOR(NEXC+294))
      SP_IN = 376.992
      CALL NEWSNC(SS(1), NT_1(1),NT_1(2),NT_1(3),0.0,RVD1_1,RVD1_2,0,S2M&
     &,1.0,0,LRR,SP_IN,TM,0,0,1.0,0.0,376.992,EF,0,1.0,IF,Vn_O,Cn_O,LdA_&
     &O,Tht_O,W,RT_2,Pw_O,Qva_O,Tmsd_O,Tesd_O,M_ACTV,SP_TQ,1,Z_O1,1,Z_O2&
     &,1,Z_O3,1,Z_O4,1,Z_O5,1,Z_O6,0)
      RT_3 = TM
!     IF (SP_TQ .EQ. 0) RT_3 = STOR(NEXC-375+22)+STOR(NEXC-375+347)
      IF (SP_TQ .EQ. 0) RT_3 = Tmsd_O
      Tmstdy=Tmsd_O
      RT_1 = STOR(NEXC-375+265)*STOR(NEXC-375+302)
      IF ((M_ACTV .EQ. 1) .AND. (STORI(NSTORI).EQ.0)) THEN
          IF (STOR(NEXC-375+293).GT.0.5) THEN
              STORF(NSTORF) = STOR(NEXC-375+161)
          ELSE
              STORF(NSTORF) = STOR(NEXC-375+296)
          ENDIF
      ENDIF
      IF (M_ACTV .EQ. 1) THEN
        STORF(NSTORF+1) = STORF(NSTORF+1) + (W-376.992)*DELT
        IF (SP_TQ .EQ. 0) STORF(NSTORF+2) = LdA_O
        STORF(NSTORF+3) = STORF(NSTORF) + STORF(NSTORF+1) + STORF(NSTORF&
     &+2)
      ELSE
        STORF(NSTORF+3) = 0.0
      ENDIF
      MVTPU=VM3PH2(SS(1),NT_1(1),NT_1(2),NT_1(3),0.02)/(SQRT_3*13.85)
      IF(MVTPU .LT. 1.0E-8) THEN 
         MCVTPU=1.0
      ELSE
         MCVTPU=MVTPU
      ENDIF

      SBASE_I = 1.0/2202.15

      RT_4(1) = MCVTPU
      IF(MVTPU .LT. 1.0E-8) THEN 
         RT_4(2) = 0.0
         RT_4(3) = 0.0
      ELSE
         RT_4(2) = Pw_O*SBASE_I/MCVTPU
         RT_4(3) = -Qva_O*SBASE_I/MCVTPU
      ENDIF
      W = W/376.992
      POUT = Pw_O/2202.15
      QOUT = Qva_O/2202.15
      Rang = Tht_O
      InitGv = SP_TQ
      InitEx = M_ACTV
      NSTORF = NSTORF + 4
      NSTORI = NSTORI + 1
!  End of code for Synchronous machine model
!

! 100:[pgb] Output Channel 'FIELD CURRENT'

      PGB(IPGB+4) = IF

! 110:[pgb] Output Channel 'OMEGA'

      PGB(IPGB+5) = 376.99118 * W

! 120:[pgb] Output Channel 'REACTIVE POWER'

      PGB(IPGB+6) = 120.0 * QOUT

! 130:[pgb] Output Channel 'REAL POWER'

      PGB(IPGB+7) = 120.0 * POUT

!---------------------------------------
! Feedbacks and transfers to storage
!---------------------------------------

      STOF(ISTOF + 1) = POUT
      STOF(ISTOF + 2) = QOUT
      STOF(ISTOF + 3) = TM
      STOF(ISTOF + 4) = EF
      STOF(ISTOF + 5) = W
      STOF(ISTOF + 6) = Tmstdy
      STOF(ISTOF + 7) = Vrms
      STOF(ISTOF + 8) = RT_1
      STOI(ISTOI + 1) = LRR
      STOI(ISTOI + 2) = S2M
      STOF(ISTOF + 9) = IF
      STOF(ISTOF + 10) = RT_2
      STOF(ISTOF + 11) = RT_3
      STOF(ISTOF + 15) = Rang
      STOI(ISTOI + 3) = InitGv
      STOI(ISTOI + 4) = InitEx

! Array(1:3) quantities...
      DO 103  IT_0 = 1,3
         STOF(ISTOF + 11 + IT_0) = RT_4(IT_0)
  103 CONTINUE

!---------------------------------------
! Transfer to Exports
!---------------------------------------

!---------------------------------------
! Close Model Data read
!---------------------------------------

      IF ( TIMEZERO ) CALL EMTDC_CLOSEFILE
      RETURN
      END

!=======================================================================

      SUBROUTINE DSOut()

!---------------------------------------
! Standard includes
!---------------------------------------

      INCLUDE 'nd.h'
      INCLUDE 'emtconst.h'
      INCLUDE 'emtstor.h'
      INCLUDE 's0.h'
      INCLUDE 's1.h'
      INCLUDE 's2.h'
      INCLUDE 's4.h'
      INCLUDE 'branches.h'
      INCLUDE 'pscadv3.h'
      INCLUDE 'fnames.h'
      INCLUDE 'radiolinks.h'
      INCLUDE 'matlab.h'

!---------------------------------------
! Function/Subroutine Declarations
!---------------------------------------

      REAL    VM3PH2        ! '3 Phase RMS Voltage Measurement'

!---------------------------------------
! Variable Declarations
!---------------------------------------


! Electrical Node Indexes
      INTEGER NT_1(3)

! Control Signals
      REAL    Vrms

! Internal Variables
      REAL    RVD1_1

! Indexing variables
      INTEGER ISTOL, ISTOI, ISTOF, IT_0           ! Storage Indexes
      INTEGER IPGB                                ! Control/Monitoring
      INTEGER ISUBS, SS(1), INODE                 ! SS/Node/Branch/Xfmr


!---------------------------------------
! Record local indexes
!---------------------------------------

! Dsdyn <-> Dsout transfer index storage
      NTXFR = NTXFR + 1
      ISTOL = TXFR(NTXFR,1)
      ISTOI = TXFR(NTXFR,2)
      ISTOF = TXFR(NTXFR,3)

! Record Offset and Increment Storage Counters
      IPGB      = NPGB
      NPGB      = NPGB + 7
      INODE     = NNODE + 2
      NNODE     = NNODE + 5

! Initialize Subsystem Mapping

      ISUBS = NSUBS + 0
      NSUBS = NSUBS + 1

      DO 100  IT_0 = 1,1
         SS(IT_0) = SUBS(ISUBS + IT_0)
  100 CONTINUE

!---------------------------------------
! Transfers from storage arrays
!---------------------------------------

      Vrms     = STOF(ISTOF + 7)

!---------------------------------------
! Electrical Node Lookup
!---------------------------------------


! Array(1:3) quantities...
      DO 101  IT_0 = 1,3
         NT_1(IT_0) = NODE(INODE + 0 + IT_0)
  101 CONTINUE

!---------------------------------------
! Read Model data (if any)
!---------------------------------------

      IF ( TIMEZERO ) THEN
         FILENAME = 'Main.dta'
         CALL EMTDC_OPENFILE
         SECTION = 'DATADSO:'
         CALL EMTDC_GOTOSECTION
      ENDIF

!---------------------------------------
! Generated code from module definition
!---------------------------------------


! 20:[multimeter] Multimeter 
!
!
!
!
!
      RVD1_1 = VM3PH2(SS(1), NT_1(1), NT_1(2), NT_1(3), 0.02) 
      Vrms = RVD1_1
!
!

! 40:[pgb] Output Channel 'TERMINAL VOLTAGE'

      PGB(IPGB+1) = Vrms

!---------------------------------------
! Feedbacks and transfers to storage
!---------------------------------------

      STOF(ISTOF + 7) = Vrms

!---------------------------------------
! Close Model Data read
!---------------------------------------

      IF ( TIMEZERO ) CALL EMTDC_CLOSEFILE
      RETURN
      END
