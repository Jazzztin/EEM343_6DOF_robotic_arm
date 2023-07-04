clear all
close all
clc
vrep=remApi('remoteApi');
vrep.simxFinish(-1);

clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);

if (clientID>-1)
    disp('Connected to remote API server');
    %create some joints position
    joint_pos0=[0 -2.74017 2.42601 1.21 0 0 0];%prevent crash
    joint_pos1=[1.58825 -2.74017 2.42601 1.91986 0 0.872665 -0.872665]; %initial position
    
    joint_pos2=[0.820305 -0.942478 1.50098 2.1991 0 0.872665 -0.872665];
    joint_pos3=[0.820305 -0.942478 1.50098 2.1991 0 0 0]; 
    joint_pos4=[1.44862 -2.09440 1.85005 2.11185 0 0 0];
    joint_pos5=[1.44862 -1.25664 1.37881 1.79769 0 0 0];
    joint_pos6=[1.44862 -1.25664 1.37881 1.79769 0 0.872665 -0.872665];
    joint_pos7=[1.44862 -2.09440 1.85005 2.11185 0 0 0];
    
    joint_pos8=[1.44862 -1.11701 1.69297 2.25147 0 0.872665 -0.872665];
    joint_pos9=[1.44862 -1.11701 1.69297 2.25147 0 0 0];
    joint_pos10=[1.44862 -2.09440 1.85005 2.11185 0 0 0];
    joint_pos11=[1.44862 -1.25664 1.37881 1.79769 0 0 0];
    joint_pos12=[1.44862 -1.25664 1.37881 1.79769 0 0.872665 -0.872665];
    joint_pos13=[1.44862 -2.09440 1.85005 2.11185 0 0 0];
    
    joint_pos14=[1.9897 -0.872665 1.36136 2.16421 0 0.872665 -0.872665];
    joint_pos15=[1.9897 -0.872665 1.36136 2.16421 0 0 0];
    joint_pos16=[1.44862 -2.09440 1.85005 2.11185 0 0 0];
    joint_pos17=[1.44862 -1.25664 1.37881 1.79769 0 0 0];
    joint_pos18=[1.44862 -1.25664 1.37881 1.79769 0 0.872665 -0.872665];
    joint_pos19=[1.44862 -2.09440 1.85005 2.11185 0 0 0];
   
    joint_pos20=[1.34390 -0.785398 1.01229 2.26893 1.57080 0.872665 -0.872665];
    joint_pos21=[1.34390 -0.785398 1.01229 2.26893 1.57080 0 0];
    joint_pos22=[2.61799 -1.57080 1.74533 2.79253 1.57080 0 0];
    joint_pos23=[2.61799 -1.57080 1.74533 2.79253 1.57080 0.872665 -0.872665];
    joint_pos24=[2.63545 -2.00713 1.74533 2.89725 1.57080 0.872665 -0.872665];
    joint_pos25=[1.58825 -2.74017 2.42601 1.91986 0 0.872665 -0.872665];

    %handles
    h=[0,0,0,0,0,0,0]
      [r,h(1)]=vrep.simxGetObjectHandle(clientID,'J_Servo_1',vrep.simx_opmode_blocking);
      [r,h(2)]=vrep.simxGetObjectHandle(clientID,'J_Servo_2',vrep.simx_opmode_blocking);
      [r,h(3)]=vrep.simxGetObjectHandle(clientID,'J_Servo_3',vrep.simx_opmode_blocking);
      [r,h(4)]=vrep.simxGetObjectHandle(clientID,'J_Servo_4',vrep.simx_opmode_blocking);
      [r,h(5)]=vrep.simxGetObjectHandle(clientID,'J_Servo_5',vrep.simx_opmode_blocking);
      [r,h(6)]=vrep.simxGetObjectHandle(clientID,'J_Left',vrep.simx_opmode_blocking);
      [r,h(7)]=vrep.simxGetObjectHandle(clientID,'J_Right',vrep.simx_opmode_blocking);

      %while true
          for i=1:7
          vrep.simxSetJointTargetPosition(clientID,h(i),joint_pos0(i),vrep.simx_opmode_streaming);
          end
          pause(2);

          for i=1:7
          vrep.simxSetJointTargetPosition(clientID,h(i),joint_pos1(i),vrep.simx_opmode_streaming);
          end
          pause(2);

          for i=1:7
          vrep.simxSetJointTargetPosition(clientID,h(i),joint_pos2(i),vrep.simx_opmode_streaming);
          end
          pause(2);

          for i=1:7
          vrep.simxSetJointTargetPosition(clientID,h(i),joint_pos3(i),vrep.simx_opmode_streaming);
          end
          pause(2);

          for i=1:7
          vrep.simxSetJointTargetPosition(clientID,h(i),joint_pos4(i),vrep.simx_opmode_streaming);
          end
          pause(2);

          for i=1:7
          vrep.simxSetJointTargetPosition(clientID,h(i),joint_pos5(i),vrep.simx_opmode_streaming);
          end
          pause(2);

          for i=1:7
          vrep.simxSetJointTargetPosition(clientID,h(i),joint_pos6(i),vrep.simx_opmode_streaming);
          end
          pause(2);

          for i=1:7
          vrep.simxSetJointTargetPosition(clientID,h(i),joint_pos7(i),vrep.simx_opmode_streaming);
          end
          pause(2);

          for i=1:7
          vrep.simxSetJointTargetPosition(clientID,h(i),joint_pos8(i),vrep.simx_opmode_streaming);
          end
          pause(2);

          for i=1:7
          vrep.simxSetJointTargetPosition(clientID,h(i),joint_pos9(i),vrep.simx_opmode_streaming);
          end
          pause(2);

          for i=1:7
          vrep.simxSetJointTargetPosition(clientID,h(i),joint_pos10(i),vrep.simx_opmode_streaming);
          end
          pause(2);

          for i=1:7
          vrep.simxSetJointTargetPosition(clientID,h(i),joint_pos11(i),vrep.simx_opmode_streaming);
          end
          pause(2);

          for i=1:7
          vrep.simxSetJointTargetPosition(clientID,h(i),joint_pos12(i),vrep.simx_opmode_streaming);
          end
          pause(2);

          for i=1:7
          vrep.simxSetJointTargetPosition(clientID,h(i),joint_pos13(i),vrep.simx_opmode_streaming);
          end
          pause(2);

          for i=1:7
          vrep.simxSetJointTargetPosition(clientID,h(i),joint_pos14(i),vrep.simx_opmode_streaming);
          end
          pause(2);

          for i=1:7
          vrep.simxSetJointTargetPosition(clientID,h(i),joint_pos15(i),vrep.simx_opmode_streaming);
          end
          pause(2);

          for i=1:7
          vrep.simxSetJointTargetPosition(clientID,h(i),joint_pos16(i),vrep.simx_opmode_streaming);
          end
          pause(2);

          for i=1:7
          vrep.simxSetJointTargetPosition(clientID,h(i),joint_pos17(i),vrep.simx_opmode_streaming);
          end
          pause(2);
          
          for i=1:7
          vrep.simxSetJointTargetPosition(clientID,h(i),joint_pos18(i),vrep.simx_opmode_streaming);
          end
          pause(2);

          for i=1:7
          vrep.simxSetJointTargetPosition(clientID,h(i),joint_pos19(i),vrep.simx_opmode_streaming);
          end
          pause(2);

          for i=1:7
          vrep.simxSetJointTargetPosition(clientID,h(i),joint_pos20(i),vrep.simx_opmode_streaming);
          end
          pause(2);

          for i=1:7
          vrep.simxSetJointTargetPosition(clientID,h(i),joint_pos21(i),vrep.simx_opmode_streaming);
          end
          pause(2);

          for i=1:7
          vrep.simxSetJointTargetPosition(clientID,h(i),joint_pos22(i),vrep.simx_opmode_streaming);
          end
          pause(2);

          for i=1:7
          vrep.simxSetJointTargetPosition(clientID,h(i),joint_pos23(i),vrep.simx_opmode_streaming);
          end
          pause(2);

          for i=1:7
          vrep.simxSetJointTargetPosition(clientID,h(i),joint_pos24(i),vrep.simx_opmode_streaming);
          end
          pause(2);

          for i=1:7
          vrep.simxSetJointTargetPosition(clientID,h(i),joint_pos25(i),vrep.simx_opmode_streaming);
          end
          pause(2);

      %end

else
    disp('Failed connecting to remote API server');
end
    vrep.delete();

    disp('Program ended');