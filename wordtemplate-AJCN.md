---
title: "Relationships between food groups, eating time slots and diabetes status in adults from the UK National Diet and Nutrition Survey (2008–2017)"
author: "Chaochen Wang^1^, Suzana Almoosawi^2^, Luigi Palla^3,4,5^"
# date: "2018年11月6日"
output: 
  redoc::redoc:
    margins: 1.0 #sets margins to 0.5 inches
    line_numbers: TRUE # adds line numbers to the document
    keep_md: TRUE
    highlight_outputs: FALSE
    reference_docx: templateAJCN.docx
bibliography: bibliography.bib
# csl: the-american-journal-of-clinical-nutrition.csl
csl: biomed-central.csl
---

<div class="redoc" id="redoc-codechunk-1">


</div>

1. Department of Public Health, Aichi Medical University, Nagakute, Aichi, JAPAN (C.W.)
3. Faculty of Medicine, School of Public Health, Imperial College London, London, UK (S.A.)
1. Department of Public Health and Infectious Diseases, University of Rome La Sapienza, Rome, Italy (L.P.)
1. Department of Medical Statistics, London School of Hygiene & Tropical Medicine, London, UK 
1. Department of Global Health, School of Tropical Medicine and Global Health, University of Nagasaki, Nagasaki, JAPAN 

Corresponding Author: Luigi Palla

Present address for L.P.: Department of Public Health and Infectious Diseases, University of Rome La Sapienza, Piazzale Aldo Moro 5, Rome, 00185, Italy. (email: Luigi.Palla\<at\>uniroma1.it)

Sources of Support: This work was supported by Grants-in-Aid for Young Scientists (grant number 19K20199 to C.W.) from the Japan Society for the Promotion of Science (JSPS).

Short running head: Food groups and time of consumption.  


<div class="redoc" id="redoc-latex-1">
<div class="redoc" id="redoc-latex-2">
\newpage

</div>

</div>
## ABSTRACT

**Background:** Time of eating has been shown to be associated with diabetes and obesity. 

**Objective:**  To identify potential relationships between foods and eating time, and see whether these associations may vary by diabetes status.

**Design:** The National Diet and Nutrition Survey (NDNS) including 6802 adults (age $\geqslant$ 19) collected 749026 food recordings by a 4-day-diary. The contingency table cross-classifying 60 food groups with 7 pre-defined eating time slots (6-9am, 9am-12pm, 12-2pm, 2-5pm, 8-10pm, 10pm-6am) were analyzed by Correspondence Analysis (CA). Biplots displaying the associations were generated for all adults and separately by diabetes status (self-reported, pre-diabetes, undiagnosed-diabetes, and non-diabetics) to explore the associations between food groups and time of eating across diabetes strata. For selected food groups, odds ratios (OR, 99% confidence intervals, CI) were derived of consuming unhealthy foods at evening/night (8pm-6am) vs. earlier in the day, by logistic regression models with generalized estimating equations.

**Results:** The biplots suggested positive associations between evening/night and consumption of puddings, regular soft drinks, sugar confectioneries, chocolates, spirits, beers, ice cream, biscuits, and crisps for all adults in the UK. The OR (99% CIs) of consuming these foods at evening/night were respectively 1.38 (1.03, 1.86), 1.74 (1.47, 2.06), 1.92 (1.38, 2.69), 3.19 (2.69, 3.79), 11.13 (8.37, 14.80), 7.19 (5.87, 8.82), 2.38 (1.79, 3.15), 1.91 (1.67, 2.16), 1.55 (1.27, 1.88) vs. earlier time. Stratified biplots found that sweetened beverages, sugar-confectioneries appeared more strongly associated with evening/night among undiagnosed diabetics.

**Conclusions:** Foods consumed in the evening/night time tend to be highly processed, easily accessible, and rich in added sugar or saturated fat. Individuals with undiagnosed diabetes are more likely to consume unhealthy foods at night. Further longitudinal studies are required to ascertain the causal direction of the association between late-eating and diabetes status.


