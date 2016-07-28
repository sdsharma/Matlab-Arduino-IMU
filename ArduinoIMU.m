clear all
clc
i = 1;
coeff = ones(1, 10)/10;
serialPort = serial('COM3','BaudRate',9600,'terminator', 'LF');
fopen(serialPort);
while true
    x1 = fscanf(serialPort);
    y1 = fscanf(serialPort);
    z1 = fscanf(serialPort);
    x(i) = str2double(x1)/16384;
    y(i) = str2double(y1)/16384;
    z(i) = str2double(z1)/16384;
    gx1 = fscanf(serialPort);
    gy1 = fscanf(serialPort);
    gz1 = fscanf(serialPort);
    gx(i) = str2double(gx1)/256;
    gy(i) = str2double(gy1)/256;
    gz(i) = str2double(gz1)/256;
    subplot(3,2,1);
    plot(filter(coeff,1,x),':.r','linewidth',1.0), axis([0 i -2 2])
    title('Accelerometer X');
    grid on;
    subplot(3,2,3);
    plot(filter(coeff,1,y),':.g','linewidth',1.0), axis([0 i -2 2])
    title('Accelerometer Y');
    grid on;
    subplot(3,2,5);
    plot(filter(coeff,1,z),':.b','linewidth',1.0), axis([0 i -2 2])
    title('Accelerometer Z');
    grid on;
    subplot(3,2,2);
    plot(gx,':.r','linewidth',1.0), axis([0 i -250 250])
    title('Gyro X');
    grid on;
    subplot(3,2,4);
    plot(gy,':.g','linewidth',1.0), axis([0 i -250 250])
    title('Gyro Y');
    grid on;
    subplot(3,2,6);
    plot(gz,':.b','linewidth',1.0), axis([0 i -250 250])
    title('Gyro Z');
    grid on;
    drawnow;
    i = i + 1;
end