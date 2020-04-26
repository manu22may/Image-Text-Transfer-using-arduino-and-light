%CREATE TEMPLATES
%Letter
function templates = create_templates()

close all;

% upper case letters
A=imread('characters\A.bmp');B=imread('characters\B.bmp');
C=imread('characters\C.bmp');D=imread('characters\D.bmp');
E=imread('characters\E.bmp');F=imread('characters\F.bmp');
G=imread('characters\G.bmp');H=imread('characters\H.bmp');
I=imread('characters\I.bmp');J=imread('characters\J.bmp');
K=imread('characters\K.bmp');L=imread('characters\L.bmp');
M=imread('characters\M.bmp');N=imread('characters\N.bmp');
O=imread('characters\O.bmp');P=imread('characters\P.bmp');
Q=imread('characters\Q.bmp');R=imread('characters\R.bmp');
S=imread('characters\S.bmp');T=imread('characters\T.bmp');
U=imread('characters\U.bmp');V=imread('characters\V.bmp');
W=imread('characters\W.bmp');X=imread('characters\X.bmp');
Y=imread('characters\Y.bmp');Z=imread('characters\Z.bmp');

%lower case letters
a=imread('characters\a.png');b=imread('characters\b.png');
c=imread('characters\c.png');d=imread('characters\d.png');
e=imread('characters\e.png');f=imread('characters\f.png');
g=imread('characters\g.png');h=imread('characters\h.png');
i=imread('characters\i.png');j=imread('characters\j.png');
k=imread('characters\k.png');l=imread('characters\l.png');
m=imread('characters\m.png');n=imread('characters\n.png');
o=imread('characters\o.png');p=imread('characters\p.png');
q=imread('characters\q.png');r=imread('characters\r.png');
s=imread('characters\s.png');t=imread('characters\t.png');
u=imread('characters\u.png');v=imread('characters\v.png');
w=imread('characters\w.png');x=imread('characters\x.png');
y=imread('characters\y.png');z=imread('characters\z.png');

%Numbers
one=imread('characters\1.bmp');  two=imread('characters\2.bmp');
three=imread('characters\3.bmp');four=imread('characters\4.bmp');
five=imread('characters\5.bmp'); six=imread('characters\6.bmp');
seven=imread('characters\7.bmp');eight=imread('characters\8.bmp');
nine=imread('characters\9.bmp'); zero=imread('characters\0.bmp');

%Special characters
specialDollar = im2bw(imread('characters\special$.png'));
specialHash = im2bw(imread('characters\special#.png'));

% -------------------------------------
letter=[A B C D E F G H I J K L M...
    N O P Q R S T U V W X Y Z];
number=[one two three four five...
    six seven eight nine zero];   
lowercase = [a b c d e f g h i j k ...
     l m n o p q r s t u v w x y z];
specials = [ specialHash specialDollar];
character=[letter number lowercase specials];

% Because image array is of 24X42 pixels
templates=mat2cell(character,42,[24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 24 ...
    24 24 24 24]);

% save the model in a file
save ('templates','templates')

end