\newpage
## INTRODUCTION

The timing of energy intake has been shown to be associated with obesity and diabetes. <span class="redoc" id="redoc-citation-1">[@almoosawi2016chrono]</span> Specifically, eating late at night or having a late dinner was found to be related to higher risk of obesity <span class="redoc" id="redoc-citation-2">[@xiao2019meal;@yoshida2018association]</span>,  hyperglycemia <span class="redoc" id="redoc-citation-3">[@nakajima2015association]</span>, metabolic syndrome <span class="redoc" id="redoc-citation-4">[@kutsuma2014potential]</span>, diabetes <span class="redoc" id="redoc-citation-5">[@mattson2014meal]</span>, and poorer glycemic control among diabetics <span class="redoc" id="redoc-citation-6">[@sakai2017late]</span>. However, the relationship between food choice and the time of food consumption during the day is left largely unknown. Shiftworkers have an increased risk of obesity <span class="redoc" id="redoc-citation-7">[@balieiro2014nutritional;@barbadoro2013rotating]</span>, and diabetes <span class="redoc" id="redoc-citation-8">[@pan2011rotating]</span>, probably due to limited availability of healthy food choice during their night shifts <span class="redoc" id="redoc-citation-9">[@bonnell2017influences;@balieiro2014nutritional]</span>. Identifying those unhealthy foods that might be chosen during late night time would be helpful when guiding people to change their eating habit for the purpose of either weight losing or maintaining glycemic control. Dietary diary recordings from national surveys can provid detailed food choice data for exploration of the relationships between food groups and their time of consumption in general population.

In this study, we aimed to describe the relationship between food groups and the time of day when they were consumed, and how such relationships may vary by status of type 2 diabetes using the data published by the Rolling Programme of the UK National Diet and Nutrition Survey from 2008 to 2017 as this survey includes diet diaries providing detailed information on the time of day of food intake.

## METHODS 

<span class="redoc" id="redoc-htmlcomment-1"><!-- expand this section to talk more about the data available with NDNS --></span>

6802 adults (2810 men and 3992 women) and 749026 food recordings collected by the UK National Diet and Nutrition Survey Rolling Programme (NDNS RP 2008-17) were analyzed in the current study <span class="redoc" id="redoc-citation-10">[@MRCElsieWiddowsonLaboratory2018]</span>. The sample was randomly drawn from a list of all addresses in the UK, clustered into postcode sectors. Details of the rationale, design and methods of the survey can be found in the previous published reports <span class="redoc" id="redoc-citation-11">[@bates2014national; @roberts2018national]</span>. Time of the day was categorized into 7 slots: 6-9 am, 9-12 noon, 12-2 pm, 2-5 pm, 5-8 pm, and 10 pm - 6 am. Foods recorded were classified into 60 standard food groups with 1 to 10 subgroups each: the details are given in Appendix R of the NDNS official report <span class="redoc" id="redoc-citation-12">[@NDNSdatabase2018]</span>. We focused on the 60 standard food groups in the current analysis. Diabetes status was defined as: 1) healthy if fasting glucose was lower than 6.10 (mmol/L), hemoglobin A1c (HbA1c) were less than 6.5 (%), and without self-reported diabetes or under treatment of diabetes (n = 2626); 2) pre-diabetic if fasting glucose was lower between 6.10 and 6.99 (inclusive) but without self-reported diabetes or under treatment of diabetes (n = 133); 3) undiagnosed diabetic if either fasting glucose was higher or equal to 7.00 (mmol/L) or HbA1c higher or equal to 6.5 (%) but without self-reported diabetes or under treatment of diabetes (n = 99); 4) diabetic if participant had self-reported diabetes or under treatment of diabetes (n = 227). Consequently, the number of adults whose diabetes status could not be confirmed was 3717 (1519 men, 2198 women) who were kept only in the whole sample (unstratified) analyses. In addition, the National Statistics Socio-economic Classification <span class="redoc" id="redoc-citation-13">[@rose2005national]</span> were applied in the survey and therefore accordingly, the socio-economic classification for the individuals' household were defined with 8 categories. 

