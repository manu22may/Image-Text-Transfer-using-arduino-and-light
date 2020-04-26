clc
clear all

% TEXT TO SPEECH
NET.addAssembly('System.Speech');
obj = System.Speech.Synthesis.SpeechSynthesizer;
obj.Volume = 100;

Speak(obj,"Optical character recognition.");
pause(0.5);
Speak(obj,"SELECT IMAGE");
[file,path] = uigetfile({'*.bmp;*.png'});
if isequal(file,0)
   disp('User selected Cancel')
else
    imagen=imread(file);
    %imagen = imflatfield(imagen,30);
    imagen=imsharpen(imagen);
    unstr=OCR(imagen);
    str=lower(unstr);
    pause(1);
    

    %SPEAK OUT TEXT
    for i=1:length(str)
        disp(str(i));
        Speak(obj,str(i));
    end
 
end

