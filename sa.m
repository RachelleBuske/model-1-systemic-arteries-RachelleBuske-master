% Overview: Model aortic flow and pressure of Systemic Arteries  

%filename: sa.m
clear all % clear all variables
clf       % and figures
global T TS TMAX QMAX; %define global variables
global Rs Csa dt;
in_sa %initialization
Csa=Csa/2 % decrease systemic compliance
Rs=Rs/2 % decrease systemic resistance
t_arrest = 100;
t_restart = 300;
QAo = ones(1,1500);
for klok=1:klokmax % for loop for duration 1 to max timesteps
  t=klok*dt; % set time step
  if(t_arrest<klok<t_restart)
    QAo(klok) = 0  
    else
       QAo(klok)=QAo_now(t); % define flow in aortic artery with time
  end 
  
  Psa=Psa_new(Psa,QAo); %new Psa overwrites old
  %Store values in arrays for future plotting:
  t_plot(klok)=t;
 % QAo_plot(klok)=QAo;
  %Psa_plot(klok)=Psa;
end
%Now plot results in one figure 
%with QAo(t) in upper frame
% and Psa(t) in lower frame
subplot(2,1,1), plot(t_plot,QAo) % Aortic flow over time
subplot(2,1,2), plot(t_plot,Psa) % pressure of systemic artery over time
title('Blood Pressure')
xlabel('time (minutes)')
ylabel('Pressure of Systemic Artery (mmHg)')
pks = findpeaks(Psa_plot);
mins = findpeaks(-Psa_plot);



