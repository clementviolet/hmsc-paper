# Appendix A - Data Sources and Descriptions of the Datasets

![Map of the sampled sites. Point shapes vary according to their contribution to model training set (circles ; used to evaluate model explanatory power) as opposed to the two sites retained for independent model testing (triangles ; used to evaluate model predictive power). Point colours vary according to the presence or absence of the two habitats in each site. The two test sites include the two habitats (i.e. seagrass and bare sand) and were chosen because they occur in environmental conditions that can be considered average at the scale of the region (thereby limiting extrapolation of the model) but still harbour different communities, representative of the known diversity gradient across the region.](figures/supplementary/fig_supp1.png){#fig:supp1}

![Fuzzy PCA of the species-by-trait matrix. The first three axes represent 58.55% of the total variance. The first axis distinguishes sessile microphagous species (top positive values) from mobile macrophagous predatory species (bottom negative values). The second axis is a gradient of reproductive strategies (semelparous vs iteroparous). The third axis distinguishes burrowers with direct development from tube-dwellers with planktonic development. For abbreviations and meaning of the trait modalities, see @Boye_2019a.](figures/supplementary/fig_supp2.png){#fig:supp2}

![A. Distribution of the number of species in the samples (site times habitat times year) of the train dataset. B. Distribution of the number of species in the samples (site times habitat times year) of the test dataset.](figures/supplementary/fig_supp3.png){#fig:supp3}

![A. Distribution of the total number of individuals (abundance) in the samples (site times habitat times year) of the train dataset. B. Distribution of the total number of individuals (abundance) in the samples (site times habitat times year) of the test dataset.](figures/supplementary/fig_supp4.png){#fig:supp4}

## Environmental data acquisition

The models used in this study incorporate a dataset consisting of seven environmental variables related to oceanography, hydrography, and granulometry obtenained from @Boye_2019b The oceanographic variables include the standard deviation of salinity, surface water temperature, mean velocity of currents, and fetch, which were obtained from the PREVIMER database [@Lecornu_2009] based on the MARS3D model [@Lazure_2008]. The variables were averaged by extracting daily data for the sampled year at the site coordinates and the eight adjacent cells. The fetch was calculated as the average length of nine radiating fetch segments with a maximum distance of 300km. The granulometry variables were derived from sediment cores that were taken along with associated fauna. The cores were dried, separated into 15 fractions, and the Trask index was calculated as the ratio of the 25th to 75th percentile of the grain distribution. Organic matter mass was estimated through the loss of mass after combustion in an oven.

# Appendix B - Model Convergence

## Environmental coefficients

|Model               | Data Type        | Number of coefficients | PSRF (mean $\pm$ sd) | ESS (mean $\pm$ sd) |
|:------------------:|:-----------------|:----------------------:|---------------------:|--------------------:|
| Benchmark          | Abundance        | 1485                   | 1.18 $\pm$ 0.267     | 701 $\pm$ 576       |
| Benchmark          | Presence/Absence | 1485                   | 1.00 $\pm$ 0.002     | 4967 $\pm$ 417      |
| Phylogeny          | Abundance        | 1485                   | 1.18 $\pm$ 0.204     | 566 $\pm$ 420       |
| Phylogeny          | Presence/Absence | 1485                   | 1.00 $\pm$ 0.001     | 4947 $\pm$ 408      |
| Traits & Phylogeny | Abundance        | 1485                   | 1.21 $\pm$ 0.317     | 489 $\pm$ 358       |
| Traits & Phylogeny | Presence/Absence | 1485                   | 1.00 $\pm$ 0.008     | 11459 $\pm$ 2649    |
| Whole Community    | Abundance        | 4170                   | 1.21 $\pm$ 0.287     | 739 $\pm$ 631       |
| Whole Community    | Presence/Absence | 4170                   | 1.00 $\pm$ 0.002     | 4962 $\pm$ 406      |

Table: Potential scale reduction factors (PSRF) and effective sample sizes (ESS) for environmental regression parameters (i.e beta coefficients) estimated estimated for the four different models (Bench, Ph, TrPh, WhC) fitted either to abundance or presence-absence data. For further details see Fig. S5 to Fig. S12. {#tbl:beta_convergence}

![Density curves of potential scale reduction factors (PSRF see @Brooks_1998; left panel) and effective sample sizes (ESS; right panel) for Beta regression parameters (i.e environmental coefficients) estimated for the benchmark model fitted with abundance data. For PSRF, values greater than 1.2 (dotted red line) indicate potential convergence issues. ESS estimates the number of independent samples used to estimate  each parameter (the more the better).](figures/supplementary/fig_supp_conv_beta_PolychaetaAB.png){#fig:bench_ab_beta}

![Density curves of potential scale reduction factors (PSRF see @Brooks_1998; left panel) and effective sample sizes (ESS; right panel) for Beta regression parameters (i.e environmental coefficients) estimated for the benchmark model fitted with presence/absence data. For further details see Fig. S5.](figures/supplementary/fig_supp_conv_beta_PolychaetaPA.png){#fig:bench_pa_beta}

![Density curves of potential scale reduction factors (PSRF see @Brooks_1998; left panel) and effective sample sizes (ESS; right panel) for Beta regression parameters (i.e environmental coefficients) estimated for the phylogeny model fitted with abundance data. For further details see Fig. S5.](figures/supplementary/fig_supp_conv_beta_PolychaetaPhylogenyAB.png){#fig:phylo_ab_beta}

![Density curves of potential scale reduction factors (PSRF see @Brooks_1998; left panel) and effective sample sizes (ESS; right panel) for Beta regression parameters (i.e environmental coefficients) estimated for the phylogeny model fitted with presence/absence data. For further details see Fig. S5.](figures/supplementary/fig_supp_conv_beta_PolychaetaPhylogenyPA.png){#fig:phylo_pa_beta}

![Density curves of potential scale reduction factors (PSRF see @Brooks_1998; left panel) and effective sample sizes (ESS; right panel) for Beta regression parameters (i.e environmental coefficients) estimated for the traits & phylogeny model fitted with abundance data. For further details see Fig. S5.](figures/supplementary/fig_supp_conv_beta_PolychaetaPhylogenyTraitsAB.png){#fig:phylo_traits_ab_beta}

![Density curves of potential scale reduction factors (PSRF see @Brooks_1998; left panel) and effective sample sizes (ESS; right panel) for Beta regression parameters (i.e environmental coefficients) estimated for the traits & phylogeny model fitted with presence/absence data. For further details see Fig. S5.](figures/supplementary/fig_supp_conv_beta_PolychaetaPhylogenyTraitsPA.png){#fig:phylo_traits_pa_beta}

![Density curves of potential scale reduction factors (PSRF see @Brooks_1998; left panel) and effective sample sizes (ESS; right panel) for Beta regression parameters (i.e environmental coefficients) estimated for the whole community model fitted with abundance data. For further details see Fig. S5.](figures/supplementary/fig_supp_conv_beta_WholecommunityAB.png){#fig:whole_comm_ab_beta}

![Density curves of potential scale reduction factors (PSRF see @Brooks_1998; left panel) and effective sample sizes (ESS; right panel) for Beta regression parameters (i.e environmental coefficients) estimated for the whole community model fitted with presence/absence data. For further details see Fig. S5.](figures/supplementary/fig_supp_conv_beta_WholecommunityPA.png){#fig:whole_comm_pa_beta}

## Traits coefficients

|Model               | Data type          | Number of coefficients | PSRF (mean $\pm$ sd) | ESS (mean $\pm$ sd) |
|:-------------------|:------------------:|-----------------------:|---------------------:|--------------------:|
| Traits & Phylogeny | Abundance          | 60                     | 1.08 $\pm$ 0.092     | 1232 $\pm$ 1209     |
| Traits & Phylogeny | Presence/Absence   | 60                     | 1.00 $\pm$ 0.001     | 13227 $\pm$ 1897    |

Table: Potential scale reduction factors (PSRF) and effective sample sizes (ESS) for traits regression parameters (i.e gamma coefficients) estimated for the model including trait information fitted either to abundance or presence-absence data. For further details see Fig. S13 to Fig. S14. {#tbl:gamma_convergence}

![Density curves of potential scale reduction factors (PSRF see @Brooks_1998; left panel) and effective sample sizes (ESS; right panel) for Gamma regression parameters (i.e coefficients associated with trait-environment interactions, modeling how species traits influence their niches)  estimated for the traits & phylogeny model fitted with abundance data. For further details see Fig. S5.](figures/supplementary/fig_supp_conv_gamma_PolychaetaPhylogenyTraitsAB.png){#fig:phylo_traits_ab_gamma}

![Density curves of potential scale reduction factors (PSRF see @Brooks_1998; left panel) and effective sample sizes (ESS; right panel) for Gamma regression parameters (i.e coefficients associated with trait-environment interactions, modeling how species traits influence their niches)  estimated for the traits & phylogeny model fitted with presence/absence data. For further details see Fig. S5.](figures/supplementary/fig_supp_conv_gamma_PolychaetaPhylogenyTraitsPA.png){#fig:phylo_traits_pa_gamma}

## Phylogeny coefficients

|Model                 | Data type        | Number of coefficients |    PSRF |       ESS |
|:---------------------|:----------------:|:----------------------:|--------:|----------:|
| Phylogeny            | Abundance        |  1                     | 1.07    | 649       |
| Phylogeny            | Presence/Absence |  1                     | 1.00    | 9349      |
| Traits & Phylogeny   | Abundance        |  1                     | 1.15    | 757       |
| Traits & Phylogeny   | Presence/Absence |  1                     | 1.00    | 5000      |

Table: Potential scale reduction factors (PSRF) and effective sample sizes (ESS) for rho regression parameters (i.e phylogeny coefficient) estimated for the two models including phylogenetic information (TrPh and Ph). {#tbl:rho_convergence}

## Link between model convergence and species response curves

![Distribution of the Potential scale reduction factors (PSRF) as a function of the different shapes of the response curves classified following the methodology proposed by  @Rigal_2020 methods (see section “Assessing model performance and interpretability” for more details on the calculation methodology). Results for models fitted with abundance data.](figures/supplementary/fig_supp15.png){#fig:supp15}

![Distribution of the Potential scale reduction factors (PSRF) as a function of the different shapes of the response curves classified following the methodology proposed by @Rigal_2020 methods (see section "Assessing model performance and interpretability" section for more details on the calculation methodology). Results for models fitted with presence/absence data.](figures/supplementary/fig_supp16.png){#fig:supp16}

# Appendix C - Complementary Results

![Comparison of explanatory (left column; Train set) and predictive (right column; Test set) performance capacities of the different model structures fitted on presence/absence (top panels) or abundance (bottom panels) data](figures/supplementary/fig_supp17.png){#fig:supp17}

![Mean predicted abundances as a function of mean observed abundances in the training dataset. Each species is represented by a dot, the error bars on each point indicates the standard error around the mean relatively to each axis.](figures/supplementary/fig_supp18.png){#fig:supp18}

![Mean predicted abundances as a function of mean observed abundances in the training dataset. Each species is represented by a dot, the error bars on each point indicates the standard error around the mean relatively to each axis.](figures/supplementary/fig_supp19.png){#fig:supp19}

![Relationship between the relative improvement in RMSE for the WhC model compared to Bench model and the mean abundance of species in the training dataset. Each dot represents a species. The blue line represents a fit obtained from a LOESS regression.](figures/supplementary/fig_supp20.png){#fig:supp20}

![Relationship between the relative improvement in RMSE for the WhC model compared to Bench model and the mean occurrence of species in the training dataset. Each dot represents a species. The blue line represents a fit obtained from a LOESS regression.](figures/supplementary/fig_supp21.png){#fig:supp21}

![Comparison of model performances with regards to their ability to predict community structures when fitted with presence/absence data for the train (purple) and test (yellow) dataset. The left column indicates for each model the difference between the pairwise dissimilarities computed on the observed assemblages and those computed on the predicted community. The right column presents the differences in species richness between the observed and predicted assemblages.](figures/supplementary/fig_supp22.png){#fig:fig22}

![Comparison across the four alternative model structures of  the total amount of variance of each species (along the x-axis) that is explained by (1) the environmental variables (Environment) and (2) the three random effects (Random). Results are presented for the models fitted with abundance (left) and presence/absence (right) data. Species are ordered by increasing order of total variance explained by the benchmark model.](figures/supplementary/fig_supp24.png){#fig:supp24}

![Comparison across the four alternative model structures of the fraction of variance of each species (along the x-axis) that is explained by (1) the environmental variables (Environment) and (2) the three random effects (Random). Results are presented for the models fitted with abundance (left) and presence/absence (right) data. Species are ordered by decreasing order of variance explained by the environment for the benchmark model.](figures/supplementary/fig_supp23.png){#fig:supp23}

![Same figure as Fig. 4 in the main text for models fitted on abundance data. Number (y-axis) and proportion (indicated above individual bars, rounded to the nearest integer) of response curves (i.e. one for each species-predictor combination) according to the nomenclature (nine shapes highlighted by the black curve in each panel) defined by @Rigal_2020. Results are presented for different model structures: from left to right the Benchmark (Bench), the phylogeny (Ph), the traits & phylogeny (TrPh), and the whole community (WhC) models. Each bar is coloured by the relative contribution of each environmental covariate to this particular shape. For illustrative purposes, note that the scale of variation on the y-axis differs across panels.](figures/supplementary/fig_supp26.png){#fig:supp26}

![Same figure as Fig. 4 in the main text but for models fitted to presence/absence data. Number (y-axis) and proportion (indicated above individual bars, rounded to the nearest integer) of response curves (i.e. one for each species-predictor combination) according to the nomenclature (nine shapes highlighted by the black curve in each panel) defined by @Rigal_2020. Results are presented for the different structures: purple for the Benchmark (Bench), yellow for phylogeny (Ph), red for traits & phylogeny (TrPh), and green for whole community (WhC) model.](figures/supplementary/fig_supp25.png){#fig:supp25}

![Same figure as +@fig:supp26 but for models fitted on presence/absence data. Number (y-axis) and proportion (indicated above individual bars, rounded to the nearest integer) of response curves (i.e. one for each species-predictor combination) according to the nomenclature (nine shapes highlighted by the black curve in each panel) defined by @Rigal_2020 for different presence/absence model structures. Each bar is coloured by the relative contribution of each environmental covariate to this particular shape. For illustrative purposes, note that the scale of variation on the y-axis differs across panels.](figures/supplementary/fig_supp27.png){#fig:supp27}

![Relationship between species' position along the first axis of the fuzzy PCA (sessile microphagous-mobile macrophagous gradient) and the different environmental variables used in the models (fitted with abundance data in the left panel, and with presence/absence data in the right panel). Relationships are derived  from the regression coefficients estimated for the PhTr model ($\gamma$ coefficients in HMSC; @Ovaskainen_2020).The lines are fitted quadratic regressions representing the average response across the different species. As an example of interpretation, the red lines in both graphs indicate that sessile microphagous species are more negatively influenced (lower abundance, low probability for presence) by fetch than macrophagous mobile species.](figures/supplementary/fig_supp28.png){#fig:supp28}

![Same figure as Fig. 5 in the main text but for models fitted on presence/absence data. (A) Comparison of residual correlations associated with the three random effects estimated by the Whole Community Model (y-axis) and the Benchmark model (x-axis). The colour scale highlights the density of points in each scatter plot. (B) Distribution of the index measuring change in sign (sign change left to the zero line, no change to the right) and magnitude (higher departure from the zero line indicate higher difference) between residual correlations estimated by the whole community model and the benchmark model for the three random effects (Habitat, Site, Year).](figures/supplementary/fig_supp29.png){#fig:supp30}

# References