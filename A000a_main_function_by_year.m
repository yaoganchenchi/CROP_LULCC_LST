function A000a_main_function_by_year()

%% data processing
A001_lc_analysis_c61()

A002_get_cropland_fraction()

A003_get_cropland_adjacent()

A004_get_dominant_surrounding_biome()

for iyear = 2001:2023
    A005_prepare_TRM_inputs_yearly_diurnal_MODIS_ERA(iyear)
    A006_prepare_TRM_inputs_yearly_diurnal_MODIS_ERA_adj(iyear)
    A007_Get_TRM_outputs_diurnal(iyear)   
end

end

