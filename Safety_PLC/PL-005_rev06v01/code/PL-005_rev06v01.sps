$Name <FILENAME>

! Obj_Source
;Electric diagram:
;recif\studies\PL-005-schema_electrique_CAB-2\rev06\PL-005_rev06.pdf
;
;Pinout description:
;\recif\workspace\PlutoManager\PL-005\PL-005_rev06v01\PL-
;005_rev06v01.xlsx
;
;Pluto password:
;recif
;
;Author: Franco FERRUCCI
;Created: 06/01/2023
;Last modification: 22/03/2023

#Include <func06.fps>

! Id_Pluto_Double[B46 v2]:0=00001E40E4C3


! I0.0=in_nh3_detector_open             ;NH3 gas detector, NC contact. Open when no gas is detected.
! I0.1=in_nh3_detector_closed           ;NH3 gas detector, NO contact. Closed when no gas is detected.
! I0.2=in_h2_detector1_closed           ;H2 gas detector central (GfG). Closed when no gas is detected.
! I0.3=in_h2_detector2_open             ;H2 gas detector 2 (Dega). Open when no gas or error is detected.
! I0.4=in_h2_detector2_closed           ;H2 gas detector 2 (Dega). Closed when no gas or error is detected.
! I0.5=h2_detector2_analog              ;H2 gas detector 2 (Dega) analog input. 4..20mA to 1..5V through a 250 Ohm resistor. 1 count = 0.1V.
! I0.6=in_stop_button_container_NC      ;Stop button inside container. Closed when button is not pressed.
! I0.7=in_stop_button_container_NO      ;Stop button inside container. Open when button is not pressed.
! Q0.2=out_safety_shutdown1             ;Safety action #3. It commands: H2 electrovalve, electrolyzer, PV pannels.
! Q0.3=out_safety_shutdown2             ;Safety action #3. It commands: container 3-phase power, fuel-cell Li-ion batteries.

! Pgm_Pluto:0
! Instruction_Set_3

! I0.0,A_Pulse,Non_Inv
! I0.1,A_Pulse,Non_Inv
! I0.2,B_Pulse,Non_Inv
! I0.3,C_Pulse,Non_Inv
! I0.4,Static
! I0.5,Analog
! I0.6,B_Pulse,Non_Inv
! I0.7,B_Pulse,Non_Inv
! I0.30,B_Pulse,Non_Inv
! I0.31,B_Pulse,Non_Inv
! I0.32,Static
! I0.33,A_Pulse,Non_Inv
! I0.34,C_Pulse,Non_Inv
! I0.35,Static
! I0.36,Static
! I0.37,Static
! I0.40,C_Pulse,Non_Inv
! I0.41,Static
! I0.42,A_Pulse,Non_Inv
! Q0.10,A_Pulse
! Q0.11,B_Pulse
! Q0.12,C_Pulse
! Q0.13,Static
! Q0.14,Static
! Q0.15,Static
! Q0.16,Static
! Q0.17,Static
! Q0.20,Static
! Q0.21,Static
! Q0.22,Static
! Q0.23,Static
! Q0.24,Static
! Q0.25,Static

