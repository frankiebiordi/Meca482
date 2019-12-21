## MECA 482 Final Project Fall 2019



By: Francisco Biordi, Cameron Schindler, Jacob Olsen 

https://frankiebiordi.github.io/Meca482/








### Introduction

This project involves designing a control system for vertical take-off and landing (VTOL) aircraft using the knowledge that we gained from taking MECA 482. A VTOL-class aircraft that can hover mid-air as well as take-off and land vertically. A control system is required to successfully operate an aircraft with VTOL capabilities due to the unusual designs of most rendering it unable to be flown manually. The VTOL aircraft control system involves the control and positioning of a shaft mounted to support in a way that allows for rotation in the plane normal to the support and coincident with the shaft. A propeller is mounted to one end of the shaft and a counterweight is mounted on the other end to shift the center of gravity further towards the pivot point. The control of the propeller thrust is the main method for orienting the aircraft body in the case of this model. The idea of VTOL aircraft has been around since the early 1900s but the first good examples were not created until after World War II. The most common type of VTOL aircraft is the helicopter which is used both in military and civilian applications. There are a handful of jets that are capable of VTOL operation such as the Bell Boeing V-22 Osprey and the different variants of the Harrier jet.

A few different papers were referenced online to complete this project because we had to figure out how to derive the transfer function for the system, then interface MATLAB with V-REP to demonstrate the functionality of the system. A list of the specific papers can be found in the references section of this paper. Some of the models used in V-REP were made using SolidWorks and then adapted to be compatible with V-REP.

This paper was written to document the process of modeling the control system for a VTOL aircraft for a senior-level engineering semester project.
 


### Modeling

![FBD vtol](https://user-images.githubusercontent.com/59099338/71291483-ac526880-2327-11ea-973c-a40384486980.JPG)


![transfer function](https://user-images.githubusercontent.com/59099338/71298810-b59aff80-233e-11ea-98f4-971a2d4e0fde.JPG)


### Sensor Calibration 

This system will utilize a rotary potentiometer as an encoder to determine its position relative to the Earth. Rotary potentiometers are passive electrical components that are able to vary their resistance value as the shaft of the potentiometer rotates. This resistance value can be read from the potentiometer by a microcontroller such as an Arduino when wired to the analog inputs.


### Controller Design and System Software 