Correspondence analysis (CA) <span class="redoc" id="redoc-citation-14">[@greenacre2017correspondence;@Chapman2017;@palla2020adolescents]</span> was used as a tool for data mining, visualisation and hypotheses generation using half of the randomly selected NDNS diary entries data. Specifically, the contingency table generated by cross-tabulating 60 food groups and 7 time slots were analyzed by CA. Through CA, the 60 categories of standard food and the 7 time slots were projected on two dimensions that could jointly contain large percentage of the $\chi^2$ deviation (or inertia) of the table. Biplots that graphically show the association between time of day and food groups were derived for all adults and separately according to their diabetes status. To account for the hierarchical structure of the data (food recorded by the same individuals who lived within the same area/sampling units) and to calculate population average odds ratios (OR), logistic regression models with generalized estimating equations (GEE) were subsequently used to test associations that were first suggested by visual inspection of biplots generated by CA, using the remaining half of the diary entries data. The marginal ORs and their 99% confidence intervals (CI) were derived of consuming unhealthy food groups selected by CA, later in ther day (8 pm - 6 am, i.e. in the evening and night) compared to earlier in the day (between morning and afternoon). CA and biplots were conducted and generated by the following packages under R environment <span class="redoc" id="redoc-citation-15">[@Rcoreteam]</span>: `FactoMineR, factoextra, ggplot2, ggrepel` <span class="redoc" id="redoc-citation-16">[@L__2008;@factoextra;@ggplot2;@ggrepel]</span>. Logistic regression models with GEE were performed with SAS procedure `GENMOD` <span class="redoc" id="redoc-citation-17">[@SAS94]</span> adjusted for age, sex, and socio-economic levels, which were deemedn the main potential confounders of the assocations. 

## RESULTS

The dataset consisted of 2810 (41.3%) men and 3992 (58.7%) women aged older than or equal to 19 years old with the mean age of 49.9 years (standard deviation, SD = 17.6). Of these individuals 22.6 % of them were current smokers, 24.3 % were past smokers. The average body mass index (BMI) was 27.7 kg/m$^2$ (SD = 5.41). Among the food recordings collected (n = 749026), 56.9% were recorded during traditional breakfast (6 am - 9 am: 14.3%), lunch (12 noon - 2 pm: 18.5%), or dinner (5 pm - 8 pm: 24.1%) time slots. Table 1. shows the top 37 food groups that contributed to 90% of the total calories consumed by adults in NDNS RP. These food groups accounted for 478028 of the total diary entries (63.8 %). The random process splitted the whole set of food recordings into a hypothesis generating dataset of 374682 and a testing dataset of 374344. 

<span class="redoc" id="redoc-htmlcomment-2"><!-- ![Figure 1. Biplot of food groups and eating time slots among total sample of NDNS RP.](img/TotalSampleCA.png) --></span>


Figure 1-5 present the CA biplots that visually summarize the associations between 60 food groups and the time of their consumption in the entire sample and then stratifying by their diabetes status. In Figure 1, the horizontal axis explains 68.9 % of the association (inertia) between food and time while the verticle axis reflects 15.3 % of the same relationship. Therefore, a total of 84.2 % of the inertia between food and time were captured in this figure which shows a visual summary of how those two categorical variables are related. Specifically, time slots later than 8 pm are shown in the upper side of the plot closer to foods contained alcoholic products (beers and spirits) or highly processed/energy-condense foods (sugar confectioneries, chocolates, biscuits, regular softdrinks, ice cream, crisps); time earlier than  noon appear in the left hand side together with typical breakfast foods (cereals, milk, bread, etc.).

