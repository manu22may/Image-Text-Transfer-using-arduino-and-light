# Image-Text-Transfer-using-arduino-and-light

## WORKING
1) We take an image with text as input.
2) We process the image and convert into readable text format.
3) This text is transferred from source to destination in the form of Morse code with the help of a laser.
4) The light  falls on to the receiver where it gets decoded and the message is displayed. 


## IMAGE TO TEXT
  The process of converting an image to an editable document is divided into several steps. Every step is a set of related algorithms that do a piece of the OCR job. The general steps in the OCR process are as follows:

# 1.Loading an image as bitmap from a given source. The source can be a file or a pointer to a memory block. Moreover, a good OCR system must understand a lot of image formats: BMP, TIFF, JPEG, PNG, and so on. It must also support PDF files, because many documents are stored as images in the PDF format, and the only way to extract text from such files is to perform OCR.
# 2.  Detecting the most important image features, such as resolution and inversion. Many OCR algorithms expect a predefined range of font sizes and foreground/background colours, so the image must be rescaled and inverted before processing if necessary.
# 3.  Many OCR algorithms can handle bi-tonal images only, so colour or grayscale images must be converted to bi-tonal. The process is called "binarization." This step is very important, because incorrect binarization will cause a lot of problems.

