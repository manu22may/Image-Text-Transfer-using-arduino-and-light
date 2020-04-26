clc
clear all
arduino=serial('COM4','BaudRate',9600); % create serial communication object 
fopen(arduino); % initiate arduino communication
pause(1);
text=input('enter','s');
text='aman is the king of the world';
fprintf(arduino,'%s\n',text,'sync'); % send answer variable content to arduino
pause(1);
fclose(arduino);