# Results

The MCMC convergence and the effective sample size of the different HMSC models were satisfactory (see Appendix B).

## Model Fit & Predictive power

### Species level

Occurrence-based models presented an excellent explanatory power, with the AUC being on average greater than 0.9 (Figure S4). Their predictive power was significantly lower with the AUC being about 0.65 on average (Figure S4). For abundance-based models, the RMSE computed on the *training set* ranged from 8.92 to 9.34 on average (Figure S4). Their predictive power was heterogeneous with the *whole community* (*WhC*) model (RMSE = 5.83 on average) performing better (Figure S4) than the three other models (RMSE values ranged from 54.2 to 95.6, on average).

For the sake of interpretability, all models were compared against *Bench* model (+@fig:fig2). Model’s explanatory power was not significantly improved for both *TrPh* and *Ph* models and only slightly increased for the *WhC* models (both occurrence- and abundance-based).  This increase in explanatory power was modest with the AUC only increasing by 0.0034 ± 0.0114 (mean ± sd) for occurence-based models and the RMSE only decreasing by 0.035 ± 0.796 (mean ± sd) for abundance-based models. This improvement mainly concerned the most common and abundant species, as reflected by the negative correlations between species-specific RMSE and mean species occurrence (Kendall’s τ = -0.28, p-value < 1e-5) or mean species abundance (Kendall’s τ = -0.29, p-value < 1e-4). In terms of predictive power, performance only significantly increased for the *Whc* abundance-based model with a decrease in RMSE of 0.27 ± 0.44 (mean ± sd) relative to the *Bench* model.

![Relative change in explanatory (left column) and predictive (right column) power of different model architectures with respect to the benchmark fitted with occurrence (top line) or abundance (bottom line) data.](figures/fig2.png){#fig:fig2}

### Community level

On the training set, the median Sørensen dissimilarity ranged from 0.36 to 0.38 across models (both occurrence- and abundance-based), suggesting that predicted communities are relatively similar to observed communities (Figure S8 and Figure S9). Errors were equally distributed between turnover and nestedness. With the test data set, abundance-based models presented a median Sørensen dissimilarity of 0.65 while dissimilarity reached 0.72 for occurrence-based models (Figure S8 and Figure S9). This increased dissimilarity relative to predictions made on the training dataset is a direct consequence of the degradation of the predictive power of the various models at the species scale (see above). Note that the *Whc* model makes more nestedness errors than the others, suggesting that this model is more conservative in terms of community composition (Figure S8 and Figure S9).

## Variance partitioning

The amount of variance explained by each model can be decomposed between environmental covariates and random effects. For all models, the environmental variables account for most (> 75 % ± 18, on average) of the explained variance (Figure S7). However, compared to the *Bench* model, a larger part of variance is explained by the random effect in the *WhC* model (Figure S7).For abundance-based models, the median of the relative change in variance explained by random effects relative to the *Bench* model increased by 0.086 for the *Ph* model, 0.199 for the *TrPh* model and 0.354 for the *WhC* model (+@fig:fig3). Similar results were obtained for occurrence-based models (+@fig:fig3).

![Relative change in variance explained by environmental predictors (left column) and by random effects (right column) power of different model architectures with respect to the benchmark fitted with occurrence (top line) or abundance (bottom line) data.](figures/fig3.png){#fig:fig3}

## Species niche estimated

For abundance-based models, most response curves were neither convex nor concave. For the *Bench*, *TrPh* and *Ph* models, more than 60% of the estimated curves were flat, suggesting a lack of ecologically meaningful species-environment relationships (+@fig:fig4). This rate reached more than 80% for the *WhC* model. Other species-environment relationships included constant or accelerated declines with ~10% and ~15% of such shapes for the three models that do not include the whole community (+@fig:fig4). For the *WhC* model, these percentages dropped to 4.62% and 9.24%, respectively (+@fig:fig4). Similar results were obtained for occurence-based models (Figure S10).

![Proportion of response curves according to the nomenclature defined by @Rigal_2020 for different model architectures. All models have been fitted with abundance data. Each response is characterised by a shape (column) and an intensity (line).](figures/fig4.png){#fig:fig4}

Considering the *TrPh* model, we further investigated the link between the first fuzzy-PCA axis obtained from the trait matrix and the seven environmental predictors to determine whether some traits were favoured (or hindered) under certain environmental conditions (Figure S6). Both abundance and occurrence-based models highlighted potentially meaningful trait-environment relationships. For instance, mobile predatory species were more negatively affected by fetch than sessile suspensivore. We further found that increasing concentration in organic matter and decreasing current velocities were associated with a higher abundance of suspensivore populations.

## Exploring the residual correlation

Since all models included the same random effects, we qualitatively compared the residual correlations estimated by the *Bench* model to the *WhC* model both occurrence- and abundance-based. We specifically considered the *WhC* model for this specific comparison, because of (1) its higher performances relative to alternative models and (2) the larger proportion of variance explained by the random effects in this model relative to others (+@fig:fig3).

The residual correlations estimated by the *WhC* model were similar to those estimated by the *Bench* model, whether the models were occurrence- or abundance-based (+@fig:fig5 and Figure S11). Yet, the agreement between models varied depending on the random effect considered. For instance, considering abundance-based models, the correlation was low for random site effects ($\text{R}^2 = 0.66$), moderate for random habitat effects ($\text{R}^2 = 0.8$) and high for random year effects ($\text{R}^2 = 0.91$)

![Comparison of residual correlations estimated by Whole Community Model and Benchmark model for the three random effect, the two models were fitted with abundance data. A. Scatter plot of the residual correlations estimated by the whole community model as a function of the residual correlations estimated by the benchmark model. B. Distribution of the index mesuring the change of sign and magnitude between residual correlations estimated by the Whole community model and the Benchmark model adjusted with abundance data.](figures/fig5.png){#fig:fig5}

Our index also qualitatively identifies the residual correlations that have changed the most between the *Bench* and *WhC* models. For abundance or occurrence-based models (+@fig:fig5 and Figure S11), the mode of our index is close to zero, confirming the agreement between the residual correlations obtained from the two models (+@fig:fig5 and Figure S11). Still, our index identifies another mode toward negative values, indicating that the sign of some correlation coefficients have switched from positive to negative. For abundance-based models, the random effects Habitat, Site and Year have respectively 13.3%, 17.7% and 6% of their correlation coefficients that changed sign between the *Bench* model and the *WhC* model. Similar results were obtained for occurrence-based models.