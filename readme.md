# Measures of Effect Size (MES) Toolbox 

![screenshot](/doc/screenshot_noncentral.png)

The Measures of Effect Size (MES) Toolbox is a set of Matlab functions which compute a wide range of effect size statistics. The four main toolbox functions cover common analysis designs, including two-sample-, oneway- and twoway- data sets as well as categorical data (tables). Data may be repeated-measures (within-subjects).  
MES for contrasts can be computed. Confidence intervals are generated for the large majority of MES, either via bootstrapping or by analytical computation, in part via noncentral t, Chi square or F distributions.  
Effect size statistics are complemented by t/Chi square/F statistics and/or full ANOVA tables, which are also provided as output variables. 
The toolbox was developed by Harald Hentschke (University Hospital Tübingen) and Maik Stüttgen (University Medical Center Mainz) and is accompanied by a paper (Hentschke and Stüttgen, Eur J Neurosci 34:1887-1894, 2011).

Among the ESM available are:

* Hedges’s g
* Glass’s delta
* requivalent (point-biserial correlation)
* common language effect size
* Cohen’s U1
* Cohen’s U3
* area under the receiver-operating characteristic (AUROC) / Cliff's delta
* right/left tail ratio
* rank-biserial correlation

* standardized mean differences for contrasts
* eta squared
* partial eta squared
* omega squared
* partial omega squared

* risk difference
* risk ratio
* odds ratio
* phi
* sensitivity
* specificity
* positive predictive value
* negative predictive value
* binomial effect size display
* Cramer’s V

For more details please see the documentation in /doc (Documentation_MESToolbox.pdf, VersionHistory_MESToolbox.pdf).