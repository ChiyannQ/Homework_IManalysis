

%Name: Ziyang Qiu
%faculty: medical faculty,Mannheim
%discipline: Biomedical Engineering
%student number: 3565830

%read
filename = 'CT-MONO2-16-ankle.dcm'


Img = dicomread(filename);

%extract
metadata = dicominfo(filename);


fieldnames(metadata); %show all the fieldnames

%display info
%metadata.fieldname 
modality = metadata.Modality
rows = metadata.Rows
columns = metadata.Columns
BitsAllocated = metadata.BitsAllocated
RescaleIntercept = metadata.RescaleIntercept
RescaleSlope = metadata.RescaleSlope

%save gray image in 8bitPNG file


Img = uint16(Img);
max(max(Img))
min(min(Img))
Img = imadjust(Img,[32/65536 4080/65536],[0 255/65536],1);

imwrite(Img,'Imgb.png','BitDepth',8)
