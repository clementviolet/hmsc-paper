---
documentclass: report
classoption: oneside
date: false
lang: en-US
polyglossia-lang:
  name: en-US
geometry:
  - left = 2cm
  - right = 2cm
  - top = 2cm
  - bottom = 2cm
fontsize: 12pt
toc: false
linestretch: false
bibliography: [./references.bib] # This field is overid when pandoc is use, but it allow to use citation completion when writting.
---

<!-- 

Liste des journaux possibles :

1. Methods in Ecology and Evolution. IF: 7.78. Research Article: Words 7000~8000

2. Ecology. IF: 5.499. Research Article or Statistical Reports. Words ~8000 (20 pages max)

3. Journal of Ecology. IF: 6.26. Resear articles. Words 8000

 -->

# Materiel and methods
## HMSC

We used HMSC framework applied to some of the data acquired by the REBENT monitoring programm. In the following subsections, we describe (1) the HMSC framework, (2) the data used in this study, (3) the slitting of this dataset into training and testing datasets, (4) 
In the following subsections, we describe (1) JSDM, (2) data, (3) alternative models, (4) performance and diagnostic metrics.

## Hierarchical Modelling of Species (HMSC)

Since the rise of Joint Species Distribution Models using latent variables in the mid-2010s [@Warton_2015], several implementations have been proposed : *HMSC* [@Ovaskainen_2017a], *Boral* [@Hui_2016], *gllvm* [@Niku_2019]. Here, we choose *HMSC* because this implementation performs well on occurrence data against other classical *SDM* and *JSDM* [@Norberg_2020]. Moreover, *HMSC* allows for the use of different ecologically meaningful covariates like species-specific traits and/or phylogenetic correlations [@Ovaskainen_2017a ; @Tikhonov_2019b].

"*HMSC* is a mutilvariate hierarchical generalized linear  mixed model adjusted with Bayesian inference rooted in assembly theory [@Ovaskainen_2020]. Therefore, a *HMSC* model has two parts: one taking into account fixed effects and the other taking into account random effects @fig:workflow . The fix part models the realised niche of each species ($B$ matrix), where each dimension of the niche is a covariate included in the model [@Ovaskainen_2020]. Without any traits, the *HMSC* framework assume that all species share the same expected niche value for each covariate, however, the width of each niche is assumed to be species-independent. If the modeler includes some trait data, the information contained in it enables *HMSC* to estimate a specie-specific expected niche value [@Ovaskainen_2017a ; @Ovaskainen_2020]. In addition, traits are phylogenetically inherited, therefore, closely related phylogenetically species tend to share more traits. Thus, using phylogenetic information, *HMSC* can capture residual traits information not include in the trait data, allowing a better estimation of the ecological niches of the species included in the model. [@Ovaskainen_2020].

Since *HMSC* can include a random part, it can constrain the estimated residuals with random effects. These random effects are estimated using latent variables: for each random effect, two matrices of latent variables are estimated [Ovaskainen_2017a ; @Tikhonov_2019b ; @Ovaskainen_2020]. One of them, thereby called *site loadings* ($H$ matrix) contains the values of all the covariates not included in the model at the level of this random effect [@Ovaskainen_2017a ; @Ovaskainen_2020]. The other matrix, thereafter called *species loadings* ($\Lambda$ matrix) correspond to the response of the species to each of these missing predictors at the level of this random effect [@Ovaskainen_2017a ; @Ovaskainen_2020]. These missing covariate can be missing environmental features, but, if the model models well the environmental niche of each species, the remaining information are more likely to contain some biotic interaction signals [@Ovaskainen_2017a ; @Ovaskainen_2017b ; @Ovaskainen_2020].

## Dataset

### Biotic dataset

Faunistic data were provided by the *REBENT* monitoring program. REBENT is a station-based monitoring network created after the sinking of the Erika tanker in december 1999 on the Brittany coast. The goal of the monitoring network is to detect, characterize and explain changes in French benthic ecosystems. From this survey program, we focused on two monitored habitats: the intertidal bare sediments and intertidal seagrass (*Zostera marina*) beds of Brittany. We have selected 21 sites samples all over Brittany . The sampling methodology was described in length in @Boye_2017. Each site was sampled at least 6 times between 2006 and 2014 and one sample  consisted of a set of three replicates of three sediment cores. 

### Model training and testing

