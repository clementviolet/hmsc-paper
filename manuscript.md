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

3. Journal of Ecology. IF: 6.26. Resear articles. Words 8000Un

 -->

# Introduction

Community ecology aims at explaining and predicting spatio-temporal variability in species diversity [@Whittaker_2001] and coexistence [@Chesson_2000]. Understanding the processes that determine species distribution around the planet is a prerequisite to characterise and predict community structure and associated ecological dynamics, which is critical to mitigate the effects of global change on biodiversity and prevent the sixth mass extinction [@ipbes_2019]. Currently, the major challenges faced by ecologists include describing, explaining, and predicting changes in communities  [@Tredennick_2021] in order to inform  effective management or restoration measures in a rapidly changing world [@Brudvig_2022; @Dietze_2018; @Houlahan_2017]. Joint Species Distribution Models (jSDM) are particularly well-suited tools to address these challenges, whether to characterise the processes that shape  observed communities [@Ovaskainen_2017a], or to predict how communities will evolve in the future [@Norberg_2019].

jSDMs are multivariate  (i.e. multi-species) extensions of  Species Distribution Models (SDMs), which have been broadly applied over the past decades - across all terrestrial and marine realms - to understand and predict both species occurrences [@Elith_2006 ; @Norberg_2019] and species abundances [@Howard_2014 ; @Waldock_2022] using a set of covariates (e.g. climatic variables).  One advantage of jSDM relies on their explanatory power owing to their tight link with the assembly rule framework [@Ovaskainen_2017a]. In particular, relative to single-species SDMs that only consider the abiotic niche of species (i.e. the Grinellian niche), jSDM can theoretically also account for interspecific interactions (i.e. the Eltonian niche).

Indeed, in jSDMs, the variability in community composition not explained by covariates is captured by a residual covariance matrix representing species co-occurence patterns potentially representing biotic interactions [@Ovaskainen_2017a]. This feature is highly attractive to ecologists because it provides a way to disentangle the relative influence of abiotic and biotic processes on biodiversity patterns [@Godsoe_2017] while also improving model’s predictive power [@Giannini_2013; @Staniczenko_2017]. However, in practice, inferring and interpreting residual co-occurence patterns using jSDMs remains challenging for several reasons [@Blanchet_2020 ; @Holt_2020].

First, while jSDMs have been applied to a large number of species presence/absence datasets [@Norberg_2019 ; @Wilkinson_2019 ; @Wilkinson_2020], simulation studies showed that co-occurence networks inferred from such data does not necessarily provide evidence for species interactions [@Blanchet_2020 ; @Dormann_2018 ; @Sander_2017] and only inform about spatial and temporal associations between species [@Keil_2021]. Some authors speculated that jSDMs applied to abundance data - instead of presence/absence data - are likely to provide a better proxy for biotic interactions [@Blanchet_2020 ; @Momal_2020]. Accordingly, jSDM have progressively been extended and applied to abundance data [@Chiquet_2021 ; @Hui_2016 ; @Ovaskainen_2017a ; @Popovic_2022]. Yet, specific challenges related to modelling abundance data have only been  recently explored in the context of species distribution modelling [@Waldock_2022]. To date, the predictive and the explanatory power of jSDM fitted to abundance data remains largely untested compared to presence/absence data [@Norberg_2019 ; @Wilkinson_2020]. 

Second, regardless of the type of data considered (i.e. presence/absence or abundance), several factors may limit or affect the interpretability and predictive ability of jSDM. For instance, co-occurence patterns estimated in jSDM are affected by unaccounted environmental variables implying that jSDMs cannot fully separate the environmental and the biotic niche of species [@Blanchet_2020 ; @Poggiato_2021]. Beyond missing environmental predictors, one prerequisite for improving biotic inference and thus jSDMs’ predictions is to take into account other actors (i.e. species) that could have an influence on the target community (e.g. competitors; @Levine_2017). However, because many ecological studies only focus on particular taxonomic groups [@Pollock_2014 ; @Hakkila_2018], hence disregarding non-target taxa, co-occurence patterns estimated from jSDMs are almost always skewed by missing ecological actors  [@Momal_2021]. How this bias affects the predictive ability of jSDM remains untested. 

