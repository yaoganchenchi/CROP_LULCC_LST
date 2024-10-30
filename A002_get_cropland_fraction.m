function A002_get_cropland_fraction()

%% this script is to get landsat 30 m cropland fraction
root_dir = '/projectsp/f_cc2127_1/chenchi/LCLUC-crop/';
addpath(sprintf('%scode/matlab_tools/',root_dir));

%% read cropland fraction

fn = '/projectsp/f_cc2127_1/chenchi/Data_Archive/cropland_fraction/';
save_dir = sprintf('%sdata/',root_dir);
if ~(exist(save_dir,'dir') ==7)
    mkdir(save_dir);
end

icount=0;
for iyear = [2003,2007,2011,2015,2019]
    icount=icount+1;
    data_fn = sprintf('%sGlobal_cropland_3km_%04d.tif',fn,iyear);
    [data,R1] = readgeoraster(data_fn);
    data = double(data);
    [data2,RB] = georesize(data,R1,0.5,'bilinear');
    output=zeros(3600,7200);
    output(401:3000,201:7200) = data2;
    
    save_name = sprintf('%sGlobal_cropland_3km_%04d.mat',save_dir,iyear);
    save(save_name,'output','-v7.3')
end

end