This dataset, hereafter called *training dataset* had 180 observational units defined as the unique combination of years, site and habitat. Additionally, we have selected two more sites, which included the two habitats and 35 observational units constituting the *test dataset* in order to test our models against unseen data.

### Targeted assemblage

The training dataset originally included 519 species, later reduce to 278 species after removing species with fewer than 4 occurrences across the 180 observational units. Of these 278 species, 99 of them were Polychaeta. 

### Polychaeta traits and phylogeny

The taxonomic classification of these 99 Polychaeta species was retrieved on Worms to be used as a phylogeny proxy. Hence, phylogenetic correlation has been estimated using ape R package [@Paradis_2019]. In addition, Polychaeta traits data matrix was obtained from a previous study of these benthic community [@Boye_2019a]. The trait matrix contained 11 fuzzy coded traits for a total of 41 categories. Prior to using the trait matrix, we reduced its dimensionality by applying fuzzy-PCA algorithm. We have kept the first three axes, accounting for 59% of the total variance of the trait matrix to be used as synthetic traits data +@fig:fuzzy_pca_traits. The first axis allows to distinguish between mobile predatory species from sessile microphage ones, the second axis differentiate semelparous species from iteroparous one, the third axes separates burrower species from tube dweller ones.

<!-- Description et interpretation des trois premiers axes en lien avec la figure -->

### Environmental dataset

Based on the work of @Boye_2018_test, we selected 7 environmental variables which allowed to characterise the realised niche of each species of the sampled communities. These variables describe the fetch, a proxy for the degree of hydrodynamic exposure of the sites; hydrological properties as sea water temperature and salinity and current velocity; and sedimentological properties as mud and organic matter content, and granulometric properties. To capture the non-linear nature of the ecological niches, we then calculated orthogonal polynomials of degree 1 and degree 2 for each of these variables. These polynomials transformed variables have been used as explanatory covariates in the models presented below.

## Comparison of alternative model structures

We fitted four alternative candidate models of increasing complexity with the R-package Hmsc [@Tikhonov_2019b] assuming the default priors. 

1. The first candidate model uses only Polychaeta community data and the environmental covariates,  hereafter referred  as *benchmark* model
2. The second one add to the previous model phylogenetic data, hereafter referred as the *phylogenetic model* 
3. The third one add to the previous trait data, hereafter referred as *trait model*. 
4. The fourth and last model uses the whole community data and the environmental covariates, but it did not include any trait nor phylogenetic data, hereafter referred as *whole community model*.

All these four models were fitted twice, using occurrence and abundance data. Moreover, all these models and their occurrence/abundance variants shared the same random effect: one temporal random effect accounting for the sampling year, one random factor accounting for the sampling site and the last one accounting for the sampling habitat. 

## Fitted models & Analysis

### Model fitting using Markov Chain Monte Carlo 

We sampled the posterior distributions of each model with same parameters: we used 15 Markov Chain Monte Carlo chains, each one ran for 30 000 iterations. The first 10 000 iterations were discarded as burn-in and the remaining were thinned by 20 to yield 1000 posterior samples per chain.  In total, we sampled 15,000 posterior samples per parameter. We then examined MCMC convergence by examining the potential scale reduction factors [@Gelman_1992] of each model parameters. The MCMC convergence and the effective sample size of the different HMSC models were satisfactory (see supporting informations XXX).

### Assessing model performance and interpretability

Goodness of fit and predictive power of all models were assessed using AUC for occurence data. Additionally, the root mean squared errors (RMSE) was also computed for abundance based models. We calculated the parition of the explained variance between the share of variance explained by the environment and by the random effects. Then, we studied the shapes of the species-environmental predictors inferred by the different models: the nature of the relationship between each pair of species-environmental predictors can be describe by their direction (decline, increase or stable) and their shape (decrease, increase or stable) [@Rigal_2020]. Finally, we qualitatively studied the information captured by the latent variables through the estimation of residual correlations between species.

# Results

## Model Fit & Predictive power

We evaluate the models containing phylogeny, phylogeny and traits, as well as the model with the whole community against the benchmark model including only polychaetes and the environmnetal covariates +@fig:explanatory_predictions_power . All the models fitted with occurence data had an excellent fit to the data, their mean AUC was on average greater than 0.9. The predictive power of these model were in contrast significantly lower: the mean AUC for these models was about 0.65. For abundance based model, all models showed a similar mean RMSE ranging from 8.92 to 9.34. As for the predictive power, there was a large disparity between the RMSE of the different models: the model with all the community had an average RMSE of 5.83, the three other had average RMSE ranging from 54.2 to 95.6. 