Finally, similar to SDMs, jSDMs can theoretically be extended to include additional sources of information about modelled species [@Niku_2019 ; @Ovaskainen_2017a]. For instance, accounting for phylogenetic relationships between species [@Ives_2011] or the link between functional traits and  environmental responses [@Pollock_2012] have been shown to improve both the explanatory and the predictive powers of SDMs [@Morales-Castilla_2017 ; @Vesk_2021], thus supporting the hypothesis that species sharing the same traits and/or recent evolutionary history also share similar environmental preferences. While a similar behaviour is expected for jSDMs [@Ovaskainen_2017a], the relative influence of additional sources of information on their interpretability and predictive power remains untested [@Norberg_2019 ; @Wilkinson_2019].

Overall, many practical questions remain concerning the application of jSDMs to ecological communities in particular regarding the vast possibilities related to the inclusion of additional sources of information within the models. In this study, we aim to provide a comprehensive understanding of the extent to which jSDM's predictive and explanatory powers are affected by different sources of information. Specifically, by comparing predictions obtained from a baseline model including no additional sources of information (i.e. a classical jSDM), we tested the effect of (1) including phylogeny alone and in combination with trait data, (2) incorporating information from non-target species and (3) considering abundance instead of occurrence data. We hypothesised that all these sources of information should improve jSDM’s predictive and explanatory powers. Which modelling strategy would lead to the largest improvements is however more difficult to predict.

# Material and Methods

