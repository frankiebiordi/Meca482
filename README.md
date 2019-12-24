## MECA 482 Final Project Fall 2019


![chicoemblem](https://user-images.githubusercontent.com/59099338/71423980-4c6b0300-2642-11ea-8709-133acdd46edb.JPG)


By: Francisco Biordi, Cameron Schindler, Jacob Olsen 



Section 3323 and 5182



MECA 482



Professor H. Sinan Bank


https://frankiebiordi.github.io/Meca482/








### Introduction

This report was created to document a senior-level control systems engineering semester project. This project involves designing a control system for vertical take-off and landing (VTOL) aircraft. A VTOL-class aircraft that can hover mid-air as well as take-off and land vertically. A control system is required to successfully operate an aircraft with VTOL capabilities due to the unusual designs of most rendering it unable to be flown manually. The VTOL aircraft control system involves the control and positioning of a shaft mounted to support in a way that allows for rotation in the plane normal to the support and coincident with the shaft. A propeller is mounted to one end of the shaft and the other end is fixed to the support. The support is placed normal to the surface of the earth so it is parallel with the gravity vector. A counterweight could potentially be added to the other end of the shaft to improve the stability of the system due to the inertial effects of the mass and the less force required by the motor. The control of the propeller thrust is the main method for orienting the aircraft body in the case of this model. The idea of VTOL aircraft has been around since the early 1900s but the first good examples were not created until after World War II. The most common type of VTOL aircraft is the helicopter which is used both in military and civilian applications. There are a handful of jets that are capable of VTOL operation such as the Bell Boeing V-22 Osprey and the different variants of the Harrier jet.

A few different papers were referenced online to complete this project because we had to figure out how to derive the transfer function for the system, then interface MATLAB with V-REP to demonstrate the functionality of the system. A list of the specific papers can be found in the references section of this paper. Some of the models used in V-REP were made using SolidWorks and then adapted to be compatible with V-REP.

 


### Modeling

First, a high-level simple model of the system was derived to determine the system’s general response. Then the more accurate transfer function was derived using MATLAB with the “tf” function. The basic idea behind this system is that the propeller will overcome the force of gravity and stabilize at the desired angle. The initial calculations took some time to solve because we did not account for the system needing a dynamic impulse to arrive at the correct position and instead were calculating the holding force required. 


![transfer function](https://user-images.githubusercontent.com/59099338/71298810-b59aff80-233e-11ea-98f4-971a2d4e0fde.JPG)

Figure 1: The transfer function used to control the system.

![FBD vtol](https://user-images.githubusercontent.com/59099338/71291483-ac526880-2327-11ea-973c-a40384486980.JPG)

Figure 2: A free body diagram of the propeller on the end of the arm





### Sensor Calibration 

This system will utilize a rotary potentiometer as an encoder to determine its position relative to the Earth. Rotary potentiometers are passive electrical components that are able to vary their resistance value as the shaft of the potentiometer rotates. This resistance value can be read from the potentiometer by a microcontroller such as an Arduino when wired to the analog inputs.


### Controller Design and Simulations

The controller was first designed at a very high level using block diagrams to lay out the flow of the entire system. This was then converted to individual component choices for the theoretical model and to determine the capability of each. This system requires a propeller-based thruster to change the angle of the arm relative to the support stand that is attached to the ground. The controller was first derived by hand and then implemented with MATLAB.

### Controller Implementation 

While we would have liked to have built a physical implementation of this system but we ran out of time	because every member of the group had other projects also due before this one. We have ideas of how we would do it if we had time to construct the system. This would also provide a good learning experience because we would most likely see some small things that we did not think about but still have a small effect on the system.


### Apendix A: Simulation Code

### Help Forums 

Lab01

https://www.researchgate.net/publication/224700285_Modelling_and_Control_of_a_Convertible_VTOL_Aircraft

https://www.lehigh.edu/~inconsy/lab/css/ME389/guidelines/ME389_AERO01_VTOL_Guideline.pdf

https://www.grc.nasa.gov/WWW/K-12/airplane/propth.html

http://ctms.engin.umich.edu/CTMS/index.php?example=Introduction&section=ControlPID







