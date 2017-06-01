### Spillover spreading calculation
  # Thomas M. Ashhurst, Adrian L. Smith, Nicholas J.C. King, 2017
  # thomas.ashhurst@sydney.edu.au


### INTRODUCTION
  # This R script applies the spillover spreading equations published in Nguyen et. al.(Cytometry A, 2013).
  # It calculates the spillover-spreading value from a given fluorophore into a non-target detector
  # In this example, we are quantifying the spillover-spreading error from PerCP/Cy5.5 into the BV711 detector (V715_B)


### USER ENTRY
  
  # Definitions
      P <- 'PerCP/Cy5.5' # the fluorescence signal being measured
      C <- 'V715_B' # the non-target detector recieving the spillover/spreading error
      
      S <- 'PerCP/Cy5.5+ comp beads' # the positively 'stained' population
      R <- 'Unstained comp beads' # the negative/unstained 'reference' population

  # Measurment of signal 'P' in detector 'C', measuring the amount of 'spread' from the offending fluorophore into the non-target detector

      # Positive population 'S' 
      SFC_84 <- 1073 # 84th percentile of the positive 'S' population in the C detector
      SFC_50 <- -106 # 50th percentile of the positive 'S' population in the C detector
      
      # Negative/unstained reference population 'R'
      RFC_84 <- -35.6 # 84th percentile of the negative 'R' population in the C detector
      RFC_50 <- -156 # 50th percentile of the negative 'R' population in the C detector
      
  # Measurementof of signal 'P' in it's own detector (P), measuring the brightness of the offending fluorophore

      # Positive population 'S'
      SFP_50 <- 9571 # 50th percentile (median) of the S population in it's own detector (P)
      
      # Negative population 'R'
      RFP_50 <- 6.72 # 50th percentile (median) of the R population in it's own detector (P)

      
### CALCULATION
  
  # Equation 2 -- quantifies the SD of P signal from both positive (S) and negative (R) populations n the non-target detector.
  S_SD_C = SFC_84 - SFC_50 # Equation 2a
  R_SD_C = RFC_84 - RFC_50 # Equation 2b

  # Equation 1 -- calulates the difference between the SD of P signal from both positive (S) and negative (R) populations n the non-target detector.
  Diff_SQRT_C = (sqrt((S_SD_C^2) - (R_SD_C^2)))
  
  # Equation 3 -- measures the brightness of the offending fluorophore (P) in it's own detector (P)
  Diff_F_P = SFP_50 - RFP_50

  # Equation 4 -- normalises the 'spillover-spreading' value from Eq. 1 by the brightness of the offending fluorophore
  SS_P_C = Diff_SQRT_C / (sqrt(Diff_F_P))
  

### FINAL SPILLOVER-SPREADING ERROR VALUE for fluorescence signal'P' spreading into detector C'
  # Spreading of
  P
  # into
  C
  # equals
  SS_P_C


  