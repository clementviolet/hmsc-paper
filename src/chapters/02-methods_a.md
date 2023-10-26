# Materials & Methods

We used the *HMSC* (*Hierarchical Modeling of Species Communities*) framework applied to a long-term monitoring dataset. The following subsections sequentially describe our workflow (as illustrated in @fig:chapt1workflow): (1) the *HMSC* framework, (2) the data used in this study, (3) data splitting between train and test datasets to assess the explanatory and predictive powers of models, respectively, (4) the rationales for the suite of alternative models considered and, (5) a multi-faceted framework developed to assess tradeoffs in jSDMs’ performances in relation to different study purposes.

## *Hierarchical Modelling of Species Community* (*HMSC*)

*HMSC* is a multivariate hierarchical generalized linear mixed model using Bayesian inference [@Ovaskainen_2020]. It has two parts: one for fixed effects and another for random effects. The fixed part models the species’ realized niche, where each dimension of the niche is a covariate (e.g. temperature; @fig:chapt1workflow). Including trait data can improve species niche estimates by accounting for trait-environment relationships, where species with similar traits are expected to respond similarly along environmental gradients [@Ovaskainen_2017a]. Including phylogenetic data can help capture residual ecological information not included in the available trait data, as phylogenetically-close species tend to share similar traits and niches [@Wiens_2010]. Alongside traits, phylogeny can improve niche estimates for rare species by borrowing information from similar species [@Ovaskainen_2017a ; @Ovaskainen_2017b ; @Ovaskainen_2020]. The random part of *HMSC* relies on latent variables, i.e. covariates that capture residual variance, including missing environmental features or biotic interactions [@Ovaskainen_2017a ; @Ovaskainen_2017b ; @Ovaskainen_2020]. The H matrix (site loadings) estimates missing covariate values, while the $\Lambda$ matrix (species loadings) represents species’ response to these missing covariates (@fig:chapt1workflow). 

