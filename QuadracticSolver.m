%==================================================================%
%  MATLAB Mini Project
%  Version 1.8
%==================================================================%


%clClear 
clc
% Clears the command window and any stored values
disp('Quadratic Equation Solver');
% Tells the user the title of the program
disp('Programmed By Jessica Mould');
% Tells the user who wrote the code
disp(['This program plots and solves quadratic equations in the form'...
    '"ax^2+bx+c".It can also find intersecting points between the quadratic'...
    'and a striaght line, and plot the straight line with quadartic']); 
 % Tells the user what the program does
disp(['When asked for an input of yes or no, anything other then input of 1'... 
      'from the user will be taken as meaning no'])
  % Tells the users what their inputs will be interpreted

  SolveQuadratic= input ('Please enter 1 to begin');
  % Asks the user to enter 1 to start the program, and stores it as 
  % the variable 'SolveQuadratic'.
  if SolveQuadratic~= 1
      SolveQuadratic= input ('Please enter 1 to begin');
  else
  end
  % If SolveQuadratic doesn't equal one, then the user will be prompted to 
  % type 1 to begin, the rest of the code won't be ran until they have
  % entered 1


while SolveQuadratic == 1
    % The below code, until end is ran while SolveQuadratic=1 (the user
    % wishes to solve a quadratic)
    disp('Enter corresponding values using, ax^2+bx+c, to solve a quadratic');
    % tells the user what it means when they are asked for input of a, b or c
    a = input('what is your a value?');
    % asks user for their a value and stores as variable a
    b = input('what is your b value?');
    % asks user for their b value and stores as variable b
    c = input('what is your c value?');
    % asks user for their c value and stores as variable c
    while a==0
    % checks the users a value isn't 0              
    disp('Please enter a non-zero value');
    % tells the user they can't input 0
    a= input('what is your a value?');
    % asks user to re-enter their a value
    end
    
    Disc = (b^2 -4*a*c);
    % Uses the equation for the discriminant to calculate what the 
    % discriminant of the quadartic is, and store it as variable 'Disc'
    
   
    x1 = (-b+sqrt(b^2 -4*a*c))/(2*a); 
    % Sets x1 to the value of one of the roots, by calculating the value of
    % it using the quadratic formula (+/- = +)
    x2 = (-b-sqrt(b^2 -4*a*c))/(2*a); 
    % Sets x2 to the value of one of the roots, by calculating the value of
    % the quadratic formula (+/- = -)
    Mx= (-b)/(2*a);
    % Calculates the x-coordinate of the minimum/maximum point, and stores
    % it as the variable Mx
    My= (a*(Mx^2)+(b*Mx)+c);
    % Calculates the y-coordinate of the minimum/maximum point, and stores
    % it as the variable My
    
   
    if Disc ==0
        % If 'Disc' is equal to 0 (repeating root) then the below code will be ran,
        % until 'elseif'
        disp('There is one repeating root')
        % Tells the user that there is one repeating root
        disp(['The only root is x=', num2str(x1)]);
        % num2str converts the variable x1 into a variable
        % tells user what the root is
    elseif Disc >0
        % If the 'Disc' is bigger then 0 (two real roots) then the below code
        % will be ran, until 'elseif'
        disp('There are two real roots')
        % tells the user that there are two real roots
        disp(['Root 1 is x= ' , num2str(x1)])
        % num2str converts the variable x1 into a variable
        % tells the user what the 1st root is
        disp(['Root 2 is x= ' , num2str(x2)])
        % num2str converts the variable x2 into a variable
        % tells the user what the 2nd root is
    elseif Disc <0
        % If 'Disc' is less than 0 (no real roots) then the below code will be
        % ran, until 'else'
        disp('There is no real roots')
        % Tells the user that there are no real roots
        disp('The roots are imaginary')
        % Tells the user that the roots are imaginary
        disp(['Root 1 is x= ' , num2str(x1)])
        % num2str converts the variable x1 into a variable
        % tells the user what the 1st root is
        disp(['Root 2 is x= ' , num2str(x2)])
        % num2str converts the variable x2 into a variable
        % tells the user what the 2nd root is
    else
    end 
 disp('You can only plot the LAST quadratic you have solved (given the roots are real), to continue to plotting, or end program please type 0 next')
 SolveQuadratic = input('Would you like to solve another quadratic? Type 1 for yes and 0 for no');
 
