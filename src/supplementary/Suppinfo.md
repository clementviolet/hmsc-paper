# Appendix A

![Map of the sampled sites. Sites retained in the train set are colored in blue, sites retained in the test set are colored in red.](figures/supplementary/fig_supp1.png){#fig:supp1}

![Explanatory and predictive power of the benchmark model for occurrence data. The performances are measured as AUC values.](figures/supplementary/fig_supp2.png){#fig:supp2}

![Explanatory power (A.) and predictive power (B.) of the benchmark model for abundance data. Each dot is a species predicted for one observational unit. The y-axis represents the number of individuals observed for each species in each observational unit. The x-axis shows the number of individuals predicted by the model for each observational unit. The dotted line represents the theoretical line of perfect fit of the model to the data.](figures/supplementary/fig_supp3.png){#fig:supp3}

![Comparison of the explanatory (left column) and predictive (right column) capacities of different model architectures fitted with occurrence (top line) or abundance (bottom line) data.](figures/supplementary/fig_supp4.png){#fig:supp4}

![Fuzzy PCA of the traits data. The first three axes explained 58.55% of the total variance.](figures/supplementary/fig_supp5.png){#fig:supp5}

![Effect of traits on the estimated species responses to environmental variables.](figures/supplementary/fig_supp6.png){#fig:supp6}

![Comparison of the partitioning of the variance explained for each species by each model fitted on occurrence or abundance data. Species are ordered by decreasing order of variance explained by the environment for the benchmark model.](figures/supplementary/fig_supp7.png){#fig:supp7}

![Partitioning of the total beta diversity into nestedness and turnover. The total beta diveristy and its partitioning were computed between the predict commuity and the observed one on the train set (left column) and on the test set (right column) on abundance data.](figures/supplementary/fig_supp8.png){#fig:supp8}

![Partitioning of the total beta diversity into nestedness and turnover. The total beta diveristy and its partitioning were computed between the predict commuity and the observed one on the train set (left column) and on the test set (right column) on occurence data.](figures/supplementary/fig_supp9.png){#fig:supp9}

![Proportion of response curves according to the nomenclature defined by @Rigal_2020 for different model architectures. All models have been fitted with occurence data. Each response is characterised by a shape and an intensity.](figures/supplementary/fig_supp10.png){#fig:supp10}

![Comparison of residual correlations estimated by Whole Community Model and Benchmark model for the three random effect, the two models were fitted with occurence data. The two models were fitted with occurence data. The top line represent the distriubtion of these residual correlation and the points are colored by the density of observation. The bottom line indicates the distribution of the index mesuring the change of sign and magnitude between residual correlations estimated by the Whole community model and the Benchmark model adjusted with occurence data.](figures/supplementary/fig_supp11.png){#fig:supp11}

# Appendix B

## MCMC convergence diagnostic

### Environmental coefficients

![Density curve of potential scale reduction factors (PSRF; left panel) and effective sample sizes (ESS; right panel) for Beta parameters (i.e environmental coefficients) estimated for the benchmark model fitted with abundance data. For PSRF, values greater than 1.2 indicates that the Markov chains did not converge for the estimation of this particular parameter. ESS estimates the number of independant sample for each parameter (higher is better).](figures/supplementary/fig_supp_conv_beta_PolychaetaAB.png){#fig:bench_ab_beta}

![Density curve of potential scale reduction factors (PSRF; left panel) and effective sample sizes (ESS; right panel) for Beta parameters (i.e environmental coefficients) estimated for the benchmark model fitted with occurence data. For PSRF, values greater than 1.2 indicates that the Markov chains did not converge for the estimation of this particular parameter. ESS estimates the number of independant sample for each parameter (higher is better).](figures/supplementary/fig_supp_conv_beta_PolychaetaPA.png){#fig:bench_pa_beta}

![Density curve of potential scale reduction factors (PSRF; left panel) and effective sample sizes (ESS; right panel) for Beta parameters (i.e environmental coefficients) estimated for the phylogeny model fitted with abundance data. For PSRF, values greater than 1.2 indicates that the Markov chains did not converge for the estimation of this particular parameter. ESS estimates the number of independant sample for each parameter (higher is better).](figures/supplementary/fig_supp_conv_beta_PolychaetaPhylogenyAB.png){#fig:phylo_ab_beta}

![Density curve of potential scale reduction factors (PSRF; left panel) and effective sample sizes (ESS; right panel) for Beta parameters (i.e environmental coefficients) estimated for the phylogeny model fitted with occurence data. For PSRF, values greater than 1.2 indicates that the Markov chains did not converge for the estimation of this particular parameter. ESS estimates the number of independant sample for each parameter (higher is better).](figures/supplementary/fig_supp_conv_beta_PolychaetaPhylogenyPA.png){#fig:phylo_pa_beta}

![Density curve of potential scale reduction factors (PSRF; left panel) and effective sample sizes (ESS; right panel) for Beta parameters (i.e environmental coefficients) estimated for the traits and phylogeny model model fitted with abundance data. For PSRF, values greater than 1.2 indicates that the Markov chains did not converge for the estimation of this particular parameter. ESS estimates the number of independant sample for each parameter (higher is better).](figures/supplementary/fig_supp_conv_beta_PolychaetaPhylogenyTraitsAB.png){#fig:phylo_traits_ab_beta}

![Density curve of potential scale reduction factors (PSRF; left panel) and effective sample sizes (ESS; right panel) for Beta parameters (i.e environmental coefficients) estimated for the traits and phylogeny model model fitted with occurence data. For PSRF, values greater than 1.2 indicates that the Markov chains did not converge for the estimation of this particular parameter. ESS estimates the number of independant sample for each parameter (higher is better).](figures/supplementary/fig_supp_conv_beta_PolychaetaPhylogenyTraitsPA.png){#fig:phylo_traits_pa_beta}

![Density curve of potential scale reduction factors (PSRF; left panel) and effective sample sizes (ESS; right panel) for Beta parameters (i.e environmental coefficients) estimated for the  whole community model model fitted with abundance data. For PSRF, values greater than 1.2 indicates that the Markov chains did not converge for the estimation of this particular parameter. ESS estimates the number of independant sample for each parameter (higher is better).](figures/supplementary/fig_supp_conv_beta_WholecommunityAB.png){#fig:whole_comm_ab_beta}

![Density curve of potential scale reduction factors (PSRF; left panel) and effective sample sizes (ESS; right panel) for Beta parameters (i.e environmental coefficients) estimated for the whole community model model fitted with occurence data. For PSRF, values greater than 1.2 indicates that the Markov chains did not converge for the estimation of this particular parameter. ESS estimates the number of independant sample for each parameter (higher is better).](figures/supplementary/fig_supp_conv_beta_WholecommunityPA.png){#fig:whole_comm_pa_beta}

### Traits coefficients

![Density curve of potential scale reduction factors (PSRF; left panel) and effective sample sizes (ESS; right panel) for Gamma parameters (i.e trait coefficients) estimated for the  whole community model model fitted with abundance data. For PSRF, values greater than 1.2 indicates that the Markov chains did not converge for the estimation of this particular parameter. ESS estimates the number of independant sample for each parameter (higher is better).](figures/supplementary/fig_supp_conv_gamma_PolychaetaPhylogenyTraitsAB.png){#fig:phylo_traits_ab_gamma}

![Density curve of potential scale reduction factors (PSRF; left panel) and effective sample sizes (ESS; right panel) for Gamma parameters (i.e trait coefficients) estimated for the  whole community model model fitted with abundance data. For PSRF, values greater than 1.2 indicates that the Markov chains did not converge for the estimation of this particular parameter. ESS estimates the number of independant sample for each parameter (higher is better).](figures/supplementary/fig_supp_conv_gamma_PolychaetaPhylogenyTraitsPA.png){#fig:phylo_traits_pa_gamma}

### Phylogeny coefficients

|Model                                   |Parameter |     PSRF|        ESS|
|:--------------------------------------:|:---------|--------:|----------:|
|Polychaeta Phylogeny - Abundance        |rho       | 2.430117|   649.9631|
|Polychaeta Phylogeny - Occurence        |rho       | 1.002695|  9349.1979|
|Polychaeta Phylogeny Traits - Abundance |rho       | 1.669545|   757.1940|
|Polychaeta Phylogeny Traits - Occurence |rho       | 1.002523| 11290.5930|

Table: Potential scale reduction factors (PSRF; left panel) and effective sample sizes (ESS; right panel) for rho parameters (i.e phylogeny coefficients) estimated for the models including phylogeny data. For PSRF, values greater than 1.2 indicates that the Markov chains did not converge for the estimation of this particular parameter. ESS estimates the number of independant sample for each parameter (higher is better). {#tbl:rho_convergence}

# References