![Study workflow. A. *Hierarchical Model of Species Community* (*HMSC*) structure, incorporating environmental variables, phylogeny, and species-specific traits. B. Data pre-processing: partitioning community data into train and test datasets, estimating phylogenetic distance (using taxonomic classification), and dimension reduction of species-trait matrix using fuzzy-PCA. C. Summary of the four alternative model structures fitted to presence/absence and abundance data: the *Bench*mark, Phylogeny, Traits & Phylogeny models only consider the targeted polychaetes, while the Whole Community model includes additional species potentially interacting with the target assemblage. Random effects for sampling year, site, and habitat were included in all models.](figures/fig1.png){#fig:chapt1workflow}

## Datasets

### Faunistic data

The *REBENT* program ([rebent.ifremer.fr](https://rebent.ifremer.fr)) is an ongoing monitoring of benthic macrofauna across multiple stations along Brittany’s coastline (Western France). Here, we used data from @Boye_2019a, covering 23 sites and two intertidal soft-bottom habitats: bare sands and seagrass meadows (Fig. S1) where infaunal communities were monitored yearly using the same protocol between 2006 and 2014. A detailed description of the sampling methodology is provided in [@Boye_2017 ; @Boye_2019a]. At each site, three faunal samples (0.03 m$^2$ cores) were taken at each of three fixed sampling points distributed 200 m apart. These samples were then pooled together to estimate abundances at the site level. For each sampling event, individuals were identified to the lowest taxonomic level possible (mostly species level; for simplicity we hereafter refer to “species”).

Overall, across a total of 375 sampling units (i.e. unique combination of years, sites and habitats), 152,583 individuals belonging to 519 species were collected and identified. To avoid convergence issues and poor model inference, we filtered out species occurring less than four times (across the 180 samples used as train set, see below), resulting in the removal of 241 species. The remaining 278 species included 99 polychaete species (the targeted assemblage) and 179 non-target species of bivalves, molluscs, and amphipoda, which may predate or compete with polychaetes [@Grall_2006 ; @Jankowska_2019]. We chose to focus on polychaetes as this taxonomic group exhibits diverse lifestyles [@Jumars_2015], can be used to monitor the health of benthic habitats [@Giangrande_2005], and because trait data and ecological information were available from previous studies [@Boye_2019a].

### Traits and phylogeny data

Traits data were retrieved from [@Boye_2019a] for the 99 polychaete species present in the train set (see below). The 11 fuzzy-coded traits available (see @Boye_2019a for details) were synthetized using a fuzzy-PCA, with the *fpca* function from the *ade4* R package [@Thioulouse_2018]. The first three axes, which account for 59% of the total variance of the trait matrix, were included in the model as synthetic traits data (@fig:chapt1workflow). The first axis distinguishes mobile predatory species from sessile microphages; the second axis differentiates semelparous species from iteroparous species; and, the third axis separates burrowers from tube-dwellers (Fig. S2).

Phylogeny was not available, hence we followed common practices [@Ovaskainen_2020] and retrieved the taxonomic classification of these 99 polychaetes through the WoRMS database ([www.marinespecies.org](https://www.marinespecies.org); january 2020) and used this information as a proxy for phylogenetic relationships (@fig:chapt1workflow ; @Ovaskainen_2020). Phylogenetic distances were then estimated using the ape R package [@Paradis_2019].

### Environmental data

Following @Boye_2019a (see Appendix A for details about data sources), we selected seven environmental variables to characterise the ecological niche of each species. These seven variables quantify different components of coastal environmental variability including hydrology (sea water temperature, salinity and current velocity), sedimentology (mud and organic matter content), substrate heterogeneity (Trask index) and local wave exposure (fetch). For each of these seven variables, the first- and second-degree polynomials were computed to account for non-linear responses.

## Comparison of alternative model structures

The first model (denoted *Bench*) only considers data for the 99 target polychaete species and the 7 environmental covariates (@fig:chapt1workflow). The second model (denoted *Ph*) adds phylogenetic data to the *Bench* model (@fig:chapt1workflow). The third model (denoted *TrPh*) adds traits data to the *Ph* model. The fourth model (denoted *WhC*) has the same structure as the *Bench* model but includes data on the whole community (278 species, including 179 additional non-target species; @fig:chapt1workflow). *WhC* excludes traits (unavailable for the non-target taxa) and phylogenetic data for faster computation. Each model was fitted twice, either with presence/absence or abundance data, using probit and lognormal Poisson distributions respectively. All models include the same random effects (@fig:chapt1workflow): temporal, spatial (sites), and habitats (bare vs seagrass).

## Model fitting

We estimated model parameters by running 5 chains using a MCMC sampling algorithm over 375,000 iterations. The first 125,000 iterations were discarded as burn-in while the remaining were thinned every 250 iterations yielding 1,000 posterior samples per chain for an overall total of 5,000 posterior samples for each parameter. We assessed convergence for each model parameter using both potential scale reduction factor [@Gelman_1992] and effective sample size as reported in supplementary materials (Appendix B). All models were fitted using the DATARMOR supercomputing facility.

## Assessing model performance and interpretability

For independent assessment of models’ predictive performance, the dataset was split into a train and a test set, instead of using strict cross-validation procedure that would have considerably increase the computational burden (see also @Norberg_2019). The train dataset consisted of 180 sampling units (21 sites; one or two habitats, and six to nine years per site; Fig. S1). The test set comprised 35 sampling units covering a 9-year period at two specific sites with both seagrass and bare sand habitats. These sites were chosen as representative of both regional macrofaunal species diversity (all the species observed in the test set are also observed in the train set) and mean environmental conditions (which limits model extrapolation outside of the trained parameter space; Fig. S3-S4; @Boye_2017 ; @Boye_2022 ; @Toumi_2023).

To assess *jSDM’s* performance, we used a set of complementary metrics to evaluate both their explanatory and predictive abilities on the train and test dataset, respectively (Table 1). AUC and RMSE, calculated only for the 99 target species (i.e. polychaetes) even for the *WhC* model that includes a total of 278 species, were used to assess overall and species-level performance for presence/absence and abundance models, respectively. Relationships between observed and predicted mean species abundances across all sites were also visualized for abundance models. 

Along with the raw AUC and RMSE values, we also visualized and quantified changes relative to the *Bench* model for the *Ph*, *TrPh* and *WhC* models. For abundance models, we computed the overall relative change in mean RMSE across species as:

$$\text{Relative change} = \frac{\text{mean}\left(\text{RMSE}_{\text{ focal model}}\right) - \text{mean}\left(\text{RMSE}_{\text{Bench}}\right)}{\text{mean}\left(\text{RMSE}_{\text{Bench}}\right)} \times 100$$ {#eq:eq1}

AUC and RMSE only partially capture model accuracy at the community scale (Table 1). To explore this aspect, we focused on differences between predicted and observed assemblage richness and total abundances (for abundance models).  We also compared observed and predicted Sørensen (for presence/absence) and Bray-Curtis (abundance) pairwise-dissimilarity matrices to explore how well $\beta$-diversity patterns were reproduced by the models. For these three metrics, we computed relative change for both the train and test datasets between mean predicted and mean observed values as follows:

$$\text{Relative change} = \frac{\text{mean}\left(\text{Metric}_{\text{ predict}}\right) - \text{mean}\left(\text{Metric}_{\text{ obs}}\right)}{\text{mean}\left(\text{Metric}_{\text{ obs}}\right)} \times 100$$ {#eq:eq2}

where “Metric” is a community-based measure (e.g. species richness, total abundance, dissimilarity matrices) estimated from model predictions or observations at the sample level (i.e. unique combination of site, habitat and year; or, pairs of samples for dissimilarity). To evaluate model interpretability, we calculated the amount of explained variance per species and the proportion that can be attributed to environmental covariates (fixed effects) and random effects. We compared the overall relative change in the proportion of variance explained by the covariates and by the random effects for the *Ph*, *TrPh* and *WhC* relative to the *Bench* model (by comparing mean values across species similarly to @eq:eq1). We also propose a novel way of exploring species-environment relationships (Table 1) by classifying the response curves estimated from the different models based on their shapes, considering both their direction (decline, null, or increase) and their acceleration (decelerated, constant, or accelerated) [@Rigal_2020]. Finally, we compared the residual co-occurrence patterns associated with each random effect of the *Bench* model with those of the best performing model (*WhC*). We quantified differences in magnitude and sign of residual species-species correlations using the following index:

$$\delta = |corr_{\text{ best model}} - corr_{\text{ Benchmark}}| \times sign(corr_{\text{ best model}} \times corr_{\text{ Benchmark}})$$ {#eq:eq3}