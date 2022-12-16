###

# WIDE TO LONG CONVERSION

###

# Read in data in (default) wide format
MainTable = read.csv("mesi_main.csv",header=T)

library(tidyverse)

# Wide to long for columns with separate 'control' and 'treatment' values
MT_by_manipulation = gather(MainTable, "x_c","x_t",key = "manipulation", value = "response_value")
MT_by_sd = gather(MainTable, "sd_c","sd_t",key = "sd", value = "sd_value")
MT_by_se = gather(MainTable, "se_c","se_t",key = "se", value = "se_value")
MT_by_rep = gather(MainTable, "rep_c","rep_t",key = "rep", value = "rep_value")
MT_by_co2 = gather(MainTable, "c_c","c_t",key = "c_manipulation", value = "c_magnitude")
MT_by_n = gather(MainTable, "n_c","n_t",key = "n_manipulation", value = "n_magnitude")
MT_by_p = gather(MainTable, "p_c","p_t",key = "p_manipulation", value = "p_magnitude")
MT_by_k = gather(MainTable, "k_c","k_t",key = "k_manipulation", value = "k_magnitude")
MT_by_i = gather(MainTable, "i_c","i_t",key = "i_manipulation", value = "i_magnitude")
MT_by_s = gather(MainTable, "s_c","s_t",key = "s_manipulation", value = "s_magnitude")

# Create new columns with zero values for 'control' remaining treatment magnitudes, and previous values for manipulated treatments
treatment = c(rep("control",length(MainTable$treatment)),MainTable$treatment)
npk = c(rep("_000",length(MainTable$npk)),MainTable$npk)
w_t1 = c(rep("_0000",length(MainTable$w_t1)),MainTable$w_t1)
d_t = c(rep(0,length(MainTable$d_t)),MainTable$d_t)
d_t2 = c(rep(0,length(MainTable$d_t2)),MainTable$d_t2)
i_t2 = c(rep(0,length(MainTable$i_t2)),MainTable$i_t2)
w_t2 = c(rep(0,length(MainTable$w_t2)),MainTable$w_t2)
w_t3 = c(rep(0,length(MainTable$w_t3)),MainTable$w_t3)

# Make definitive table: remove redundant/now incorrect columns, add correct columns, and remove exact duplicate control rows
MainTable_Long = MT_by_manipulation %>%
  select(-exp,-manipulation,-treatment,-npk,-w_t1,-d_t,-d_t2,-i_t2,-w_t2,-w_t3,
         -c_c,-n_c,-p_c,-k_c,-i_c,-s_c,-c_t,-n_t,-p_t,-k_t,-i_t,-s_t,
         -sd_c,-se_c,-rep_c,-sd_t,-se_t,-rep_t) %>%
  mutate(response_value = MT_by_manipulation$response_value,sd_value = MT_by_sd$sd_value,se_value = MT_by_se$se_value,
         rep_value = MT_by_rep$rep_value,c_magnitude = MT_by_co2$c_magnitude,n_magnitude = MT_by_n$n_magnitude,
         p_magnitude = MT_by_p$p_magnitude,k_magnitude = MT_by_k$k_magnitude,i_magnitude = MT_by_i$i_magnitude,
         s_magnitude = MT_by_s$s_magnitude,
         treatment = treatment,w_t1 = w_t1,d_t = d_t,d_t2 = d_t2,i_t2 = i_t2,w_t2 = w_t2,w_t3 = w_t3) %>%
  distinct(db,	citation,	response,	site,	study,	lat,	lon,	elevation,	mat,	map,	
           ecosystem_type,	vegetation_type,	experiment_type,	community_type,	dominant_species,	
           growth_form,	age,	disturbance_type,	start_year,	duration,	treatment_duration,	
           fumigation_type,	start_treatment,	end_treatment,	sampling_year,	sampling_depth,	
           aggregation_level,	x_units,	sampling_date,	response_value,	sd_value,	
           se_value,	rep_value,	c_magnitude,	n_magnitude,	p_magnitude,	k_magnitude,	
           i_magnitude,	s_magnitude,	treatment,	w_t1,	d_t,	d_t2,	i_t2,	w_t2,	w_t3, .keep_all = TRUE)

# Create csv file with table in long format
write.csv(MainTable_Long,"mesi_main_long.csv")
