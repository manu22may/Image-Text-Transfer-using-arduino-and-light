clc
clear all
close all

[file,path] = uigetfile({'*.bmp;*.png'});
if isequal(file,0)
   disp('User selected Cancel')
else
    imagen=imread(file);
%     imagen = imflatfield(imagen,30);
%     imagen=imsharpen(imagen);
    unstr=OCR(imagen);
    str=lower(unstr);
    
%     pause(1);

%     %SPEAK OUT TEXT
    for i=1:length(str)
            disp(str(i));
%         Speak(obj,str(i));
%         pause(0.5);
    end
 end