! I0.30=in_supervision_relay_NC         ;"Supervision-Safety" interface relay. Closed when relay is de-energized.
! I0.31=in_supervision_relay_NO         ;"Supervision-Safety" interface relay. Open when relay is de-energized.
! I0.32=in_extractor1_command_NO        ;Extractor 1 command. Open when user wants to turn it OFF. Closed when user wants to turn it ON.
! I0.33=in_extractor1_pressure_NO       ;Extractor 1 pressure sensor. Closed when underpressure is detected (extractor ON). Open when no underpressure is detected (extractor OFF).
! I0.34=in_extractors_available         ;Extractors 1 and 2 availability. Closed when both extractors are available. Open when thermal protections are triggered or 3-phase power is not available.
! I0.35=in_reset_sound_alarm_NO         ;Reset "safety action 1" (gas sound alarm). Closed when button is pressed. Note: the button is in series with several feedback NC contacts.
! I0.36=in_reset_extractors_NO          ;Reset "safety action 2" (extractors and visual alarm). Closed when button is pressed. Note: the button is in series with several feedback NC contacts.
! I0.37=in_reset_shutdown_container_NO  ;Reset "safety action 3" (container power shutdown). Closed when button is pressed. Note: the button is in series with several feedback NC contacts.
! I0.40=in_stop_button_cabinet_NC       ;Stop button installed on CAB-2 door. Closed when button is not pressed.
! I0.41=in_test_extractors_NO           ;Test extractors 1 & 2. 0: No test. 1: Test activated.
! I0.42=in_h2_detector1_fault_closed    ;H2 gas detector central (GfG). Closed when no default is detected.
! Q0.4=out_safety_sound_alarm           ;Safety action #1. It commands sound alarm.
! Q0.5=out_safety_extractors            ;Safety action #2. It commands extractors and visual alarm.
! Q0.10=A_pulse_out                     ;Dynamic output signal. Pulse train type A (marked as red-black cable in PL-005_rev04v01).
! Q0.11=B_pulse_out                     ;Dynamic output signal. Pulse train type B (marked as blue-black cable in PL-005_rev04v01).
! Q0.12=C_pulse_out                     ;Dynamic output signal. Pulse train type C (marked as magenta-black cable in PL-005_rev04v01).
! Q0.13=LED_system_online               ;Indication light. Light ON: safety PLC is online. Light OFF: PLC is offline (power cut).
! Q0.14=LED_H2_alarm_non_latched        ;Indication light. Light ON: at least one of the two H2 gas sensors is detecting a gas leak. Light OFF: none of the H2 gas sensors is detecting a gas leak.
! Q0.15=LED_H2_alarm_latched            ;Indication light. Latched version of 'LED_H2_alarm_not_latched' signal.
! Q0.16=LED_NH3_alarm_non_latched       ;Indication light. Light ON: NH3 gas sensor is detecting a gas leak. Light OFF: NH3 gas sensor is not detecting a gas leak.
! Q0.17=LED_NH3_alarm_latched           ;Indication light. Latched version of 'LED_NH3_alarm_non_latched' signal.
! Q0.20=LED_extractors_out_of_service   ;Indication light. Light ON: at least one extractor is out of service. Light OFF: both extractors are available.
! Q0.21=out_non_safety_gas_OK           ;Indication. Activated: gas leak has been detected or safety system is out of service. Non activated: no gas has beed detected and safety system is online.
! Q0.22=out_non_safety_reset_ready_sound_alarm;Indication. Reset "safety action 1" (gas sound alarm) is ready to be reseted by pressing 'reset_sound_alarm_NO' button.
! Q0.23=out_non_safety_reset_ready_extractors;Indication. Reset "safety action 2" (extractors) is ready to be reseted by pressing 'reset_extractors_NO' button.
! Q0.24=out_non_safety_reset_ready_shutdown;Indication. Reset "safety action 3" (container power shutdown) is ready to be reseted by pressing 'reset_shutdown_container_NO' button.
! Q0.25=out_non_safety_fault_alarm      ;'OR' logic combination of all positive-logic fault variables.
! M0.0=var_system_online                ;1: System is online
! M0.1=var_H2_H2_OK                     ;1: No gas detection or error in either of the H2 gas detectors (not latched).
! M0.2=var_H2_H2_OK_latched             ;1: No gas detection or error in either of the H2 gas detectors. Latched variable (i.e. it needs to be reset after been triggered).
! M0.3=var_NH3_detector_OK              ;1: No gas detection or error in NH3 detector (not latched).
! M0.4=var_H2_detector1_OK              ;1: No gas detection or error in H2 detector 1 (not latched).
! M0.5=var_H2_detector2_contacts_OK     ;1: NO and NC contacts operate in oposition. 0: they are symultaneously open or closed.
! M0.6=var_H2_H2_reset_ready            ;1: Both H2 gas detectors indicate no detection or error, so the latched variable can be reset.
! M0.7=var_fault_NH3                    ;1: Fault, NO and NC contacts are either open or closed simultaneously. 0: No fault.
! M0.8=var_NH3_detector_OK_latched      ;1: No gas detection or error in NH3 gas detector. Latched variable (i.e. it needs to be reset after been triggered).
! M0.9=var_NH3_reset_ready              ;1: NH3 gas detector indicates no detection or error, so the latched variable can be reset.
! M0.10=var_stop_container_OK           ;1: Stop button inside container is OK (not pressed and without error).
! M0.11=var_fault_stop_container        ;1: Stop button inside container is in error state (contacts are simultaneously open or closed).
! M0.12=var_STOP_STOP_OK                ;1: Both stop buttons are OK (none of them is pressed or in error).
! M0.13=var_extractor1_pressure_OK      ;1: (extractor 1 is activated AND under-presssure is detected) OR (extractor 1 is not activated AND under-pressure is not detected). Not filtered variable.
! M0.14=var_supervision_OK              ;1: Supervision input is OK (not triggered and no error).
! M0.15=var_fault_supervision           ;1: Fault, NO and NC contacts are either open or closed simultaneously. 0: No fault.
! M0.16=var_fault_H2_detector2_contacts ;1: Fault, NO and NC contacts are either open or closed simultaneously. 0: No fault.
! M0.17=var_H2_detector2_analog_OK      ;1: The analog input comming from H2 detector 2 indicates a value greater than or equal to 0.6V (2.4mA with a 250 Ohm resistor).
! M0.18=var_extractor1_pressure_OK_filtered_negated;Filtered and negated version of 'var_extractor1_pressure_OK' variable (to avoid glitches). This is an auxiliary variable in order to use a 'TON' block as filter.
! M0.19=var_extractor1_pressure_OK_filtered;Filtered version of 'var_extractor1_pressure_OK' variable (to avoid glitches).
! M0.20=var_shutdown_OK                 ;1: Container shutdown is OK (Safety action #3) (not latched).
! M0.21=var_shutdown_OK_latched         ;1: Container shutdown is OK (Safety action #3). Latched variable (i.e. it needs to be reset after been triggered).
! M0.22=var_lamp_test                   ;1: lamp test is activated. All alarms LEDs will turn on, overriding momentarily the states of the LEDs. 0: lamp test is not activated.


S0.0_0=safety
;Safety sequence. Program start-up. Not handled by the user.
var_H2_detector1_OK=in_h2_detector1_closed*in_h2_detector1_fault_closed
;H2 gas detector 1 (brand: GfG):
var_H2_detector2_contacts_OK=TC2S(/in_h2_detector2_open,in_h2_detector2_closed,1,var_fault_H2_detector2_contacts)
;H2 gas detector 2 (brand: Dega):
var_H2_detector2_analog_OK=(SR_I5_Volt>=6)
;H2 gas detector 2, analog input (Note: if SR_I5_Volt >= 6, then vIN >= 0.6V, then iIN >= 0.6V/250Ohm = 2.4mA)
var_H2_H2_OK=var_H2_detector1_OK*var_H2_detector2_contacts_OK*var_H2_detector2_analog_OK
;H2 gas detectors 1 and 2:
var_H2_H2_OK_latched=Reset2T(var_H2_H2_OK,in_reset_sound_alarm_NO,1,var_H2_H2_reset_ready)
;H2 gas detectors 1 and 2, latching:
var_NH3_detector_OK=TC2S(in_nh3_detector_closed,/in_nh3_detector_open,1,var_fault_NH3)
;NH3 gas detector:
var_NH3_detector_OK_latched=Reset2T(var_NH3_detector_OK,in_reset_sound_alarm_NO,1,var_NH3_reset_ready)
;NH3 gas detector, latched:
out_safety_sound_alarm=var_H2_H2_OK_latched*var_NH3_detector_OK_latched
;Safety action #1: sound alarm:
out_non_safety_reset_ready_sound_alarm=var_H2_H2_reset_ready+var_NH3_reset_ready
;Safety action #1 (sound alarm) reset. 
;Only reseteable when all three gas detectors (H2, H2, NH3) indicate no leak:
var_stop_container_OK=TC2S(in_stop_button_container_NC,/in_stop_button_container_NO,1,var_fault_stop_container)
;Stop button container:
var_STOP_STOP_OK=var_stop_container_OK*in_stop_button_cabinet_NC
;Stop button container and CAB-2 front:
var_supervision_OK=TC2S(in_supervision_relay_NC,/in_supervision_relay_NO,1,var_fault_supervision)
;'Supervision-safety' interface relay:
out_safety_extractors=Reset2T(var_H2_H2_OK*var_NH3_detector_OK*var_supervision_OK*var_STOP_STOP_OK,in_reset_extractors_NO,1,out_non_safety_reset_ready_extractors)
;Safety action #2: extractors
var_extractor1_pressure_OK=in_extractor1_pressure_NO*(in_extractor1_command_NO+in_test_extractors_NO+/out_safety_extractors)+/in_extractor1_pressure_NO*/in_extractor1_command_NO*/in_test_extractors_NO*out_safety_extractors
;Extractor 1 under-pressure detection when extractor is turned on (either in air-renewal mode or emergency mode): 
;Note: this variable will have glitches in the transitions of 'in_extractor1_command_NO' and 'out_safety_extractors'.
;For this reason, it will be filtered by a delay block later.
var_extractor1_pressure_OK_filtered_negated=/var_extractor1_pressure_OK*TON(008s00)
;Extractor 1 under-pressure detection, filtered (to avoid glitches) (1 of 2):
var_extractor1_pressure_OK_filtered=/var_extractor1_pressure_OK_filtered_negated
;Extractor 1 under-pressure detection, filtered (to avoid glitches) (2 of 2):
var_shutdown_OK=var_STOP_STOP_OK*var_H2_H2_OK*var_NH3_detector_OK*var_extractor1_pressure_OK_filtered*in_extractors_available
;Container shutdown, 1 of 3:
var_shutdown_OK_latched=Reset2T(var_shutdown_OK,in_reset_shutdown_container_NO,1,out_non_safety_reset_ready_shutdown)
;Container shutdown, 2 of 3:
;Note: This is the latched version of previous result.
out_safety_shutdown1:out_safety_shutdown2=var_shutdown_OK_latched*in_extractor1_command_NO
;Safety action #3: container shutdown, 3 of 3:
;Note: the input 'in_extractor1_command_NO' is excluded from the latched variable 'var_shutdown_OK_latched'.
;This is to avoid the need to reset the variable after turning off the air-renewal extractor.

S0.1_0=non_safety
;Non-safety sequence. Program start-up. Not handled by the user.
var_lamp_test=in_test_extractors_NO*TPS(004s00)
;Lamp test enabling signal (temporized):
LED_system_online
;System is online:
LED_H2_alarm_non_latched=/var_H2_H2_OK*SM_FastFlash+var_lamp_test
;H2 alarm indication, not latched:
LED_H2_alarm_latched=/var_H2_H2_OK_latched*SM_FastFlash+var_lamp_test
;H2 alarm indication, latched:
LED_NH3_alarm_non_latched=/var_NH3_detector_OK*SM_FastFlash+var_lamp_test
;NH3 alarm indication, not latched:
LED_NH3_alarm_latched=/var_NH3_detector_OK_latched*SM_FastFlash+var_lamp_test
;NH3 alarm indication, latched:
LED_extractors_out_of_service=(/var_extractor1_pressure_OK_filtered+/in_extractors_available)*SM_FastFlash+var_lamp_test
;Extractors alarm:
out_non_safety_gas_OK=out_safety_sound_alarm
;'Gas detection' or 'safety system out of service' alarm indication to University fire alarm system:
out_non_safety_fault_alarm=(var_fault_H2_detector2_contacts+var_fault_NH3+var_fault_stop_container+var_fault_supervision)*SM_FastFlash
;Faut indication alarm for inputs with a combination of a NO and a NC:
;Note: this output is not wired to a light indication but observable from the front of the PLC.
