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

Since the rise of Joint Species Distribution Models using latent variables mid-2010 [@Warton_2015], several implementations have been proposed : *HMSC* [@Ovaskainen_2017a], *Boral* [@Hui_2016], *gllvm* [@Niku_2019]. Among these different implementations, we choose for this study *HMSC* because this implementation performs well on occurrence data against other classical *SDM* and *JSDM* [@Norberg_2020]. Moreover, *HMSC* allow the user to use different types of ecological meaningful data like traits and/or phylogenetic data [@Ovaskainen_2017a ; @Tikhonov_2019b] by solving the fourth corner problem [@Ovaskainen_2020].


"*HMSC* is a mutilvariate hierarchical generalized linear  mixed model adjusted with Bayesian inference" rooted in assembly theory [@Ovaskainen_2020]. Therefore, a *HMSC* model is composed of two parts, one fix and one random. The fix part models the realised niche of each species ($B$ matrix), where each dimension of the niche is a covariate included in the model [@Ovaskainen_2020]. Without any traits, the *HMSC* framework assume that all species share the same expected niche value for each covariate, however, the width of each niche is assumed to be species-independent. If the modeler includes some trait data, the information contained in it enables *HMSC* to estimate a specie-specific expected niche value [@Ovaskainen_2017a ; @Ovaskainen_2020]. In addition, traits are phylogenetically inherited, therefore, closely related phylogenetically species tend to share more traits. Thus, using phylogenetic information, *HMSC* can capture residual traits information not include in the trait data [@Ovaskainen_2020].
Since *HMSC* can include a random part, it can constrain the estimated residuals with random effects. These random effects are estimated using latent variables: for each random effect, two matrices of latent variables are estimated [Ovaskainen_2017a ; @Tikhonov_2019b ; @Ovaskainen_2020]. One of them, thereby called *site loadings* ($H$ matrix) contains the values of all the covariates not included in the model at the level of this random effect [@Ovaskainen_2017a ; @Ovaskainen_2020]. The other matrix, thereafter called *species loadings* ($\Lambda$ matrix) correspond to the response of the species to each of these missing predictors at the level of this random effect [@Ovaskainen_2017a ; @Ovaskainen_2020]. These missing covariate can be missing environmental features, but, if the model models well the environmental niche of each species, the remaining information are more likely to contain some biotic interaction signals [@Ovaskainen_2017a ; @Ovaskainen_2017b ; @Ovaskainen_2020].

## Dataset

Faunistic data were provided by the *REBENT* monitoring program. This program aims to collect data about benthic habitats and their associated fauna. From this survey program, we focused on two monitored habitats: the intertidal bare sediments and intertidal seagrass (*Zostera marina*) beds of Brittany. We have selected 21 sites samples all over Brittany (est-ce que l'on met une carte dans le corps du texte ou en annexe ?). The sampling methodology was described in length in @Boye_2017. Each site was sampled at least 6 times between 2006 and 2014 (est-ce que l'on met en annexe le tableau contenant l'année, le site et l'habitat échantillonné ?) and one sample  consisted of a set of three replicates of three sediment cores. 
This dataset, hereafter called *training dataset* had 180 observational units defined as the unique combination of years, site and habitat. Additionally, we have selected two more sites, which included the two habitats and 35 observational units constituting the *test dataset* in order to test our models against unseen data.

