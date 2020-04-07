% Overview: This file creates a new function for the pressure of systemic artery as a function of the old and aortic flow. 

function Psa=Psa_new(Psa_old,QAo) %creates function
%filename:   Psa_new.m
global Rs Csa dt; %define global variables
Psa=(Psa_old+dt*QAo/Csa)/(1+dt/(Rs*Csa)); %define the equation for the function
