clc
clear all
close all

fid = fopen('1520309088000.dat','rb');
 d = fread(fid,inf,'short');
 fclose(fid);
 % subplot(211);plot(d);
 % subplot(211);plot(d(1000:4000));
 fmaxd=5;%��ֹƵ��Ϊ5Hz
 fs=250;%������250
 fmaxn=fmaxd/(fs/2);
 [b,a]=butter(1,fmaxn,'low');
 [e,f]=butter(1,20/(250/2),'low');
 dd=filter(b,a,d);%ͨ��5Hz��ͨ�˲������ź�
 cc=d-dd;%ȥ����һ���źţ��õ�ȥ����Ư�Ƶ��ź�
 ddd=filter(e,f,cc);%ȥ��������ĸ�Ƶ�źţ�ʹ����ƽ��
 %��ͼ
 subplot(2,1,1),plot(d(1000:4000),'b');xlabel('ԭʼ�ź�')
 subplot(2,1,2),plot(ddd(1000:4000),'b');xlabel('ȥ������Ư�Ƶ��ź�')