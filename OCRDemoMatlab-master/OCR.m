function str=OCR(imagen)
% OCR (Optical Character Recognition).
warning off %#ok<WNOFF>
close all
% READ THE IMAGE
%imagen=imread('sentence.bmp');

% SHOW IMAGE
imagen1 = imagen;
figure,imshow(imagen1);
title('INPUT IMAGE WITH NOISE')
% Convert to gray scale
%if size(imagen,3)==3 %RGB image
%    imagen=rgb2gray(imagen);
%end

% CONVERT THE IMAGE TO GRAYSCALE FOR EASIER READING
threshold = graythresh(imagen);
imagen =~im2bw(imagen,threshold);
imagen2 = imagen;
figure,imshow(imagen2);
word=[ ];
str=string(100);
i=1;
re=imagen;



fid = fopen('text.txt', 'wt');  %OPEN TEXT FILE FOR THE OUTPUT
load templates                  %LOAD THE TEMPLATES OF THE LETTERS
global templates
num_letras=size(templates,2);   %Compute the number of letters in template file
while 1
    %'lines_crop':SPLITS THE WHOLE PIC INTO LINES
    [fl re]=lines_crop(re);     %fl= first line, re= remaining image
    imgn=fl;
    n=0;
%     figure,imshow(fl);pause(0.5)%SHOWS EACH LINE
    spacevector = [];           %TOTAL NMBER OF SPACES   
    rc = fl;              
    
    while 1
        %'letter_crop' SEPARATES EACH LETTER FROM THE IMAGE
       [fc rc space]=letter_crop(rc);  %fc =  first letter in the line
                                       %rc =  remaining cropped line
                                       %space = space between the letter
                                       %   cropped and the next letter
      
       %figure,imshow(fc);pause(0.5)   %SHOW LETTERS ONE BY ONE
       img_r = imresize(fc,[42 24]);   %RESIZE FOR CORRELATION
       n = n + 1;
       spacevector(n)=space;
       
       %'read_letter' CORRELATION IS DONE TO FIND THE CORRECT LETTER
       %given in the folder 'letters_numbers'
       letter = read_letter(img_r,num_letras);
       word = [word letter];            %LETTER CONCATENATION
       
       if isempty(rc)  %breaks loop when there are no more characters
           break;
        end
    end
         
    max_space = max(spacevector);
    no_spaces = 0;                      %NUMBER OF SPACES
    
     for x= 1:n                         %LOOP TO FIND SPACES BETWEEN CHARACTERS
       if spacevector(x+no_spaces)> (0.75 * max_space)
          no_spaces = no_spaces + 1;
            for m = x:n
              word(n+x-m+no_spaces)=word(n+x-m+no_spaces-1);
            end
           word(x+no_spaces) = ' ';
           spacevector = [0 spacevector];
       end
     end
   
    fprintf(fid,'%s\n',word);       %WRITE WORD READ INTO TEXT FILE
    str(i)=word;
    i=i+1;
    word=[ ];
    %BREAK LOOP WHEN SENTENCE ENDS
    if isempty(re)  %See variable 're' in Fcn 'lines'
        break
    end                             
end
fclose(fid);
% winopen('text.txt')                 %OPEN THE TEXT FILE TO DISPLAY
end