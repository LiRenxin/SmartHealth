  clc
  clear all
  close all
fid = fopen('1520309088000.dat','rb');
d = fread(fid,inf,'short');
fclose(fid);
plot(d(1000:4000),'r');
fmaxd=5;%��ֹƵ��Ϊ5Hz
fs=250;%������250
fmaxn=fmaxd/(fs/2);
[b,a]=butter(1,fmaxn,'low');
dd=filtfilt(b,a,d);%ͨ��5Hz��ͨ�˲������ź�
cc=d-dd;          %ȥ����һ���źţ��õ�ȥ����Ư�Ƶ��ź�
%��ͼ

figure;plot(cc(1000:4000),'r');