Comparing our baseline model with only environmental data without including additional information such as phylogenetic correlation or traits, we observe that explanatory abilities improve for models added with occurrence or abundance data only if all species in the community are considered (Figure @fig:explanatory_predictions_power). [Comment puis-je dire que les tests de Kruskall-Wallis & post-hoc de Dunn sont significatif ?]. The increase in explanatory power remains modest : the AUC increases in average by 0.0034 ± 0.0114 (mean ± sd) for the models fitted with occurrence data and the RMSE decreases by 0.035 ± 0.796 (mean ± sd) for the models fitted with abundance data. As for the predictive power, it only improved for the model with all the community fitted with abundance data, where its RMSE decrease of 0.27 ± 0.44. The model with the whole community is the one that takes best advantage of the additional information, we wanted to explore the correlations between the relative increase in explanatory and predictive power on the one hand and on the other hand of the average occurrence and abundance of polychaetes. The model is better able to explain the abundance of the most common species: the decrease in RMSE is correlated with the mean abundance and mean occurrence of polychaete species (Kendall's τ = -0.29, p-value < 0.0001 and Kendall's τ = -0.28, p-value > 0.001 respectively).
We explored the structure of the infered communnity and the extrapolate one by decomposing the total beta diveristy into species turnover and replacement accordingly to the Baselga framework. We found that on the training dataset, the median Sorensen disimilarity is about 0.36 for all models fited wit occurence or abundance data. 

## Variance partionning
The amount of variance explained by each model can be further decompose between the differents environmentals covariates and levels of random effects. For all models, the environmental variables account for most of the explained variance (Fig @fig:var_part in supplementary material XXXX). However, when looking at the relative change in the share of variance explained by the models, we find that a larger part of variance is explained by random effects for the model including the whole community than for the other models (Fig @fig:var_part). For the abundance base models, the median of the relative change in variance explained by the random effects is 0.086 for the model with inclusion of phylogeny informations, 0.199 for the model with both phylogenic and traits informations and 0.354 for the model including whole community. The same increase in variance explained by random effects for the whole community model is observed when this model architecture is fitted with occurence data. With the test data set, we obtained a median Sorensen dissimilarity of about 0.65 for the models fitted with abundance data and about 0.72 for the models fitted with occurence data.

## Species niche estimated

The models tested are based on the estimation of the quadratic of the realized niche of each species according to each environmental variable and possible complementary information provided by the phylogenetic signal or the traits (Fig @fig:response_shape_ab). For the models fitted with abundance data, almost no realized niches have a convex or concave shape. On the contrary, for the models including only environmental covariates, as well as phylogeny and/or traits, more than 60% of the estimated realized niches are flat. This rate of flat realized niches rises to more than 80% for the model including the whole community. Besides the flat niche forms, the other estimated niche forms are divided between the constant decline and the accelerated decline. For the models that do not include the whole community, the accelerated decline form represents more than 10% of the niches estimated by the models and more than 15% for the constant decline form. The model including the whole community has much less estimated realized niches having for form the accelerated decline or constant decline by counting respectively 4.62% and 9.24% of the total forms of estimated realized niches.  
We further investigated the link between the first fuzzy-PCA axis of the trait matrix and our environmental predictors (Fig @fig:traits_effect in supplementary materials). Both abundance and occurence based model including traits inferred some meaningfull shapes traits/envrionment relathionship: the mobile preadatory polychaeta were more negatively affected by fetch than sessile suspensivore ones, the concentration in organic matter increase the chance of encountering suspensivore polychaeta but the increase in current strength decrease this probability.

## Residual correlation
Since all the models included the same random effects, we qualitatively compared the residual correlations estimated by the basic model with the one including the whole community, the latter being better performing than the other models tested and the variance explained by this model is based more on the random effects (Fig @fig:residual_corr_abd and Fig @fig:residual_corr_pa supporting information). For all the random effects included in the models, the residual correlations estimated by the community-wide model and the baseline model are not significantly different. The proportion of negative residual correlations is higher for the community-wide model compared to the baseline model, however the correlations estimated by the baseline model are stronger overall than for the community-wide model.

# Discussion

# Figures

## Main

