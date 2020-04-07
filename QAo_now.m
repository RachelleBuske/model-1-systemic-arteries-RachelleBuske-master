% Overview: Creates flow function for aortic flow as a function of time. 

function Q=QAo_now(t) % create function
%filename: QAo_now.m
global T TS TMAX QMAX; % define global variables
tc=rem(t,T); % tc=time elapsed since the beginning of the current cycle
             %rem(t,T) is the remainder when t is divided by T
if(tc<TS) % time before end of systole
  %SYSTOLE:
  if(tc<TMAX) %BEFORE TIME OF MAXIMUM FLOW:
    Q=QMAX*tc/TMAX;  % Before max flow, flow (L/min) is equal to max flow through 
                     % aortic valve (liters/minute) multiplied by time 
                     % (minutes) and divided by time at which flow is max (minutes)
  else
    %AFTER TIME OF PEAK FLOW:
    Q=QMAX*(TS-tc)/(TS-TMAX);  % After max flow, flow (L/min) is equal to max flow through 
                               % aortic valve (liters/minute) multiplied by the time duration 
                               % of systole minus the elapsed time (minutes) and divided by 
                               % time at which flow is max (minutes)                   
  end
else
  %DIASTOLE:
  Q=0; % flow in diastole is zero
end % terminates the loop
