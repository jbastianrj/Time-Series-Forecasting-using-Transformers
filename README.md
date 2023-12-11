# Time-Series-Forecasting-using-Transformers
The use of W-Transformer for the forecasting task of classical time series (stationary, linear and without long-term dependence) and chaotic time series (non-stationary, non-linear in mean and with long-term dependence) is analyzed. In addition to using the haar and db6 wavelets, preprocessing was performed on the series to improve prediction performance (scaling, differencing, additive and multiplicative decomposition). The following results were achieved.

The research and implementation was carried out as a team as a final project of the Deep Learning course at CIMAT Monterrey. Alondra Matos, Nicole Romero and Sebastian Ramirez participated.

The implementation of the W-transformer as it is in the paper (https://arxiv.org/abs/2209.03945) that proposes it can be seen and executed in W_transformer.ipynb, while the examples by adding preprocessing and tests of stationarity and long-term dependence of each series can be found in EXEMPLOS_W_transformer.ipynb. Details of the research, implementation and results can be found in W-transformer.pdf. 
