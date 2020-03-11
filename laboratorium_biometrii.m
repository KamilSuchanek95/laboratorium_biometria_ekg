%% Tworzenie struktur danych z zaimportowanych .csv
% os2.filt_1 = filt_1;
% os2.filt_2 = filt_2;
% os2.raw_1 = raw_1;
% os2.raw_2 = raw_2;
clc; clear; close all;
load('dane_laboratorium_biometria.mat');
dct_len = 200;
%% Wstêpne przetwarzanie sygna³u. 
%(dla tych danych zosta³o wykonane 
%=> pole os1.raw_1 to surowy a os1.filt_1 to przefiltrowany)
dt = 0.002; Fs = 1/dt;
% figure(); % rysowanie, mo¿na pomin¹æ
% subplot(211);plot(os1.raw_1);hold on;plot(os1.filt_1);
% subplot(212);plot(os1.raw_2);hold on;plot(os1.filt_2);
%% Wyznaczenie wspó³czynników autokorelacji dla ka¿dej ramki.
frame_length = Fs * 5; 
% 5 sekund, czyli 5s * 500/sek

ramki = {}; % tutaj bêd¹ ramki, czyli pociachany sygna³, 
%1 wiersz jeden sygna³, 2 wiersz drugi.
for i = 1:length(os1.filt_1)/frame_length
    ramki{1, i} = os2.filt_1((i-1)*frame_length+1:i*frame_length);
    ramki{2, i} = os2.filt_2((i-1)*frame_length+1:i*frame_length);
end

%% ...
% korelacja i dct
kor = {};
kor{1,1} = xcorr(ramki{1,1});%wspó³czynniki
kor{1,1} = kor{1,1}((length(kor{1,1})+1)/2:end);%uciêcie wspó³czynników dla ujemnych translacji
kor{1,2} = xcorr(ramki{1,2});
kor{1,2} = kor{1,2}((length(kor{1,2})+1)/2:end);
kor{1,3} = xcorr(ramki{1,3});
kor{1,3} = kor{1,3}((length(kor{1,3})+1)/2:end);
kor{1,4} = xcorr(ramki{1,4});
kor{1,4} = kor{1,4}((length(kor{1,4})+1)/2:end);

kor{2,1} = xcorr(ramki{2,1});
kor{2,1} = kor{2,1}((length(kor{2,1})+1)/2:end);
kor{2,2} = xcorr(ramki{2,2});
kor{2,2} = kor{2,2}((length(kor{2,2})+1)/2:end);
kor{2,3} = xcorr(ramki{2,3});
kor{2,3} = kor{2,3}((length(kor{2,3})+1)/2:end);
kor{2,4} = xcorr(ramki{2,4});
kor{2,4} = kor{2,4}((length(kor{2,4})+1)/2:end);

kos = {};
kos{1,1} = dct(kor{1,1}, dct_len);% 100, poniewa¿, dalej nie ma nic ciekawego. 
kos{1,2} = dct(kor{1,2}, dct_len);% mo¿na to zobaczyæ poprzez => plot(kos{1,1));
kos{1,3} = dct(kor{1,3}, dct_len);
kos{1,4} = dct(kor{1,4}, dct_len);

kos{2,1} = dct(kor{2,1}, dct_len);
kos{2,2} = dct(kor{2,2}, dct_len);
kos{2,3} = dct(kor{2,3}, dct_len);
kos{2,4} = dct(kor{2,4}, dct_len);

vectors2 = {kos{1,1},kos{1,2},kos{1,3},kos{1,4},kos{2,1},kos{2,2},kos{2,3},kos{2,4}};

ramki = {}; % tutaj bêd¹ ramki, czyli pociachany sygna³, 
%1 wiersz jeden sygna³, 2 wiersz drugi.
for i = 1:length(os1.filt_1)/frame_length
    ramki{1, i} = os1.filt_1((i-1)*frame_length+1:i*frame_length);
    ramki{2, i} = os1.filt_2((i-1)*frame_length+1:i*frame_length);
end

%% ...
% korelacja i dct
kor = {};
kor{1,1} = xcorr(ramki{1,1});%wspó³czynniki
kor{1,1} = kor{1,1}((length(kor{1,1})+1)/2:end);%uciêcie wspó³czynników dla ujemnych translacji
kor{1,2} = xcorr(ramki{1,2});
kor{1,2} = kor{1,2}((length(kor{1,2})+1)/2:end);
kor{1,3} = xcorr(ramki{1,3});
kor{1,3} = kor{1,3}((length(kor{1,3})+1)/2:end);
kor{1,4} = xcorr(ramki{1,4});
kor{1,4} = kor{1,4}((length(kor{1,4})+1)/2:end);

kor{2,1} = xcorr(ramki{2,1});
kor{2,1} = kor{2,1}((length(kor{2,1})+1)/2:end);
kor{2,2} = xcorr(ramki{2,2});
kor{2,2} = kor{2,2}((length(kor{2,2})+1)/2:end);
kor{2,3} = xcorr(ramki{2,3});
kor{2,3} = kor{2,3}((length(kor{2,3})+1)/2:end);
kor{2,4} = xcorr(ramki{2,4});
kor{2,4} = kor{2,4}((length(kor{2,4})+1)/2:end);

kos = {};
kos{1,1} = dct(kor{1,1}, dct_len);% 100, poniewa¿, dalej nie ma nic ciekawego. 
kos{1,2} = dct(kor{1,2}, dct_len);% mo¿na to zobaczyæ poprzez => plot(kos{1,1));
kos{1,3} = dct(kor{1,3}, dct_len);
kos{1,4} = dct(kor{1,4}, dct_len);

kos{2,1} = dct(kor{2,1}, dct_len);
kos{2,2} = dct(kor{2,2}, dct_len);
kos{2,3} = dct(kor{2,3}, dct_len);
kos{2,4} = dct(kor{2,4}, dct_len);

vectors1 = {kos{1,1},kos{1,2},kos{1,3},kos{1,4},kos{2,1},kos{2,2},kos{2,3},kos{2,4}};
%% Identyfikacja otrzymanych wyników

eu = [];
vectors = [vectors1, vectors2];
for i = 1:16
    for k = 1:16
        eu(i, k) = norm(vectors{i}-vectors{k});
    end
end
figure();
imagesc(eu)
colorbar
%%
means = [mean(mean(eu(1:8,1:8))), mean(mean(eu(1:8,9:16)))
         mean(mean(eu(9:16,1:8))),mean(mean(eu(9:16,9:16)))]
figure();
imagesc(means)
colorbar