end
 % 'Disc' is smaller than 0, then the code ends as you can't plot imaginary roots

if Disc>=0
    % Runs the following code if 'Disc' is bigger then or equal to zero (the root/s are real)
    
   Line= input(['Would you like to find the intersection points for the equation '...
               'of a straight line with the quadratic? Type 1 for yes and 0 for no']);
   % Asks the user if they would like to find the intersection points of a
   % straight line with their quadratic. It stores the input as a
   % variable 'Line'. (Yes= 1 , Else= no)
   if Line==1
       % Runs the following code if Line = 1 (user wants a to find
       % intersection with a straight line)
       disp('Please use the equation y=mx+c, where m is the gradient and c is the y-intercept')
       % Tells the user what form for equation of line to use when typing in their value
       M = input('What is the gradient?');
       % Asks user for the gradient of straight line, and stores it as the
       % variable M
       C = input('What is the y-intecept?');
       % Asks user for the y-intercept of straight line, and stores it as
       % variable C
       %----------------------------------------------------------------------%
       % How I calculated the intersection co-ordinates:                      %
       % I have calculated how to get these equation for IX1 and IX2          %
       % (x-coordinate points of intersection of straight line and quadratic),%
       % by equating the straight line to the quadratic and rearranging, to   %
       % get a new 'combined quadartic'> To find the IX1 and IX2 you solve    %
       % the quadratic. The new combined quadratic is in the form (using      %
       % previously used variables ax^2 + (b-M)x + (c-C), so I have set (b-M) %
       % and (c-C) to new variables B and k retrospectively. This is so the   %
       % new 'combined' quadratic can have the form 'ax^2 +Bx + k' making it  %
       % easier to set up calculations for the intersection points. It        %
       % calculates the corrosponding y-coordinates for the intersection      %
       % points by placing the IX1/2 coordinates back into the orginal        %
       % straight line equation                                               %
       %----------------------------------------------------------------------%
       B= b-M;
       % Creates variable B and stores it, which is explained above
       k= c-C;
       % Creates variable k and stores it, which is explained above
       
   
       IX1= (-B+sqrt(B^2 -4*a*k))/(2*a);
       % Calculates first intersection x-coordinate and stores it as
       % variable IX1
       IX2= (-B-sqrt(B^2 -4*a*k))/(2*a);
       % Calculates second intersection x-coordinate and store it as
       % variable IX2
       IY1= (M*IX1)+C;
       % Calculates corrosponding first intersection y-coordinate and stores
       % it as variable IY1
       IY2= (M*IX2)+C;
       % Calculates corrosponding second intersection y-coordinate and stores
       % it as variable IY2
       
       disp(['intersection point 1 is (' ,num2str(IX1), ',' ,num2str(IY1), ')'])
       % num2str converts the variables IX1 and IY1 into a string
       % tells the user the 1st intersection point
       disp(['intersection point 2 is (' ,num2str(IX2), ',' ,num2str(IY2), ')'])
       % num2str converts the variables IX2 and IY2 into a string
       % tells the user the 2nd intersection point 
 
   else
   end 

else
end
if Disc>=0 
% If 'Disc' is bigger than or equal to 0 (there are real roots) then run the
% following code 
    graph = input('Would you like a graph of the quadratic equation? Type 1 for yes and 0 for no');
    % Asks the user if they would like a graph of the quadratic
    if graph==1
        % If 'graph' is equal to 1(user wants graph of quadratic), then the following code will be ran 
        QuadraticColour = input([' What colour would you like the quadratic line to be displayed as (the automatic colour is black)?'...
                             'type 1 for red, 2 for blue or 3 for magenta']);
        % Asks the user what colour they want the quadratic graph to be in,
        % with the default colour being black (which is what will be
        % displayed if they enter any numerical value other 1,2 or 3.
        % it stores there input as the variable QuadraticColour, where
        % 1=red, 2=blue, 3=magenta
        if Line==1
        % If 'Line' is equal to 1 (use has input a straight) the following
        % code will be ran
           PlotLine = input('Would you like to plot the straight line as well? Type 1 for yes and 0 for no');
           % Asks the user if they would like to plot their straight line
           % as well, there input is stored as the variable-'PlotLine'(1=yes, else=no), 

            if PlotLine == 1
            % If 'PlotLine' is equal to 1, then the following code will be
            % ran
               LineColour = input([' What colour would you like the line to be displayed as, the automatic colour is black?'...
                             'type 1 for red, 2 for blue or, 3 for magenta']);
               % Asks the user what colour they want the straight line graph to be in,
               % with the default colour being black (which is what will be
               % displayed if they enter any numerical value other 1,2 or 3.
               % it stores there input as the variable- 'LineColour', where
               % 1=red, 2=blue, 3=magenta
            else
            end
        else
        end
    else
    end
    

if graph == 1 
    % If 'graph' is equal to 1 (user wants to plot graph of quadratic),
    % then the following code is ran
    
                                     
    Start = input('What value of x do you want the graph to start at?');
    % Asks user what they want their starting value of x to be, and stores
    % user's input as a variable-'Start'
    Step  = input('How big do you want the steps to be'); %find way of rewording this
    % Asks user what steps they want the plots to be, and stores user's
    % input as a variable- 'Step'
    End   = input('What value of x would you like the graph to end at?');
    % Asks user what they want their ending value of x to be, and stores
    % user's input as variable- 'End'
 
    while Start>End
        disp('Starting x value must be lower then, ending x value')
        Start = input('What value of x do you want the graph to start at?');
        End   = input('What value of x would you like the graph to end at?');
    end
    % While, 'Start' is greater then 'End', then the user will be told
    % 'Start' must be smaller then 'End', and will be requested to input
    % 'Start' and 'End'
    
    while (End-Start)< Step
        disp('The size of the steps plotted must be less than the difference between the starting x value and ending y value');
        Step = input('How big do you want the steps to be');
    end
    % While difference between 'Start' and 'End' is smaller then 'Step',
    % then the user will be told it has to be bigger, and is asked to input
    % a valid 'Step' value
    while Step<=0
        disp('The Step value cannot be negative or 0, please enter a valid number')
        Step = input('How big do you want the steps to be');
    end
    % While Step is equal to or less than 0, the user will be told it must be greater then 0
    % and the user is asked to input valid number   
    while ((End<=x1)||(x1<= Start))
        disp(['Root of quadratic -(',num2str(x1),',0) does not fit inbetween Starting x and ending x values, please enter values so it does'])
        Start = input('What value of x do you want the graph to start at?');
        End   = input('What value of x would you like the graph to end at?');
    end
    % While the 'End' is less than equal x1 and 'Start' is is bigger than or
    % equal to x1, then the user is told the root doesn't fit on the graph
    % and to enter valid 'Start' and 'End' values
    % num2str(x1) converts the variable 'x1' into a string to dislay to
    % the user
    while ((End<= x2)||(x2 <= Start))
        Disp(['Root of quadratic -(', num2str(x2),',0) does not fit inbetween Starting x and ending x values, please enter values so it does'])
        Start = input('What value of x do you want the graph to start at?');
        End   = input('What value of x would you like the graph to end at?');
    end
    % While the 'End' is less than equal x2 and 'Start' is is bigger than or
    % equal to x1, then the user is told the root doesn't fit on the graph
    % and to enter valid 'Start' and 'End' values
    % num2str(x2) converts the variable 'x2' into a string to dislay to
    % the user
Grid = input('Would you like a grid on the graph? Type 1 for yes and 0 for no');
     % Asks user if they would like a grid on their graph or not, and stores it as
     % variable- 'Grid'
     
    x = Start :Step: End;
       % Uses the 'Start','Step' and 'End' Variables the user has set, to
       % set the starting, ending and step values for the graph
       y= (a.*x.^2)+ (b.*x)+c;
       %puts 'a', 'b' , and 'c' variables  into the quadratic equation, so it can be used as the
       %equation of the graph
       if QuadraticColour == 1
           plot (x,y,'r')
           % If 'QuadraticColour' is equal 1 (user wants quadratic to be
           % red), the quadratic will be plotted in red
       elseif QuadraticColour == 2
           plot(x,y,'b')
            % If 'QuadraticColour' is equal 2 (user wants quadratic to be
            % blue), the quadratic will be plotted in blue
       elseif QuadraticColour == 3
           plot(x,y,'m')
            % If 'QuadraticColour' is equal 3 (user wants quadratic to be
            % magenta), the quadratic will be plotted in magenta
       else
           plot(x,y,'k') 
           % If 'QuadraticColour' equals anything else then the quadratic will
           % be plotted in black
       
       end
      
       
       hold on
       % Holds on so more can be plotted
       plot(x1,0,'kp')
       % Plots 1st root as a black pentagram point
       plot(x2,0,'kp')
       % Plots 2nd root as a black pentagram point
       plot(Mx,My,'ro')
       % Plots the Minimum/Maximum point as a red circle
       if ((Line==1)&&(PlotLine==1))
           title('Graph for Quadratic Equation and Straight Line');
           % If Straightline is plotted then title displayed will be
           % 'Quadratic Equation and Straight Line'
       elseif (Line~=1||PlotLine~=1)
           title(['Graph of y =' ,num2str(a),'x^2 +',num2str(b),'x +',num2str(c),''])
           % If Striaght line isn't plotted then the title should be the equation of 
           % quadratic
       else
       end
       xlabel('X-axis');
       %gives a label to the x-axis
       ylabel('Y-axis');
       %gives a label to the y-axis
       hold on
      if Line==1 
          % If Line=1 then the following code is excuted
          if PlotLine==1 
              % If LineP=1 then the following code is excuted
          y=((M.*x.^1)+C); 
          % Places M and C values into y=mx+c to get equation of the line
          if LineColour == 1 
              plot(x,y,'r') 
              %if LineColour=1 (user requested red) then the colour of the line will be displayed as red
          elseif LineColour==2
              plot(x,y,'b') 
              % If LineColour=2 (user requested blue) then the colour of the line will be displayed as blue
          elseif LineColour==3
              plot(x,y,'m') 
              % If LineColour=3 (user requested magenta) then the colour of the line will be displayed as magenta
          else
              plot(x,y,'k') 
              % If LineColour equalled anything else then by default the line wuld be plotted as black
          end
          plot(IX1,IY1,'co') 
          % Plots the first set of intersecting points as cyan circles
          plot(IX2,IY2,'co') 
          % Plots the second set of intersecting points as cyan circles
          else
          end
       %---------------------------------------------------------------------------------
       % The below code is essentially the same for if and elseif, only
       % difference being when a<0 it is recogonised that the min/max point is
       % a maximum, and when a>0 it minimum.
       % Below code displays a box on the graph, granted the straight line
       % graph is plotted too, it labels the curve/line with the equation of
       % it, it also indicates which points are min/max, intersection and
       % roots of quadratic.The below code is essentially the same for if and elseif, only
       % difference being when a<0 it is recogonised that the min/max point
       % is. I couldn't find a way of making the code for this part more
       % efficient
       %----------------------------------------------------------------------------------
          if a<0  
              legend(['y=',num2str(a),'x^2',num2str(b),'x',num2str(c),],...
              ['Root 1 of y=' ,num2str(a),'x^2 +',num2str(b),'x +',num2str(c),' ~ (',num2str(x1),',0)'],...
              ['Root 2 of y=' ,num2str(a),'x^2 +',num2str(b),'x +',num2str(c),' ~ (',num2str(x2),',0)'],...
              ['Maximum point of y=' ,num2str(a),'x^2 +',num2str(b),'x +',num2str(c),' ~(',num2str(Mx),',',num2str(My),')'],...
              ['y=',num2str(M),'x +',num2str(C),],...
              ['Interection point 1 ~ (',num2str(IX1),',',num2str(IY2),')'],['Intersection point 2 ~ (',num2str(IX2),',',num2str(IY2),')',],'Location','northeastoutside')
          elseif a>0
              legend(['y=',num2str(a),'x^2',num2str(b),'x',num2str(c),],...
              ['Root 1 of y=' ,num2str(a),'x^2 +',num2str(b),'x +',num2str(c),' ~ (',num2str(x1),',0)'],...
              ['Root 2 of y=' ,num2str(a),'x^2 +',num2str(b),'x +',num2str(c),' ~ (',num2str(x2),',0)'],...
              ['Minimum point of y=' ,num2str(a),'x^2 +',num2str(b),'x +',num2str(c),' ~(',num2str(Mx),',',num2str(My),')'],...
              ['y=',num2str(M),'x +',num2str(C),],...
              ['Interection point 1 ~ (',num2str(IX1),',',num2str(IY2),')'],['Intersection point 2 ~ (',num2str(IX2),',',num2str(IY2),')'],'Location','northeastoutside')
          
          else
          end
      else
      end
    if Grid == 1
       grid on
       % Puts grid on graph if variable-'Grid' equals 1 (so the user
       % requested it it), else it doesn't display a grid
    else
    end
    else 
end
    else
end