![Workflow of the study](figures/workflow.png){#fig:workflow}

![Comparison of the explanatory and predictive capacities of different model architectures. The top panels evaluate the explanatory (left) and predictive (right) capabilities for models fitted with occurrence data. The bottom panels evaluate the explanatory (left) and predictive (right) capabilities for models fitted with abundance data.](figures/explanatory-predictive-models.png){#fig:explanatory_predictions_power}

<!-- ![Relative changes in variance partitionning between models](figures/varpart10.png){#fig:relative_change_varpart} -->

![Relative change in explanatory and predictive power of different model architectures with respect to the benchmark. The top panels show the relative evolution of explanatory (left) and predictive (right) capabilities for models fitted with occurrence data. The bottom panels show the relative evolution the explanatory (left) and predictive (right) capabilities for models fitted with abundance data](figures/relative-change-explanation-prediction-7.png){#fig:relative_change_explanation_prediction}

![Distribution of response curves of polychaetes to the environment. All models have been fitted with abundance data. Each response is characterized by a shape and an intensity. See Rigal et al 2020](figures/response_shape_ab.png){#fig:response_shape_ab}

## Supplementary

![Explanatory and predictive power of the benchmark model for occurrence data. The performances are measure as AUC values.](figures/S1_AUC.png){#fig:auc}

![Explanatory power of the benchmark model for abundance data. Each dot is a species predicted for one observational unit. The y-axis represents the number of individuals observed for each species at each observational unit. The x-axis shows the number of individuals predicted by the model for each observational unit. The dotted line represents the theoretical line of perfect fit of the model to the training data.](figures/observed_predicted_train.png){#fig:pred_obs_train}

![Predictive power of the benchmark model for abundance data. Each dot is a species predicted for one observational unit. The y-axis represents the number of individuals observed for each species at each observational unit. The x-axis shows the number of individuals predicted by the model for each observational unit. The dotted line represents the theoretical line of perfect fit of the model to the test data.](figures/observed_predicted_test.png){#fig:pred_obs_test}

![Comparison of the partitioning of the variance explained for each species by each model fitted on occurrence or abundance data. Species are ordered by decreasing order of variance explained by the environment for the benchmark model.](figures/varpart-4.png){#fig:var_part}

![Fuzzy PCA of the traits data. The three first axis explained 58.55% of the total variance](figures/traits-fpca-3.png){#fig:fuzzy_pca_traits}

![Effect of traits on the estimated species responses to envrionmental covariables](figures/traits-effects-axis.png){#fig:traits_effect}

![Correlation matrix of environmental coefficients estimated for polychaete species by the different models fitted with abundance data.](figures/corr_coeff_env_ab.png){#fig:corr_env_ab}

![Correlation matrix of environmental coefficients estimated for polychaete species by the different models fitted with occurence data.](figures/corr_coeff_env_pa.png){#fig:corr_env_pa}

![Correlation matrix of environmental coefficients estimated for polychaete species by the different models fitted with abundance data.](figures/corr_coeff_env_ab_pa.png){#fig:corr_env_ab_pa}

![Residual correlation for the abundance models](figures/residual_corr_ab.png){#fig:residual_corr_abd}

![Residual correlation for the occurence models](figures/residual_corr_pa.png){#fig:residual_corr_pa}

![Distribution of response curves of polychaetes to the environment. All models have been fitted with abundance data. Each response is characterized by a shape and an intensity. See Rigal et al 2020](figures/response_shape_pa.png){#fig:response_shape_pa}


<!-- # The model

This is a citation: @Martinez2002 -- we can also have citations in brackets
[@Martinez2002].

## Lists

1. one fish
2. two fish
3. red fish
4. blue fish

# Methods

There is an equation, which we can cite with {@eq:eq1}.

$$J'(p) = \frac{1}{\text{log}(S)}\times\left(-\sum p \text{log}(p)\right)$$ {#eq:eq1}

# Tables

We can do tables:

| Column 1 | Column 2 |      Column 3    |
| -------- | :-------:| ---------------: |
| c1       |    c2    |       $\alpha$   |

Table: Demonstration of a simple table. {#tbl:1}

The first column is neat, the second centered and the third right-aligned. We can also cite table with {@tbl:1}

# Figures

![This is the legend of the figure](figures/biomes.png){#fig:biomes}

We can refer to @fig:biomes.

# Code?

Yes

~~~ julia
# for i in eachindex(x)
#  x[i] = zero(eltype(x)) # Don't do that
# end
~~~

# References -->