The training dataset originally included 519 species, later reduce to 278 species after removing species with fewer than 4 occurrences across the 180 observational units. Of these 278 species, 99 of them were Polychaeta. The taxonomic classification of these 99 Polychaeta species was retrieved on Worms to be used as a phylogeny proxy. Hence, phylogenetic correlation has been estimated using ape R package [@Paradis_2019]. In addition, Polychaeta traits data matrix was obtained from a previous study of these benthic community [@Boye_2019a]. The trait matrix contained 11 fuzzy coded traits for a total of 41 categories. Prior to using the trait matrix, we reduced its dimensionality by applying fuzzy-PCA algorithm. We have kept the first three axes, accounting for 59% of the total variance of the trait matrix to be used as synthetic traits data. (Est-ce que l'on met la Fuzzy ACP et les statistiques afférentes en annexe ?)

Based on the work of @Boye_2018_test, we selected 7 environmental variables which allowed to characterise the realised niche of each species of the sampled communities. These variables describe the fetch, a proxy for the degree of hydrodynamic exposure of the sites; hydrological properties as sea water temperature and salinity and current velocity; and sedimentological properties as mud and organic matter content, and granulometric properties. To capture the non-linear nature of the ecological niches, we then calculated orthogonal polynomials of degree 1 and degree 2 for each of these variables. These polynomials transformed variables have been used as explanatory covariates in the models presented below.

## Fitted models & Analysis

We fitted four alternative candidate models of increasing complexity with the R-package Hmsc [@Tikhonov_2019b] assuming the default priors. The first candidate model uses only Polychaeta community data and the environmental covariates, the second one add to the previous model the phylogenetic data, the third one add to the previous trait data. The last model uses the whole community data and the environmental covariates, but it did not include any trait nor phylogenetic data. All these four models were fitted twice, using occurrence and abundance data. Moreover, all these models and their occurrence/abundance variants shared the same random effect: one temporal random effect accounting for the sampling year, one random factor accounting for the sampling site and the last one accounting for the sampling habitat. We sampled the posterior distributions of each model with same parameters: we used 15 Markov Chain Monte Carlo chains, each one ran for 30 000 iterations. The first 10 000 iterations were discarded as burn-in and the remaining were thinned by 20 to yield 1000 posterior samples per chain.  In total, we sampled 15,000 posterior samples per parameter. We then examined MCMC convergence by examining the potential scale reduction factors [@Gelman_1992] of each model parameters.

Goodness of fit and predictive power of all models were assessed using AUC (for abundance data, AUC was computed using abundance predictions truncated to occurrence). Additionally, the root mean squared errors (RMSE) was also computed for abundance based models. We compared the $B$ matrices of the different models two by two using Pearson correlation coefficient to search for common structures between two matrices to identify whether one or more of the models differs completely from the others in terms of the estimated coefficients.

# Results

[Model Fit]

The MCMC convergence and the effective sample size of the different HMSC models were satisfactory (see supporting informations XXX).

The presence-abscence models showed a very good fit to the data, the mean AUC being on average greater than 0.9 for explanatory power. The predictive capacities of the different models are significantly lower than their explanatory capacities. On average, the AUC of the differents models was about 0.65. There were no variabilities between the differents candidat models regarding the predictive power and explanatory power (Fig. XX)

As for abundance based models, when looking at the AUC computed using counts truncated to occurence, the same patterns regarding the explanatory and predictive power occured. All models had a AUC greater than 0.9 for explanatory power and around 0.65 for predictive power (see Fig XXX in supporting informations). The RMSE indicated that all models had a good fit, their average RMSE ranged from 8.93 to 9.36 with a standard deviation between 38.6 to 43.4 (see table XXXX). The three models that included only polychaeta species showed poor predictive performances, their average RMSE were comprise between 54.1 to 95 and  all three exhibited high variability their standard deviation were ranging from 423 to 748. However, contrary to the three previous models, the model including all species of the communtity exhibited good predictive capabilities its RMSE was on average of 5.77 and the standard deviation of the RMSE was of 27.  

[Relative increase in model fit/model predictions]

We investigated whether the inclusion of alternative information on the target species, such as (1) phylogeny or (2) phylogeny and traits or (3) the inclusion of all species in the sampled community would have an impact on the explicative and predictives performances compared to a baseline model focusing only on polycheata without additional informations.

The explanatory capacities of presence-absence models including phylogeny or phylogeny and traits had decreased compared to the baseline model (Fig. XXX). The AUC of the model with all species of the community slightly increased compared to the baseline model (+ 0.06%). However, regarding predictive power, there were no differences between the three model and the baseline model. For abundance based model, the were no differences between models with phylognie or model with phylogenie and traits and the baseline model for explenatory and predictive power. Yet, as for the occurence based model, the model with all the community showed an improvement of the explenatory power, compared to the based model, the mdeian RMSE decreased slightly (-0.005%). As for predictive power, the model with all communtiy showed a large improvement of the median RMSE who dropped of 18.4%.

[Variance partitionning]

We measured the correlation between all environmental coefficients of the four candidats models. The model with all the community is the model which its environmental estimated coefficient are the less correlated to the other models (Fig XXXX). The variance explanaied by all models is mostly due to environmental variables, even though the model with all the community seemed to have a slightly larger share of variance explained by random effects than for the other models (Fig.XXX).

[Classification of the inferred environmental <->Species relationships]




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
