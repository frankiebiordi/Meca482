% Make sure to have the server side running in CoppeliaSim: 
% in a child script of a CoppeliaSim scene, add following command
% to be executed just once, at simulation start:
%
% simRemoteApi.start(19999)
%
% then start simulation, and run this program.

function simpleTest()
    disp('Program started');
    sim=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
    sim.simxFinish(-1); % just in case, close all opened connections
    clientID=sim.simxStart('127.0.0.1',19999,true,true,5000,5); %initialize a connection

    if (clientID>-1)
        disp('Connected to remote API server');
            
        % Now try to retrieve data in a blocking fashion (i.e. a service call):
        [res,objs]=sim.simxGetObjects(clientID,sim.sim_handle_all,sim.simx_opmode_blocking);
        if (res==sim.simx_return_ok)
            fprintf('Number of objects in the scene: %d\n',length(objs));
        else
            fprintf('Remote API function call returned with error code: %d\n',res);
        end  
        pause(2);
    
        % Now retrieve streaming data (i.e. in a non-blocking fashion):
        
        [res, Joint] = sim.simxGetObjectHandle(clientID, 'Revolute_joint', sim.simx_opmode_blocking); %Obtain Handle information of the Revolute Joint to gain the relative angle information
        
        GoalAngle = 0; %Angle at which we want the bar to be held at
        
        Force = 0; %Starting Force Amount
        
        MaxForce = 5; %Max Force the propeller can "emit"        
        
        while(true)
        [res, Angle] = sim.simxGetJointPosition(clientID, Joint, sim.simx_opmode_streaming); %Obtain Relative Angle
           
        Angle = Angle*180/pi; %Convert Angle from Rad to Degrees
        
        
        if Angle > GoalAngle %%If the angle of the beam is above the angle of the goal, the force of the propeller is decreased
            if Force<MaxForce
                Force = Force - 0.005;
                Status = 0;
            end
        elseif Angle < GoalAngle %%If the angle of the beam is below the angle of the goal, the force of the propeller is increased
            if Force<MaxForce
                Force = Force + 0.005;
                Status = 1;
            end
        else Angle == GoalAngle %%If the angle of the beam is equal to the angle of the goal, the force of the propeller is held constant
            Force = Force;
            Status = 2;
        end
        
        
        
        
        ForceY = abs(cosd(90-Angle)*Force); %%Transforms the force required into the components to send to VREP
        ForceZ = abs(sind(90-Angle)*Force);
        
        sim.simxSetIntegerSignal(clientID, 'ForceY_Send', ForceY, sim.simx_opmode_oneshot); %%Send the Force to VREP
        sim.simxSetIntegerSignal(clientID, 'ForceZ_Send', ForceZ, sim.simx_opmode_oneshot);
        

        DispArray = [ForceY ForceZ Force Angle Status GoalAngle]; %%Display Important Data in the Matlab Command Window
        
        disp(DispArray); 
        pause(0.1);
        end
        
        
        
        
         
        % Now send some data to CoppeliaSim in a non-blocking fashion:
        sim.simxAddStatusbarMessage(clientID,'Clean up time!',sim.simx_opmode_oneshot);

        % Before closing the connection to CoppeliaSim, make sure that the last command sent out had time to arrive. You can guarantee this with (for example):
        sim.simxGetPingTime(clientID);

        % Now close the connection to CoppeliaSim:    
        sim.simxFinish(clientID);
    else
        disp('Failed connecting to remote API server');
    end
    sim.delete(); % call the destructor!
    
    disp('Program ended');
end