<span class="redoc" id="redoc-htmlcomment-3"><!-- ![Figure 2. Biplot of food groups and eating time slots among **non-diabetics**.](img/F60T7_nonDM.png) --></span>

To visualize the potentially different associational patterns between food groups choice and time slots according to diabetes status, Figure 2-5 display the CA biplots in subsets of the data. Depending on different diabetes status, these biplots explained 76.3% to 84.1% of the inertia in the data. Similarly to the biplot created from the total sample (Figure 1), later time in the day (8 pm and later) are shown in the upper side of each figure and suggested an association with the alcoholic beverages and highly processed or energy condense food groups. Additionally, some food groups and time slots also flagged up associations potentially different by diabetes status. For example, puddings seemed to be shown more closer to later time in the day among undiagnosed diabetics (Figure 4) while for diagnosed diabetic patients (Figure 3) they were close to traditional dinner time (5 pm to 8 pm) or earlier in the day. Furthermore, sugar confectioneries/chocolates/biscuits/regular soft drinks appeared to be associated with later time in the day (8 pm or later) more strongly among undiagnosed diabetics (Figure 4) than the other participants. 

<span class="redoc" id="redoc-htmlcomment-4"><!-- ![Figure 3. Biplot of food groups and eating time slots among **diabetics**.](img/F60T7_DM.png) --></span>

Based on the findings suggested from Figure 1-5, we decided to focus on puddings, regular soft drinks, regular confectioneries, chocolates, spirits, beers, ice cream, biscuits, crisps as these foods either showed a particularly strong association with time of the day or a different pattern of association across different strata of the survey sample; hence, we tested the following hypotheses using logistic regression models (adjusted for age, sex, and socio-economic levels) with GEE: that the odds of consuming each selected food at later time of the day (8 pm - 6 am) is the same compared to earlier in the day; and the associations of the above-mentioned food groups and time slots are the same among participants with different diabetes statuses (i.e. no interaction between the time of food intake and diabetes status). The results are summarized in Table 2. 

<span class="redoc" id="redoc-htmlcomment-5"><!-- ![Figure 4. Biplot of food groups and eating time slots among **undiagnosed diabetics**.](img/F60T7_UndiagDM.png) --></span>


<span class="redoc" id="redoc-htmlcomment-6"><!-- ![Figure 5. Biplot of food groups and eating time slots among **pre-diabetics**.](img/F60T7_PreDM.png) --></span>

The listed food groups were found to be consumed during time between 8 pm and 6 am with higher odds compared to earlier time. The OR (99% CIs) main effects of consuming these foods at evening/night were for puddings 1.38 (1.03, 1.86), for regular soft drinks 1.74 (1.47, 2.06), for sugar confectioneries 1.92 (1.38, 2.69), for chocolates 3.19 (2.69, 3.79), for spirits 11.13 (8.37, 14.80), for beers 7.19 (5.87, 8.82), for ice cream 2.38 (1.79, 3.15), for biscuits 1.91 (1.67, 2.16), for crisps 1.55 (1.27, 1.88) vs. earlier time. Opposite directions of the association for puddings were detected across diabetes status: the ORs (99% CIs) for consuming puddings at night time (8 pm or later) compared to earlier time were 1.50 (1.10, 2.07),	0.89 (0.16, 4.87),	1.81 (0.41, 7.98), and	0.58 (0.14, 2.43) for healthy, prediabetic, undiagnosed diabetic, and diabetic participants, respectively. Furthermore, undiagnosed diabetic patients were found to have particularly high odds of consuming regular soft drinks (OR: 2.72; 99% CI: 1.44, 5.14), and sugar confectioneries (OR: 13.07; 99%CI: 4.59, 37.24) during night time periods than earlier time in the day and the other participants. 


