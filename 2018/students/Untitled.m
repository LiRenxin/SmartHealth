 close all

 fid = fopen('1520309088000.dat','r');
 d = fread(fid,Inf,'short');
 fclose(fid);
 %plot(d(1000:4000));
 fmaxd = 5;%��ֹƵ��Ϊ5Hz
 fs = 250;%������250
 fmaxn = fmaxd/(fs/2);
 [b,a] = butter(1,fmaxn,'low');
 [e,f] = butter(1,20/(250/2),'low');
 y = filter(b,a,d);%ͨ��5Hz��ͨ�˲������ź�
 y2 = d-y;%���ȥ����Ư�Ƶ��ź�

 subplot(211),plot(d(1000:4000),'b');
 xlabel('��ʼ�ź�')
 subplot(212),plot(y2(1000:4000),'b');
 xlabel('�˵�����Ư�Ƶ��ź�')

