# flight-meltdown-prediction
Based on Monte Carlo method

Structure:
  main
    meltdown
  unique_analyze
  
 Description:
   main:
   Based on Monte Carlo method, calling <meltdown>, collect and calculate the take off porb of each flight, drawing.
   
   meltdown:
   assign certain meltdown prob to each flight, generate several meltdown round according to the CAAC meltdown rules. assemble the time series.
   First 3 flights are assigned maunally.
  
   unique_analyze:
   analyze all possible combinations of successful taking off for certain flight.
