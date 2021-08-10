%======================================================================%
% MATLAB Major Project                                                 %
%                                                                      %
% Version 1.9                                                          %
%                                                                      %
% Programmed by Jessica Mould                                          %
%                                                                      %
% This program calculates the Initial Velocity, Release Angle, Final   %
% Velocity, Time of Flight, Horizontal Distance, Kinetic Energy and    %
% Maximum Height of a projectile, given the user inputs either         %
% horizontal and vertical compenets of initial velcoity, Angle and     %
% magnitude of initial velocity or the time and horezontal distance of %
% a projectile. It plots the graph of a projetile (Horizontal distance %
% against height. It also plots graphs for the Horizontal and Vertical %
% Velocities                                                           %
%======================================================================%

clear
clc
% Clears the variables from previous calculations, and command window

%===================================================================%
% Gets Values from user and calculates unknown values
%===================================================================%

Acceleration_y = -9.81 ;
% Sets variable 'Accerleration_y' (Vertical acceleration), to -9.81.
Type = questdlg('Which of the following do you have?','Projectile Motion',...
    'One or More Vectors with Magnitude and Angle','A Horizontal and Vertical Vector','Time and Distance Travelled','');
% Displays question dialog box asking the user what type of "values" they
% have, stores the answer under 'Type', so it can be used for a switch-case
% statement later
Kinetic = questdlg('Would you like to calculate the kinetic energy (You need to know the mass)','','Yes','No','');
% Displays question dialog box asking the user if they would like to
% calculate the kinetic energy and then stores the answer under 'Type', so it can be used for a switch-case
% statement next
switch Kinetic 
    % Finds answer stored under kinetic
    case 'Yes' 
        % If kinetic = 'Yes' then do the following until next case
        Mass= str2double(inputdlg({'Mass of Object (Kg) :'},'Projectile Motion'));
        % Produces an input dialog box asking the using for the mass of the
        % object in kg and sets it to variable 'Mass'
        while Mass<0
            Mass= str2double(inputdlg({'Enter a value for Mass of Object (Kg) that is greater than 0:'},'Projectile Motion'));
        end
        % The while loop checks that the value entered is greater than 0,
        % while mass isn't bigger than 0, then it produces an input dialog
        % box asking the user to enter the value again, until they enter a
        % valid value
    case 'No'
        
end
%If Kinetic = 'No', then the switch statement ends as kinetic
%energy doesnt need to be cacluated
Height = questdlg('Is there a launch height?','Projectile Motion','Yes','No','');
%Opens a dialog box with buttons, which asks the user if they have an
%intial launch height or not and stores this input as variable 'Height'
switch Height
%finds answer stored under Height
    case 'Yes'
    %if Height='Yes', it does the following until next case
        ReleaseHeight = str2double(inputdlg({'Launch Height(m):'},'Projectile Motion'));
        %produces a input dialog box and asks the user for the release height, and stores 
        %it as variable 'Release Height'
    case 'No'
    %if Height='No', does the following until end
        ReleaseHeight = 0;
        %sets ReleaseHeight to 0 as there is no release height, so it
        %equals 0
end
%Ends 'Height' switch statement
switch Type
    %finds answer stored under Type
     case 'One or More Vectors with Magnitude and Angle'
        %if Type='One or More Vectors with Magnitude and Angle', it does the following until next case 
       Count.Vectors = 0;
       %variable 'Count.Vectors' is equal to 0, this variable will be used
       %to make a counter while loop
       
          No.Vectors = str2double(inputdlg({'Number of Vectors:'},'Projectile Motion'));
          %displays input dialog box asking user for number of vectors,
          %stores user's input as variable 'No.Vectors'
          InitialVelocity_x=0;
          %sets the variable 'InitialVelocity_x' to 0, this is the intial
          %velocity in the x direction 
          InitialVelocity_y=0;
          %sets the variable 'InitialVelocity_y' to 0, this is the intial
          %velocity in the y direction 
          while Count.Vectors < No.Vectors
              %while 'Count.Vectors' is less than 'No.Vectors' the
              %following is done till line 'end' that ends while loop. this
              %loop keeps running until the amount of vectors entered
              %equals the amount user wished to calculate
              Count.Vectors = Count.Vectors + 1;
              %adds one to 'Count.Vectors'
              
              InitialVelocity_r = str2double(inputdlg({'Magnitude of velocity (m/s):'}, 'Projectile Motion'));
              %displays input dialog box asking the user to input the
              %magnitude of velocity, stores the user's input under
              %variable 'InitialVelocity_r'
              DegRad = questdlg('Is the angle in degrees, or radians?','','Degrees','Radians','');
              %Displays a question dialog box and asks the user whether
              %their angle is in radians or degrees and it stores the input
              %as 'DegRad'
              
              switch DegRad 
                  %finds the answer stored under 'DegRad'
                  case 'Degrees'
                      %If Degrad='Degrees', then the followinf is done
                      %until 'case 'Radians'' line
                       StartAngle = str2double(inputdlg({'Angle to the horizontal:'},'Projectile Motion'));
                       %Displays a input dialog box asking the user for the
                       %angle to the horizontal and stores it as variable
                       %'StartAngle'
                       while (StartAngle<-90)||(StartAngle>90)
                           %Checks that the 'StartAngle' is between 0 and
                           %90 degrees, if it isnt then the following code
                           %is ran until end of while loop
                           StartAngle = str2double(inputdlg({'Enter the angle horizontal making it between 0 and 90:'},'Error'));
                           %Asks the user to re-enter the angle to the
                           %horizontal and to make sure its between 0 and
                           %90 degree (stores as 'StartAngle' variable), continues to do this until valid
                           %angle is entered.
                       end
                       %Ends while loop
                           InitialVelocity_y = InitialVelocity_y +  InitialVelocity_r*sind(StartAngle);
                 
                           InitialVelocity_x = InitialVelocity_x +  InitialVelocity_r*cosd(StartAngle);
                           %Adds new inital velocity for x and y components
                           %to exsisting one, to calculate the overall
                           %initial x and y velocity components.
                  case 'Radians'
                      %When DegRad = 'Radians' the following code until end
                      %of DegRad switch statement
                      
                       StartAngle = str2double(inputdlg({'Angle to the horizontal:'},'Projectile Motion'));
                       %Displays input dialog box and asks the user for
                       %angle to horizontal, stores the user input as
                       %variable 'StartAngle'
                       while (StartAngle<-90)||(StartAngle>pi/2)
                       %Checks angle is between 0 and pi/2, and if it is not then the follwoing code up to end of 
                       %while loop is ran.
                           StartAngle = str2double(inputdlg({'Enter an angle between 0 and Pi/2:'},'Error','error')); 
                           %Asks the user to re-enter the angle to the
                           %horizontal and to make sure its between 0 and
                           %pi/2 (stores as 'StartAngle' variable), continues to do this until valid
                           %angle is entered.
                       end
                       %End while loop ((StartAngle<0)||(StartAngle>pi/2))
                          InitialVelocity_y = InitialVelocity_y + InitialVelocity_r*sin(StartAngle);
                          InitialVelocity_x = InitialVelocity_x + InitialVelocity_r*cos(StartAngle);
                          %Adds new inital velocity for x and y components
                          %to exsisting one, to calculate the overall
                          %initial x and y velocity components.
              end
              %Ends 'DegRad' switch statement
          end 
          %Ends the while loop (Count.Vectors< No.Vectors)
          
          
           Angle = atand(InitialVelocity_y/InitialVelocity_x);
           %Sets variable 'Angle' to the inverse tan of initialVelocity_y
           %over InitialVelocity_x, so that the variable 'Angle' is equal
           %to the launch angle
           
   case 'A Horizontal and Vertical Vector'
       % If Type= 'A Horizontal and Vertical Vector' then the following
       % code up to line-case 'Time and Distance Travelled'
        InitialVelocity_x = str2double(inputdlg({'Magnitude of Horizontal Velocity(m/s): '},'Projectile Motion'));
        % Displays a input dialog box asking the user to enter the
        % magnitude of the horizontal velocity and stores as variable
        %'InitialVelocity_x'
        while InitialVelocity_x <=0
            % Checks the inital horizontal velcoity is greater than or
            % equal to 0, therefore a "valid" velocity, if its not then the
            % following code up to the end of while loop is ran.
            InitialVelocity_x = str2double(inputdlg({'Enter a Value for Magnitude of Horizontal Velocity greater than 0: '},'Error'));
            %Asks the user to again to enter the horizotnal velocity, unitl
            %it i valid and stores the valid input as variable
            %'InitialVelocity_x'
        end
        %End of while loop
        InitialVelocity_y = str2double(inputdlg({'Magnitude of Vertical Velocity(m/s): '},'Projectile Motion'));
        % Displays a input dialog box asking the user to enter the
        % magnitude of the vertical velocity and stores as variable
        %'InitialVelocity_y'
        Angle = atand(InitialVelocity_y/InitialVelocity_x);
          %Sets variable 'Angle' to the inverse tan of initialVelocity_y
          %over InitialVelocity_x, so that the variable 'Angle' is equal
          %to the launch angle
   case 'Time and Distance Travelled'
       % If Type =  'Time and Distance Travelled' then the following
       % code up to End of 'Type' switch statement
            HorizontalDistance = str2double(inputdlg({'Horizontal Distance Travelled(m):'},'Projectile Motion'));
            % Displays input dialog box asking the user to input the
            % horizontal distance travelled, stores the user input as
            % variable 'HorizontalDistance'
            while HorizontalDistance<=0
                %Checks whether users input is greater than 0, therefore a
                %valid horizontal distance, if its not then the following
                %code is ran till the end of the while loop
                HorizontalDistance = str2double(inputdlg({'Enter a value for Horizontal Distance Travelled greater than 0:'},'Projectile Motion'));
                %Asks the user to input a valid horizontal distance, and
                %continues to ask until they do and stores the user's valid
                %input as variable 'HorizontalDistance'
            end
            %Ends while loop
            FlightTime = str2double(inputdlg({'Time of Flight(s):'}, 'Projectile Motion'));
            %Displays an input dialog box and asks user for the time of
            %flight, stores as variable 'FlightTime'
            while FlightTime<=0
                 %Checks whether users input is greater than 0, therefore a
                %valid flight time , if its not then the following
                %code is ran till the end of the while loop
                FlightTime = str2double(inputdlg({'Enter a value for Time of Flight greater than 0:'},'Projectile Motion'));
                %Asks the user to input a valid flight time, and
                %continues to ask until they do and stores the user's valid
                %input as variable 'FlightTime'
            end
            %Ends while loop
            InitialVelocity_x = HorizontalDistance/FlightTime;
            %Sets variable 'InitialVelocity_x' to HorizontalDistance over
            %FlightTime, so this calculates what the initial velocity is
            %using the user's inputs
            InitialVelocity_y = (ReleaseHeight-(0.5*Acceleration_y*FlightTime*FlightTime))/FlightTime;
            %Calculates the initial vertical velocity and sets it to the
            %variable 'InitialVelocity_y'
            StartAngle = atand(InitialVelocity_y/InitialVelocity_x);   
            %Calculates the release angle and sets it as variable
            %'StartAngle'
            Angle = StartAngle;                       
            %Sets StartAngle to equal variable 'Angle'
            
end 
%Ends 'Type' switch statement
   
    FinalVelocity_x = InitialVelocity_x ;
    %Sets 'FinalVelocity_x' variable to equal 'InitialVelocity_x' 
    InitialVelocity_r = sqrt((InitialVelocity_y*InitialVelocity_y)+(InitialVelocity_x*InitialVelocity_x));
    %Calculates the initial resultant velocity by setting it equal to the
    %square root of the sum of the initial horizontal velocity square and the initial vertical velocity squared
    a = Acceleration_y;
    b = 2*InitialVelocity_y;
    c = 2*ReleaseHeight; 
    %I have set the values of a, b and c in a quadratic equation to there
    %values, before entering them in the equations, to make it easier to write
    %said equation
    T1 = (-b-sqrt(b^2 -4*a*c))/(2*a);
    T2 = (-b+sqrt(b^2-4*a*c))/(2*a);
    %Calculates both possible values of T         
    if T1 < T2
     FlightTime = T2;
     elseif T2 < T1
     FlightTime = T1;
    end
    %Finds the largest value out of T1 and T2, as one will be negative and not
    %be a valid time, it sets the largest of the 2 to the time of flight,
    %'FlightTime', which is the time of flight.
    

FinalVelocity_y = (InitialVelocity_y + (-9.81*FlightTime));
%Uses suvat equation V= U + AT, but with the variable values of U, a and t
%to find V, sets the value of V to 'FinalVelocity_y' (Vertical component)
FinalVelocity_r = sqrt(((FinalVelocity_x*FinalVelocity_x)+(FinalVelocity_y*FinalVelocity_y)));
%Finds the resultant end velocity, using pythagoras, and the two component velocities and sets it to 
%variable 'FinalVelocity_r'
EndAngle = abs(atand(FinalVelocity_y/FinalVelocity_x));
%Finds angle of ending velocity, using inverse tan of the vertical velocity over
%horizontal velocity and sets it to variable 'EndAngle'
                                                                                
HorizontalDistance = InitialVelocity_x*FlightTime; 
%Calculates the distance travelled, Variable-'HorizontalDistance', using S = ut as acceleration is 0,
%rather then s= ut+1/2at^2
MaxHeight = ((-(InitialVelocity_y^2))/(2*Acceleration_y))+ReleaseHeight;
% Calulates the Maximum height using suvat and then sets it equal t
% variable 'MaxHeight'
MHDistance = ((InitialVelocity_y/9.81)*InitialVelocity_x);
%Calculates the distance at which the Maximum height is achieved and sets
%it to variable 'MHDistance'


switch Kinetic 
    %finds answer stored under kinetic
    case 'Yes'
        KE = 0.5*Mass*FinalVelocity_r*FinalVelocity_r;
        %if Kinetic='Yes' (user wants to calculate kinetic energy), then
        %then kinetic energy is calculated and stored as variable 'KE'
    case 'No'
        KE=0;
        %If Kinetic='No' then the variable 'KE' is equal to 0.
end 
%Ends 'Kinetic' Switch Statement






%================================================%
% Puts Results into strings                      %
%================================================%


Results = {['The Initial Velocity is ', num2str(InitialVelocity_r,4),' at ', num2str(Angle,3), ' degrees to the horizontal'];...
              ['The Final Velocity is ', num2str(FinalVelocity_r,4), ' at ', num2str(EndAngle,3),' degrees to the horizontal'];...
              ['The Time of Flight was ', num2str(FlightTime,4),' seconds'];...
              ['The Horizontal Distance is ', num2str(HorizontalDistance,4),' metres'];...
              ['The Maximum Height is ',num2str(MaxHeight,4),' metres']};

         %'Results' is set as a string stating the initial Velocity and angle, Final
         %Velocity, Time of Flight, Horizontal Distance and Maximum Height.
         %Usings num2str to convert the variables into a string from a
         %number
   ResultsKE = {['The Initial Velocity is ', num2str(InitialVelocity_r,4),' at ', num2str(Angle,3), ' degrees to the horizontal'];...
              ['The Final Velocity is ', num2str(FinalVelocity_r,4), ' at ', num2str(EndAngle,3),' degrees to the horizontal'];...
              ['The Time of Flight was ', num2str(FlightTime,4),' seconds'];...
              ['The Horizontal Distance is ', num2str(HorizontalDistance,4),' metres'];...
              ['The Maximum Height is ',num2str(MaxHeight,4),' metres'];...
              ['The Kinetic Energy is ',num2str(KE,4),' joules']};
          %'ResultsKE' is set as a string stating the initial Velocity and angle, Final
         %Velocity, Time of Flight, Horizontal Distance, Kinetic Energy and Maximum Height.
         %Usings num2str to convert the variables into a string from a
         %number

         
%==========================================%
% Plots Horizontal Velocity Graph          %
%==========================================%
         
         
subplot(2,3,2)
% plots the following up to line 'Hold off' in the 2nd row of the figure
time = 0:0.001:FlightTime;
%makes time equal an array of numbers from 0 to the value of FlightTime
%going up in steps of 0.001 for each following value
plot(time,InitialVelocity_x*ones(size(time)),'k')
%Plots a graph of time (x-axis) against InitialVelocity_x (y-axis), making
%in the colour of black, so a black line will be plotted
title('Horizontal Velocity')
%Makes the title of the graph say "Horizontal Velocity"
xlabel('Time/s')
%Labels the x-axis of the graph as "Time/s"
ylabel('Horizontal Velocity/ ms^{-1}')
%Labels the y-axis of the graph as "Horizontal Velocity/ ms^-1"
grid on
%Puts grid on the graph
box on
%puts box on the graph
hold off
%Holds off, so another graph can be plotted


%==========================================%
% Plots Vertical Velocity Graph            %
%==========================================%


subplot(2,3,3)
% plots the following up to line 'Hold off' in the 3rd row of the figure
HalfTime = InitialVelocity_y/9.81;
% Calculates the time when the vertical velocity will equal 0, and sets it
% to variable 'HalfTime'
time1 = 0:0.001:HalfTime;
%makes time1 equal an array of numbers from 0 to the value of HalfTime
%going up in steps of 0.001 for each following value
time2 = HalfTime:0.001:FlightTime;
%makes time equal an array of numbers from the value of HalfTime to the value of FlightTime
%going up in steps of 0.001 for each following value
grad1 = -9.81;
%Sets variable 'grad1' to equal -9.81
grad2 = 9.81;
%Sets variable 'grad2' to equal 9.81
y1 = grad1*time1-HalfTime*grad1;
%Calculates the value of vertical velocity for each number of time1 and
%sets it equal to variable 'y1'
y2 = grad2*time2-HalfTime*grad2;
%Calculates the value of vertical velocity for each number of time2 and
%sets it equal to variable 'y2'
plot(time1,y1,'k')
%Plots on the graph a line of time1 (x-axis) against y1 (y-axis) in black
hold on
%Hold on is used as you want to plot another line onto the same graph
plot(time2,y2,'k')
%Plots on the graph a line of time2 (x-axis) against y2 (y-axis) in black
title('Vertical Velocity')
%displays the title "Vertical Velocity" on the graph
xlabel('Time/s')
%Labels x-axis as 'Time/s'
ylabel('Vertical Velocity/ ms^{-1}')
%Labels y-axis as 'Vertical Velocity/ ms^-1'
grid on
%Puts grid on graph
box on
%Puts box on graph

hold off
%Hold off used as another graph is plotted in same figure

%==========================================%
% Plots Projectile Graph          %
%==========================================%

subplot(2,3,1)
%Plots the following graph in the 1st part of the figure
time = 0:0.001:FlightTime;
%makes time equal an array of numbers from 0 to the value of FlightTime
%going up in steps of 0.001 for each following value
x    = InitialVelocity_r*cosd(Angle)*time;
%calculates variable 'x' (the horizontal displacment) for each value of
%time in the array
y    = InitialVelocity_r*sind(Angle)*time - 0.5*9.81*time.^2 +ReleaseHeight;
%calculates variable 'y' (the height) for each value of
%time in the array
plot(x,y,'k')
%Plots a graph of x(x-axis) against y (y-axis)
plot(MHDistance,MaxHeight,'pk','MarkerSize',15)
%Plots the point of the maximum height onto the graph
text(MHDistance,MaxHeight,'Max Height')
%Plots text at the plotted point of maximum height telling the user its the
%max height
xlabel('Distance/m')
%Labels the x-axis as 'Distance/m'
ylabel('Height/m')
%Labelss the y-axis as 'Height/m'
title('Projectile Trajectory')
%Titles the graph as 'Projectile Trajectory'


%==========================================%
% Plots Values onto figure                 %
%==========================================%

 
hold on
%Holds on so the following code can also be plotted onto the graph 
if KE==0
    dim = [0.2 0.2 0.1 0.1];
    annotation('textbox',dim,'String',Results,'FitBoxToText','on','FontSize',14);
else
    dim = [0.2 0.2 0.1 0.1];
    annotation('textbox',dim,'String',ResultsKE,'FitBoxToText','on','FontSize',14);
end
%if statement plots a textbox onto the same figure with the graphs on,
%plots it under the graph, stating the calculated values, if KE=0 it  doesnt shows
%the kinetic energy as well as other value else it does


for t = 1:50:length(time)  
    plot(x(t),y(t),'mo')
    pause(0.005)
end  
% Plots a point of the already drawn graph at as a magenta circle pausing
% 0.005 seconds between points, to mimic the particle's projectile 
hold on
plot(x,y,'k')
grid on 
%Puts grid on the graph
box on 
%Puts box on the graph

%==========================================%
% Displays Values Message Box              %
%==========================================%

    
          if KE == 0
              f = msgbox(Results);
              disp(Results)
              %If KE=0, therefore the user doesn't wish to calculate the
              %kinetic energy, then a message dialog box with the string
              %'Results' in is displayed to the user, as well as 'Results'
              %being printed in command window incase user close dialog box
              %by accident
          else 
              f = msgbox(ResultsKE);
              disp(ResultsKE)
              %If KE doesn't equal 0, therefore the user does wish to calculate the
              %kinetic energy, then a message dialog box with the string
              %'ResultsKE' in is displayed to the user, as well as 'ResultsKE'
              %being printed in command window incase user close dialog box
              %by accident
          end
          %Ends the if statement
              


%=================================================%
% End of Program                                  %
%=================================================%