We used the HMSC (Hierarchical Modeling of Species Communities) framework applied to the long-term REBENT coastal monitoring dataset ([rebent.ifremer.fr](https://rebent.ifremer.fr)). In the following subsections, we describe (1) the HMSC framework, (2) the data used in this study, (3)  how data were split into training and testing sets to test the explanatory and predictive powers of models, respectively, (4) the rationales for the suite of alternative models considered, and (5) the performance metrics used to compare models.

## Hierarchical Modeling of Species (HMSC)

"*HMSC* is a multivariate hierarchical generalised linear mixed model adjusted with Bayesian inference rooted in assembly theory" [@Ovaskainen_2020]. A *HMSC* model is composed of two parts: one taking into account fixed effects and the other taking into account random effects. The fix part models the realised niche  (i.e., the set of environmental conditions that is biotically suitable and accessible to the species; @Ovaskainen_2020) of each species (B matrix), where each dimension of the niche is a covariate (e.g. temperature) included in the model [@Ovaskainen_2020]. Without trait data, the HMSC framework assumes that all species share the same expected niche value for each covariate, whereas the width of each niche is assumed to be species-independent. Including trait data enables estimating species-specific expected niche value by accounting for trait-environment relationships, where species with similar traits respond similarly along environmental gradients [@Ovaskainen_2017a ; @Ovaskainen_2020]. It is now well established that phylogenetically close species tend to share similar trait values or niches [@Wiens_2010]. Adding phylogenetic data to a HMSC model already including traits is not necessarily redundant because it could capture residual information not included in the trait data, theoretically allowing for a better estimation of species niches [@Ovaskainen_2020]. The inclusion of this additional information further opens up the possibility to improve model fit for rare species by  borrowing information on traits (or phylogenetic) environment relationships estimated for common species that share the same traits (or that are phylogenetically close to them;  @Ovaskainen_2020). This proprerty is a main advantage of hierarchical models [@Gelman_2020].

The random part of HMSC relies on latent variables. Specifically, for each random effect, two matrices of latent variables are estimated  [@Ovaskainen_2017a ; @Tikhonov_2019b ; @Ovaskainen_2020]: the $H$ matrix (called *site loadings*) contains the values of missing covariates not included in the model [@Ovaskainen_2017a ; @Ovaskainen_2020]; while the $\Lambda$ matrix (called *species loadings*) corresponds to the response of the species to missing covariates [@Ovaskainen_2017a ; @Ovaskainen_2020]. These covariates thus capture residual variance, which can be due to various factors including missing environmental features or the effect of biotic interactions [@Ovaskainen_2017a ; @Ovaskainen_2017b ; @Ovaskainen_2020].

## Datasets

### Faunistic data

Faunistic data were provided by the REBENT program ([rebent.ifremer.fr](https://rebent.ifremer.fr)) which is a station-based monitoring network initiated following the dramatic oil spill of the Erika tanker in December 1999 off Brittany’s southern coastline (Western France). The goal of the monitoring network is to detect, characterise and explain changes in French benthic ecosystems through space and time. Between 2003 and 2017, this ongoing program had monitored four distinct habitats across 49 sites. Overall, 861997 individuals belonging to 821 species were collected since the beginning of the program, totalling 375 sampling units (years, sites and habitats altogether). Here, we focused on benthic communities found in two soft-bottom habitats: intertidal bare sediments and intertidal seagrasses (*Zostera marina*). These habitats were sampled following the same protocol across 23 sites along Brittany's coastlines. The sampling protocol consisted in collecting 3 sediment cores of 0.03m2 that were then pooled together and considered as a single sampling unit representing each site. For each sampling event, individuals were identified to the lowest taxonomic level possible (mostly species level), full description of the sampling methodology is provided in @Boye_2017.

### Functional traits and phylogeny data

In this study, we focused on obtaining species-specific information such as functional traits and phylogeny for inclusion in different models. We chose to focus on a particular class, the polychaetes. Polychaetes are animals exhibiting diverse lifestyles [@Jumars_2015] and are a biotic group useful for monitoring the health of benthic habitats [@Giangrande_2005]. Polychaeta traits data matrix was available for the 99 polychaeta species in the *training set* and includes 11 fuzzy-coded traits, which corresponds to a total of 41 modalities [@Boye_2019a]. Prior to jSDM fitting, the dimensionality of the trait matrix was reduced using a fuzzy-PCA with the *fpca* function from the *ade4* R package [@Thioulouse_2018]. We kept the first three axes, which account for 59% of the total variance of the trait matrix, as synthetic traits data (+@fig:fuzzy_pca_traits). The first axis distinguishes mobile predatory species from sessile microphages; the second axis differentiates semelparous species from iteroparous species; and, the third axis separates burrowers from tube-dwellers.

Possessing traits for our 99 Polychaeta, we retrieved their taxonomic classification through the WoRMS database ([www.marinespecies.org](https://www.marinespecies.org)) and used this information as a proxy for phylogenetic relationships [@Ovaskainen_2020 ; @Ricotta_2012]. Phylogenetic distances between Polychaeta species were then estimated using the *ape* R package [@Paradis_2019].

### Environmental data

Based on @Boye_2019b,  we selected seven environmental variables to characterise the ecological niche of each species within the focal communities. These seven variables quantify different components of coastal environmental variability including hydrology (sea water temperature, salinity and current velocity), sedimentology (mud and organic matter content), granulometry (Trask index) and local wave exposure (fetch).

## Comparison of alternative model structures

The first model (benchmark model; *Bench*), uses only Polychaeta community data and environmental covariates. The second model (phylogenetic model; *Ph*), adds phylogenetic data to the *Bench* model. Rare species can thus benefit from phylogenetic-/environment relationships estimated for closely related species [@Ives_2011]. The third model (traits-phylogeny model; *TrPh*), adds traits data to the *Ph* model. Here, rare species can benefit from traits-environment relationships estimated for species presenting similar functional traits whereas phylogeny can capture an additional part of the variability not explained by trait similarity [@Pollock_2012]. Finally, the fourth model (whole community model; (*Whc*), adds information about the whole community (i.e. other species than polychaetes; totalling 278 species) to the *Bench* model (only 99 polychaetes). This model does not include trait or phylogenetic data for the sake of computation time. These four models were fitted twice, either using occurrence or abundance data. All models included the same random effects: a temporal random effect to account for variability across years, a spatial random effect to account for variability across sites and another spatial random effect to account for variability across habitats (bare vs seagrass).

## Model fitting and performance

### Model fitting using Markov Chain Monte Carlo 

HMSC uses a Bayesian framework for model fitting where the posterior distribution is sampled using a MCMC algorithm. For each model we ran 15 chains, each with 30,000 iterations. The first 10,000 iterations were discarded as burn-in while the remaining were thinned every 20 iterations yielding 1,000 posterior samples per chain. Hence, in total, 15,000 posterior samples were recorded for each parameter. Model convergence for each model parameter was assessed using the potential scale reduction factor [@Gelman_1992].

### Assessing model performance and interpretability

In order to independently assess models’ predictive performance, the REBENT dataset was split into a train and a test dataset. The *training dataset* includes 180 sampling units defined as unique combinations of years (varies between 6 and 9 depending on sites), sites (21) and habitats (2). From this dataset, we removed the species that occurred less than 4 times across the 180 observational units to avoid convergence issues and poor model inference, leading to the removal of 241 species. The remaining 278 species encompassed the 99 polychaeta species that made up the target community and the 142 accompanying species that were included in the *Whc* model. The *test dataset* was composed of 35 sampling units resulting from surveys conducted across two specific sites (9 years for both), which included the two habitats. To investigate jSDM’s performance, models were evaluated using a set of complementary metrics to evaluate both their explanatory (predictions compared to observations of the train dataset) and predictive (predictions compared to observations of the test dataset) powers [@Wilkinson_2020]. The performance of all models was assessed globally but also separately for each species using AUC for occurrence-based models and root mean squared errors (RMSE) for abundance-based models. We investigated whether models including additional sources of information had a higher performance than the *Bench* model using Dunn’s multiple comparison test [@Dunn_1964]. For the model that demonstrated the best improvement, we examined whether the improvement correlated with individual species occurrence or abundance (e.g., is the improvement higher for abundant species relative to than for rare species?) using the Kendall rank correlation coefficient.

While the AUC and the RMSE can be used to explore model performance globally or for each species, these measures provide no information at the community scale. Hence, we also explored qualitatively the differences between observed and predicted community composition (both for the train and test datasets) by decomposing the total beta diversity (using the Sørensen index) into species turnover and nestedness using the *betapart.temp* function from the betapart R package [@Baselga_2010 ; @Baselga_2022]. For abundance-based models, predictions were transformed to presence/absence before computing beta diversity (i.e. all predictions with abundance different than zero were considered as presences). Under this framework, a model predicting the exact observed community would have a total beta diversity of zero whereas a model predicting a community completely different from the one observed would have a total beta diversity of one. As outlined above, the Baselga’s framework allows decomposition into two components the type of error when predicting community composition: (1) getting the identity of the species wrong (turnover) or (2) predicting the right species but omitting some (nestedness). In the first case, the model will correctly predict specific richness, while in the other case the model will be more conservative in predicting the correct species but present a bias in species richness.

To assess model interpretability, we calculated the proportion of explained variance attributed either to environmental covariates (fixed effects) or to random effects. To evaluate the effect of model structure on estimated species-environment relationships, we classified the shapes of the response curves inferred from the different models according to both their direction (decline, null or increase) and their acceleration (decelerated, constant or accelerated), providing nine different categories [@Rigal_2020]. We then  looked for differences between models regarding the proportion of response curves attributed to each category. 

Finally, we checked the extent to which estimated correlation coefficients differed between the Bench model and the best performing model while also looking for evidence of inversion of effects using the following index:

$$\text{Index} = |corr_{\text{best model}} - corr_{\text{benchmark}}| * sign(corr_{\text{best model}} * corr_{\text{benchmark}})$$

# Results

The MCMC convergence and the effective sample size of the different HMSC models were satisfactory (see supporting information XXX).

## Model Fit & Predictive power

### Species level

Occurrence-based models presented an excellent explanatory power, with the AUC being on average greater than 0.9 (+@fig:explanatory_predictions_power). Their predictive power was significantly lower with the AUC being about 0.65 on average (+@fig:explanatory_predictions_power). For abundance-based models, the RMSE computed on the *training set* ranged from 8.92 to 9.34 on average. Their predictive power was heterogeneous with the *whole community* (*WhC*) model (RMSE = 5.83 on average) performing better (+@fig:explanatory_predictions_power) than the three other models (RMSE values ranged from 54.2 to 95.6, on average).

For the sake of interpretability, all models were compared against *Bench* model (+@fig:relative_change_explanation_prediction). Model’s explanatory power was not significantly improved for both *TrPh* and *Ph* models and only slightly increased for the *WhC* models (both occurrence- and abundance-based ; +@fig:explanatory_predictions_power).  This increase in explanatory power was modest with the AUC only increasing by 0.0034 ± 0.0114 (mean ± sd) for occurence-based models and the RMSE only decreasing by 0.035 ± 0.796 (mean ± sd) for abundance-based models. This improvement mainly concerned the most common and abundant species, as reflected by the negative correlations between species-specific RMSE and mean species occurrence (Kendall’s τ = -0.28, p-value < 1e-5) or mean species abundance (Kendall’s τ = -0.29, p-value < 1e-4). In terms of predictive power, performance only significantly increased for the *Whc* abundance-based model with a decrease in RMSE of 0.27 ± 0.44 (mean ± sd) relative to the *Bench* model.

### Community level

On the training set, the median Sørensen dissimilarity ranged from 0.36 to 0.38 across models (both occurrence- and abundance-based), suggesting that predicted communities are relatively similar to observed communities (+@fig:beta_part_ab and @fig:beta_part_pa). Errors were equally distributed between turnover and nestedness. With the test data set, abundance-based models presented a median Sørensen dissimilarity of 0.65 while dissimilarity reached 0.72 for occurrence-based models (+@fig:beta_part_ab and @fig:beta_part_pa). This increased dissimilarity relative to predictions made on the training dataset is a direct consequence of the degradation of the predictive power of the various models at the species scale (see above). Note that the *Whc* model makes more nestedness errors than the others, suggesting that this model is more conservative in terms of community composition (+@fig:beta_part_ab and @fig:beta_part_pa).

## Variance partitioning

The amount of variance explained by each model can be decomposed between environmental covariates and random effects. For all models, the environmental variables account for most (> 75 % ± 18, on average) of the explained variance (+@fig:var_part in supplementary material XXXX). However, compared to the *Bench* model, a larger part of variance is explained by the random effect in the *WhC* model (+@fig:var_part).For abundance-based models, the median of the relative change in variance explained by random effects relative to the *Bench* model increased by 0.086 for the *Ph* model, 0.199 for the *TrPh* model and 0.354 for the *WhC* model (+@fig:relative_change_varpart). Similar results were obtained for occurrence-based models (+@fig:relative_change_varpart).

## Species niche estimated

For abundance-based models, most response curves were neither convex nor concave. For the *Bench*, *TrPh* and *Ph* models, more than 60% of the estimated curves were flat, suggesting a lack of ecologically meaningful species-environment relationships. This rate reached more than 80% for the *WhC* model. Other species-environment relationships included constant or accelerated declines with ~10% and ~15% of such shapes for the three models that do not include the whole community. For the *WhC* model, these percentages dropped to 4.62% and 9.24%, respectively. Similar results were obtained for occurence-based models (supplementary material SX).

Considering the *TrPh* model, we further investigated the link between the first fuzzy-PCA axis obtained from the trait matrix and the seven environmental predictors to determine whether some traits were favoured (or hindered) under certain environmental conditions (+@fig:traits_effect in supplementary materials).  Both abundance and occurrence-based models highlighted potentially meaningful trait-environment relationships. For instance, mobile predatory species were more negatively affected by fetch than sessile suspensivore. We further found that increasing concentration in organic matter and decreasing current velocities were associated with a higher abundance of suspensivore populations.

## Exploring the residual correlation

Since all models included the same random effects, we qualitatively compared the residual correlations estimated by the *Bench* model to the *WhC* model both occurrence- and abundance-based. We specifically considered the *WhC* model for this specific comparison, because of (1) its higher performances relative to alternative models and (2) the larger proportion of variance explained by the random effects in this model relative to others (+@fig:relative_change_varpart supporting information).

The residual correlations estimated by the *WhC* model were similar to those estimated by the *Bench* model, whether the models were occurrence- or abundance-based (+@fig:res_corr_raw_ab & @fig:res_corr_raw_pa). Yet, the agreement between models varied depending on the random effect considered. For instance, considering abundance-based models, the correlation was low for random site effects ($\text{R}^2 = 0.66$), moderate for random habitat effects ($\text{R}^2 = 0.8$) and high for random year effects ($\text{R}^2 = 0.91$)

Our index also qualitatively identifies the residual correlations that have changed the most between the *Bench* and *WhC* models. For abundance or occurrence-based models (+@fig:res_corr_index_ab and @fig:res_corr_index_pa), the mode of our index is close to zero, confirming the agreement between the residual correlations obtained from the two models (+@fig:res_corr_raw_ab and @fig:res_corr_raw_pa). Still, our index identifies another mode toward negative values, indicating that the sign of some correlation coefficients have switched from positive to negative. For abundance-based models, the random effects Habitat, Site and Year have respectively 13.3%, 17.7% and 6% of their correlation coefficients that changed sign between the *Bench* model and the *WhC* model. Similar results were obtained for occurrence-based models.

# Discussion

<!-- ## Including non-focal species enhances predictive power

Including non-focal species in our species dataset improves the predictive power of our model with respect to our target species assemblage, whereas including phylogeny or traits does not. A first hypothesis that could explain this phenomenon would be that the model with the whole community would include biotic interactions. However, it is now established in the literature that the potential biotic signal captured by the latent variables is confounded by many confounding factors such as too low spatial resolution [@Konig_2021; @Zurell_2018] , or environmental variables not included in the model [@Blanchet_2020; @Dormann_2018; @Zurell_2018]. The absence of some environmental variables does not allow the models to estimate the entire realized niche, but the inclusion of many other species also subject to these same environmental filters enables the whole species model to include this missing information through the other species subject to the same environmental conditions [@Poggiato_2021].

Contrary to our original assumptions, in our case study, the inclusion of additional data did not improve the predictive power of our models compared to the benchmark. The lack of improvement in predictive power following the inclusion of phylogenetic data can be attributed to the use of taxonomic data as a proxy for phylogeny. At best, taxonomy approximates phylogeny and does not reflect the evolutionary history of species [@Hao_2019; @Niamir_2016]. Moreover, polychaetes are known to be diverse in their lifestyle [@Boye_2019a]. Thus, two taxonomically close species may occupy relatively different niches, rendering invalid the assumption made by this approach. 

It is recognized that the use of response traits can highlight certain responses of organisms such as plants [@Bjorkman_2018] or fishes [@Mouillot_2007] to environmental gradients, the inclusion of traits has resulted in a slight decrease in predictive power in our case study. Although our traits are derived from an expert consensus, it is not certain that the traits identified are response traits in the sense of @Violle_2007 and that the traits included in the model do not modify the realized niche of each species. It could also be that the traits used in this case study are not at fault and that the decrease in performance comes from the hierarchical structure of the HMSC model. Our trait-inclusive model also includes phylogeny: these two sources of information will interact to estimate the variance of estimated niches for each species [@Ovaskainen_2020]. Thus, if either of these data sources is uninformative, it may lead to a decline in model performance.

## Interpretability of a *jSDM* applied to a large number of species

The explanatory power of all our models is good overall - the mean AUC calculated on all polychaete species for the presence/absence models is greater than 0.9 for all species and the mean RMSE on abundances remains decent, around 9. Thus, species community variability is well explained by all our models, but their interpretability remains a challenge. Here, we successfully examined the regression coefficients of 99 species by applying the @Rigal_2020 framework to the posterior distribution of each environmental coefficient. By partitioning the explained variance, we identified that the model with the whole community relied more on latent variables. The latter allow greater flexibility in the model and thus a better fit to the data, but at the cost of more difficult interpretability.  Thus, it is difficult to understand why explanatory and predictive abilities improve for some species and degrade for others when phylogeny, traits or the whole community is included. 

The use of latent variables therefore adds a layer of complexity, which can transform "transparent" multivariate statistical models into "black boxes". However, the use of such models, hard to interpret makes it harder to accept their predictions [@Ryo_2021], verify their underlying assumptions and to debug them [@Molnar_2022]. Although the use of methods to interpret complex non-statistical models is growing in ecology [@Lucas_2020; @Ryo_2021], it is necessary to develop tools adapted to understand the ecological processes captured by jSDMs.

A first approach to study latent variables would be to analyse the residual correlations between species estimated with these latent variables. This approach is quite challenging, since it implies examining $\frac{ntimes \left(n-1\right)}{2}$ pairs of residual correlations per random effect included in the model, i.e. in our case 14,553 coefficients. The use of network metrics could solve this problem, but although the reconstruction of interaction networks is in principle possible through the latent variables of jSDM [@Momal_2020], the question of the random effect to be considered would still arise. Moreover, the use of metrics remains limited in this specific case, as co-occurrence is not a sufficient condition for interaction between species [@Blanchet_2020].

## A difficult species-rich case study that reveals potential pitfalls of jSDM on noisy ecological datasets

Sampling methods are particularly important in ecology and have a strong impact on species distribution models [REF]. These methods all generate a number of biases and our data are no exception. The organisms we sample are relatively small and may or may not form dense aggregations of several hundred thousand individuals per square meter [@Bolam_2002], so the sampling method used here to construct the faunal dataset may induce zero inflation, as well as overdispersion. The problem of zero inflation is relatively easy to solve, since the presence/absence models developed in this study allow to set up abundance models conditioned on presence (i.e. hurdle models) [@Ovaskainen_2020]. Overdispersion poses a bigger problem, since it is difficult to model this kind of data with simple statistical distributions.

The scale of environmental data acquisition may also explain some of the difficulties of models in explaining and predicting the occurrence or abundance of certain species. Indeed, the REBENT program is interested in benthic macrofauna, i.e. organisms of a few centimeters, while the environmental data are acquired with a resolution of XX. Thus, our models do not take into account the microclimates experienced by the species studied here [@Potter_2013]. In addition, there can be a high variability between the values of environmental predictors measured on the foreshore by *in situ* recorders [@Lathlean_2011] and satellite data at a coarser resolution. Using environmental data at the site scale would then increase the explanatory power of the models [@Lembrechts_2019] and probably their predictive capabilities. -->

# Conclusion

Our case study illustrates the importance of including all species in a community to improve the predictive power of a jSDM model on a particular species assemblage. Therefore, it is not necessary to acquire expensive species-specific data such as phylogenetic distances or functional traits. However, the use of these data sources is not without interest since they facilitate the understanding of the ecological processes highlighted by the model.

# Figures

## Main

![Workflow of the study](figures/workflow.png){#fig:workflow}

![Relative change in explanatory (left column) and predictive (right column) power of different model architectures with respect to the benchmark fitted with occurrence (top line) or abundance (bottom line) data.](figures/relative-change-explanation-prediction-7.png){#fig:relative_change_explanation_prediction}

![Relative change in variance explained by environmental predictors (left column) and by random effects (right column) power of different model architectures with respect to the benchmark fitted with occurrence (top line) or abundance (bottom line) data.](figures/varpart10.png){#fig:relative_change_varpart}

![Proportion of response curves according to the nomenclature defined by @Rigal_2020 for different model architectures. All models have been fitted with abundance data. Each response is characterised by a shape and an intensity.](figures/response_shape_ab.png){#fig:response_shape_ab}

![Residual correlations estimated by *Whole Community Model* (y-axis) and *Benchmark* model (x-axis) for the three random effect. The two models were fitted with abundance data.](figures/residual_correlation_raw_ab.png){#fig:res_corr_raw_ab}

![Distribution of the index mesuring the change of sign and magnitude between residual correlations estimated by the *Whole community* model and the *Benchmark* model adjusted with abundance data.](figures/residual_correlation_index_ab.png){#fig:res_corr_index_ab}

## Supplementary

![Explanatory and predictive power of the benchmark model for occurrence data. The performances are measured as AUC values.](figures/S1_AUC.png){#fig:auc}

![Comparison of the explanatory (left column) and predictive (right column) capacities of different model architectures fitted with occurrence (top line) or abundance (bottom line) data. [Mettre la légende en bas]](figures/explanatory-predictive-models.png){#fig:explanatory_predictions_power}

![Comparison of the partitioning of the variance explained for each species by each model fitted on occurrence or abundance data. Species are ordered by decreasing order of variance explained by the environment for the benchmark model.](figures/varpart-4.png){#fig:var_part}

![Partitioning of the total beta diversity into nestedness and turnover. The total beta diveristy and its partitioning were computed between  the predict commuity and the observed one on the *train set* (left column) and on the *test set* (right column) on abundance data.](figures/beta_part_ab.png){#fig:beta_part_ab}

![Partitioning of the total beta diversity into nestedness and turnover. The total beta diveristy and its partitioning were computed between  the predict commuity and the observed one on the *train set* (left column) and on the *test set* (right column) on occurence data.](figures/beta_part_pa.png){#fig:beta_part_pa}

![Explanatory power of the benchmark model for abundance data. Each dot is a species predicted for one observational unit. The y-axis represents the number of individuals observed for each species at each observational unit. The x-axis shows the number of individuals predicted by the model for each observational unit. The dotted line represents the theoretical line of perfect fit of the model to the training data.](figures/observed_predicted_train.png){#fig:pred_obs_train}

![Predictive power of the benchmark model for abundance data. Each dot is a species predicted for one observational unit. The y-axis represents the number of individuals observed for each species in each observational unit. The x-axis shows the number of individuals predicted by the model for each observational unit. The dotted line represents the theoretical line of perfect fit of the model to the test data.](figures/observed_predicted_test.png){#fig:pred_obs_test}

![Fuzzy PCA of the traits data. The first three axes explained 58.55% of the total variance](figures/traits-fpca-3.png){#fig:fuzzy_pca_traits}

![Effect of traits on the estimated species responses to environmental covariables](figures/traits-effects-axis.png){#fig:traits_effect}

![Residual correlations estimated by *Whole Community Model* (y-axis) and *Benchmark* model (x-axis) for the three random effect. The two models were fitted with abundance data.](figures/residual_correlation_raw_pa.png){#fig:res_corr_raw_pa}

![Distribution of the index mesuring the change of sign and magnitude between residual correlations estimated by the *Whole community* model and the *Benchmark* model adjusted with occurence data.](figures/residual_correlation_index_pa.png){#fig:res_corr_index_pa}

<!-- ![Correlation matrix of environmental coefficients estimated for polychaete species by the different models fitted with abundance data.](figures/corr_coeff_env_ab.png){#fig:corr_env_ab}

![Correlation matrix of environmental coefficients estimated for polychaete species by the different models fitted with occurrence data.](figures/corr_coeff_env_pa.png){#fig:corr_env_pa}

![Correlation matrix of environmental coefficients estimated for polychaete species by the different models fitted with abundance data.](figures/corr_coeff_env_ab_pa.png){#fig:corr_env_ab_pa}

![Residual correlation for the abundance models](figures/residual_corr_ab.png){#fig:residual_corr_abd}

![Residual correlation for the occurrence models](figures/residual_corr_pa.png){#fig:residual_corr_pa} -->

![Proportion of response curves according to the nomenclature defined by @Rigal_2020 for different model architectures. All models have been fitted with occurence data. Each response is characterised by a shape and an intensity.](figures/response_shape_pa.png){#fig:response_shape_pa}

# References

