# Appendix A

![Map of the sampled sites. Point shapes vary according to their contribution to model training set (circles ; used to evaluate model explanatory power) as opposed to the two sites retained for independent model testing (triangles ; used to evaluate model predictive power). Point colors vary according to the presence or absence of the two habitats in each site. The two test sites include the two habitats (i.e. seagrass and bare sand) and were chosen because they occur in environmental conditions that can be considered average at the scale of the region (thereby limiting extrapolation of the model) but still harbour different communities, representative of the known diversity gradient across the region.](figures/supplementary/fig_supp1.png){#fig:supp1}

![Distribution of species-specific AUC estimates that characterise explanatory (predictions Vs train set observations; top panel) and predictive power (prediction versus  test dataset observations; bottom panel) for the benchmark model fitted on presence/absence data.](figures/supplementary/fig_supp2.png){#fig:supp2}

![Explanatory (A) and predictive (B) power of the benchmark model for abundance data. Each dot is a species predicted for one observational unit (i.e. one habitat in one site for a given year). The y-axis represents the number of individuals observed for each species in each observational unit. The x-axis shows the number of individuals predicted by the model for each observational unit. The dotted line represents the theoretical line of perfect fit of the model to the data (1:1).](figures/supplementary/fig_supp3.png){#fig:supp3}

![Comparison of explanatory (left column; Train set) and predictive (right column; Test set) capacities of the different model structures fitted on presence/absence (top panels) or abundance (bottom panels) data](figures/supplementary/fig_supp4.png){#fig:supp4}

![Fuzzy PCA of the species-by-trait matrix. The first three axes represent 58.55% of the total variance. The first axis distinguishes sessile microphagous species (top positive values) from mobile macrophages predatory species (bottom negative values). The second axis is a gradient of reproductive strategies (semelparous Vs. iteroparous). The third axis distinguishes burrowers with direct development from tube-dwellers with planktonic development. For abbreviations and meaning of the trait modalities, see @Boye_2019a.](figures/supplementary/fig_supp5.png){#fig:supp5}

![Relationship between species' position along the first axis of the fuzzy PCA (sessile microphagous-mobile macrophagous gradient) and the different environmental variables used in the models (fitted with abundance data in the left panel, and with presence/absence data in the right panel). Relationships are derived  from the regression coefficients estimated for the PhTr model (γ coefficients in HMSC; @Ovaskainen_2020).The lines are fitted loess/gam representing the average response across the different species. As an example of interpretation, the red lines in both graphs indicate that sessile microphagous species are more negatively influenced (lower abundance, low probability for presence) by fetch than macrophagous mobile species.](figures/supplementary/fig_supp6.png){#fig:supp6}

![Comparison across alternative models of explained variance partitioning for each species (along the x-axis) attributed to all environmental variables (Environment) or to the three random effects (Random) for the models fitted with abundance (left) and presence/absence (right) data. Species are ordered by decreasing order of variance explained by the environment for the benchmark model.](figures/supplementary/fig_supp7.png){#fig:supp7}

![Partitioning of the total pairwise beta diversity between predicted and observed assemblages into nestedness and turnover of different model structures (as colour-coded: purple for benchmark (Bench), yellow for phylogeny (Ph), red for traits & phylogeny (TrPh), and green for whole community (WhC) models). Results are presented here for the model fitted on abundance data, but predicted abundances were transformed into presence/absence to derive the Sorensen total beta diversity and its two components (i.e. nestedness and turnover). These indices were computed for both the train set (violet) and the test set (yellow).](figures/supplementary/fig_supp8.png){#fig:supp8}

![Partitioning of the total pairwise beta diversity between predicted and observed communities into nestedness and turnover of different model structures (as colour-coded: purple for benchmark (Bench), yellow for phylogeny (Ph), red for traits & phylogeny (TrPh), and green for whole community (WhC) models). Results are presented here for the model fitted on occurrence data. These indices were computed for both the train set (violet) and the test set (yellow).](figures/supplementary/fig_supp9.png){#fig:supp9}

![Same figure as Fig. 4 in main text for presence/absence models. Number (y-axis) and proportion (indicated above individual bars) of response curves (i.e. one for each species-predictor combination) according to the nomenclature defined by @Rigal_2020 for different abundance model structures. See Fig. S10 for a similar representation for presence-absence models.](figures/supplementary/fig_supp10.png){#fig:supp10}

![Same figure as Fig. 5 in the main  text for presence/absence-based models. (A) Comparison of residual correlations associated with the three random effects estimated by the Whole Community Model (y-axis) and the Benchmark model (x-axis) fitted on abundance data. The colour scale highlights the density of points in each scatter plot. (B) Distribution of the index measuring change in sign (sign change left to the zero line, no change to the right) and magnitude (higher departure from the zero line indicate higher difference) between residual correlations estimated by the whole community model and the benchmark model adjusted with abundance data for the three random effects (Habitat, Site, Year).](figures/supplementary/fig_supp11.png){#fig:supp11}

# Appendix B

## MCMC convergence diagnostic

### Environmental coefficients

![Density curve of potential scale reduction factors (PSRF see @Brooks_1998; left panel) and effective sample sizes (ESS; right panel) for Beta regression parameters (i.e environmental coefficients) estimated for the benchmark model fitted with abundance data. For PSRF, values greater than 1.2 (dotted red line) indicate potential convergence issues. ESS estimates the number of independent samples used to estimate  each parameter (the more the better).](figures/supplementary/fig_supp_conv_beta_PolychaetaAB.png){#fig:bench_ab_beta}

![Density curve of potential scale reduction factors (PSRF see @Brooks_1998; left panel) and effective sample sizes (ESS; right panel) for Beta regression parameters (i.e environmental coefficients) estimated for the benchmark model fitted with presence/absence data. For further details see Fig. S12.](figures/supplementary/fig_supp_conv_beta_PolychaetaPA.png){#fig:bench_pa_beta}

![Density curve of potential scale reduction factors (PSRF see @Brooks_1998; left panel) and effective sample sizes (ESS; right panel) for Beta regression parameters (i.e environmental coefficients) estimated for the phylogeny model fitted with abundance data. For further details see Fig. S12.](figures/supplementary/fig_supp_conv_beta_PolychaetaPhylogenyAB.png){#fig:phylo_ab_beta}

![Density curve of potential scale reduction factors (PSRF see @Brooks_1998; left panel) and effective sample sizes (ESS; right panel) for Beta regression parameters (i.e environmental coefficients) estimated for the phylogeny model fitted with presence/absence data. For further details see Fig. S12.](figures/supplementary/fig_supp_conv_beta_PolychaetaPhylogenyPA.png){#fig:phylo_pa_beta}

![Density curve of potential scale reduction factors (PSRF see @Brooks_1998; left panel) and effective sample sizes (ESS; right panel) for Beta regression parameters (i.e environmental coefficients) estimated for the traits & phylogeny model fitted with abundance data. For further details see Fig. S12.](figures/supplementary/fig_supp_conv_beta_PolychaetaPhylogenyTraitsAB.png){#fig:phylo_traits_ab_beta}

![Density curve of potential scale reduction factors (PSRF see @Brooks_1998; left panel) and effective sample sizes (ESS; right panel) for Beta regression parameters (i.e environmental coefficients) estimated for the traits & phylogeny model fitted with presence/absence data. For further details see Fig. S12.](figures/supplementary/fig_supp_conv_beta_PolychaetaPhylogenyTraitsPA.png){#fig:phylo_traits_pa_beta}

![Density curve of potential scale reduction factors (PSRF see @Brooks_1998; left panel) and effective sample sizes (ESS; right panel) for Beta regression parameters (i.e environmental coefficients) estimated for the whole community model fitted with abundance data. For further details see Fig. S12.](figures/supplementary/fig_supp_conv_beta_WholecommunityAB.png){#fig:whole_comm_ab_beta}

![Density curve of potential scale reduction factors (PSRF see @Brooks_1998; left panel) and effective sample sizes (ESS; right panel) for Beta regression parameters (i.e environmental coefficients) estimated for the whole community model fitted with presence/absence data. For further details see Fig. S12.](figures/supplementary/fig_supp_conv_beta_WholecommunityPA.png){#fig:whole_comm_pa_beta}

### Traits coefficients

![Density curve of potential scale reduction factors (PSRF see @Brooks_1998; left panel) and effective sample sizes (ESS; right panel) for Gamma regression parameters (i.e environmental coefficients) estimated for the traits & phylogeny model fitted with abundance data. For further details see Fig. S12.](figures/supplementary/fig_supp_conv_gamma_PolychaetaPhylogenyTraitsAB.png){#fig:phylo_traits_ab_gamma}

![Density curve of potential scale reduction factors (PSRF see @Brooks_1998; left panel) and effective sample sizes (ESS; right panel) for Gamma regression parameters (i.e environmental coefficients) estimated for the traits & phylogeny model fitted with presence/absence data. For further details see Fig. S12.](figures/supplementary/fig_supp_conv_gamma_PolychaetaPhylogenyTraitsPA.png){#fig:phylo_traits_pa_gamma}

### Phylogeny coefficients

|Model                                        PSRF|        ESS|
|:---------------------------------------:|--------:|----------:|
| Phylogeny model - Abundance             | 2.430117|   649.9631|
| Phylogeny - Presence/Absence            | 1.002695|  9349.1979|
| Traits & Phylogeny - Abundance          | 1.669545|   757.1940|
| Traits & Phylogeny - Presence/Absence   | 1.002523| 11290.5930|

Table: Potential scale reduction factors (PSRF) and effective sample sizes (ESS) for rho regression parameters (i.e phylogeny coefficient) estimated for the models including phylogeny data. For further details see Fig. S12. {#tbl:rho_convergence}

# References