<span class="redoc" id="redoc-htmlcomment-7"><!-- <div class="redoc" id="redoc-codechunk-2">
```{r fig1, eval=TRUE, echo=FALSE, out.width= '100%',cache=TRUE, fig.cap="", fig.align='center'} -->
<!-- knitr::include_graphics("img/TotalSampleCA.png") -->
<!-- ``` 

</div>--></span>
 

## DISCUSSION 

The present study described the potential relationships between food groups and time of their consumption in a representative sample from the NDNS RP. All unhealthy foods emerged from CA were found to be more likely to be consumed after 8 pm. These included alcoholic/sweetened beverages, chocolates and other foods rich in added sugars and saturated fats such as biscuits and ice cream. Foods chosen in the evening/night time slots tend to be highly processed and easily accessible. Specifically, undiagnosed patients might be at a higher risk of worsening their condition as they were found to have higher odds to choose a number of less healthy foods after 8 pm (sugar confectioneries, regular soft drinks) compared to earlier time than diabetics and non-diabetics. Those food might need to be targeted when designing intervention to those who might be at risk of being diabetics. 

These findings are concerning considering previous research that have indicated that quality of macronutrient intake in the evening is likely to influence fasting glucose levels and glycaemic response to subsequent meals in the morning. <span class="redoc" id="redoc-citation-18">[@Wolever1988]</span> More recently, a randomized controlled trial indicated that consuming carbohydrates at dinner irrespective of glycaemic index raised postprandial glucose response to breakfast producing what is known as a second meal effect <span class="redoc" id="redoc-citation-19">[@Haldar2020]</span>. Similar observation have been made by Nitta and colleagues who observed that eating sweet snacks post-dinner worsened glycaemic excursions in the evening and at subsequent breakfast. <span class="redoc" id="redoc-citation-20">[@Nitta2019]</span> Added to this is evidence that suggests that the late-night dinners induce post-prandial hyperglycemia in patients with type 2 diabetes and that interventions at this eating occassions can reult in a profound impact on postprandial glycaemia. On the balance of this evidence, targeting and improving the timing and quality of foods in evening eating occasions provides a unique opportunity to design intervention to those who might be at risk of being diabetics. 


A compelling finding of our study is the observation that diabetes patients were found to be potentially controlling their choice of food groups such as avoiding puddings at night. However, higher odds of consuming alcoholic beverages and energy condensed foods such as chocolates and sugar confectioneries at night among individuals with diabetes suggests that their food choice might need further modifications. 

Assessing the relationships between food groups and timing of eating by diabetes status can be considered as a first step towards identifying specific public health targets for behavior change/intervention. This is important as most current public health strategies and dietary recommendations do not provide targeted advice that takes into considerations specific eating occasions while targeted advice is more likely to result in sustainable behavioural change. Our findings are consistent with previous evidence that has found that both sweetened and alcoholic beverages are responsible for large portion of energy consumption at night in other populations <span class="redoc" id="redoc-citation-21">[@Hassen2018]</span>. 


An important limitation in this study is the cross-sectional study design. The inability to assess the temporal relationship between timing of food intake and diabetes status means that a cause-effect relationship between time of unhealthy food intake and diabetes status cannot be established. Hence, further prospecitive studies are warranted to investigate the temporal relationship between diabetes and other disease status in relation to both quality and timing of eating. Moreover, the current study assumes that mis-reporting occured equally amongst all eating occasions. This limitation has been reported by previous research and is a limitation of chrono-nutrition. <span class="redoc" id="redoc-citation-22">[@FayetMoore2017]</span>


### Conclusions

In conclusion, our study indicates that... 



## ACKNOWLEDGEMENT 

## CONFLIT OF INTEREST (COI) STATEMENT
The authors declared no conflicts of interest.

## AUTHOR'S CONTRIBUTIONS

CW, SA, and LP: designed research and had primary responsibility for final content; CW and LP performed statistical analysis; and all authors: wrote the manuscript, read and approved the final manuscript.

#####

## REFERENCES



