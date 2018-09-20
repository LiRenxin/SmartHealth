%%��ȡ�ĵ��ź����� �洢��d��
fid = fopen('1520309088000.dat','rb');%���ĵ��ź��ļ�
d = fread(fid,inf,'short');%��ȡ�ĵ��ź�����
fclose(fid);%�ر�

fs=1000;T=1/fs;
N=length(d);
L=1024;
t=(0:N-1)/fs;
n=0:L-1;
f=(n/L-1/2)*fs;
X=fft(d,L);
%X=fftshift(fft(d,L));

%���IIR�˲����������ָ����з���
wp=160*2/fs;
ws=180*2/fs;
Rp=3;
Rs=15;
[N,wc]=buttord(wp,ws,Rp,Rs);
[b,a]=butter(N,wc);
H=freqz(b,a,f*2*pi/fs);
mag=abs(H);
mag_dB=20*log10((mag+eps)/max(mag));
pha=angle(H);


% �Դ����źŽ����˲�����Ƶ�׷���
x1=filter(b,a,d);
X1=fft(x1,L);
%X1=fftshift(fft(x1,L));

%����ͼ��
figure(1)
subplot(2,2,1);plot(t,d);title('ԭʼ�ĵ�ͼʱ����');%xlabel('t/s');yablel('xt');grid;
subplot(2,2,2);plot(f,abs(X)*2/N);title('ԭʼ�ĵ�ͼ������');%xlabel('f/Hz');yablel('����');grid;
subplot(2,2,3);plot(t,x1);title('�˲����ĵ�ͼʱ����');%xlabel('t/s');yablel('xt');grid;
subplot(2,2,4);plot(f,abs(X1)*2/N);title('�˲����ĵ�ͼ������');%xlabel('f/Hz');yablel('����');grid;

figure(2)
subplot(3,1,1);plot(f,mag);title('�˲���������');%xlabel('f/Hz');ylabel('����');grid;
subplot(3,1,2);plot(f,mag_dB);title('�˲���������(dB)');%xlabel('f/Hz');ylabel('����');grid;
subplot(3,1,3);plot(f,pha);title('�˲�����λ��');%xlabel('f/Hz');ylabel('��λ');grid;
