clc
clear all
[file,path] = uigetfile({'*.bmp;*.png'},...
                          'Select Image File To send');
if isequal(file,0)
   disp('User selected Cancel')
else
    imagen=imread(file);
    %imagen = imflatfield(imagen,30);
    imagen=imsharpen(imagen);
    unstr=OCR(imagen);
    str=lower(unstr);
    pause(1);
    
        for i=1:length(str)
        disp(str(i));
        arduino=serial('COM4','BaudRate',9600); % create serial communication object 
        fopen(arduino); % initiate arduino communication
        pause(0.5);
        text=input('Converted.. transmiting now...? Enter k ','s');
        text=str(i);
        fprintf(arduino,'%s\n',text,'sync'); % send answer variable content to arduino
        text2=input('Received? Enter k ','s');
        pause(0.5);
        fclose(arduino);
        end
end

