############################################################
#                                                          #
#           confirm and recreate the CA figures            ####
#        for Frontiers - Nutrition # Date: 20210522        ####
#                                                          #
############################################################

# load the ca plot source function ---------------------------------------------


source("../ekikon-NDNSRP/makecaplot.R")
library(ca)
library(ggplot2)
library(ggrepel)
library(FactoMineR)
library(factoextra)


load("../CA-NDNSRP/HFood.Rdata")

Foodhghlght <- c("Puddings",
                 "Reg soft drinks",
                 "Sugar confectionery",
                 "Chocolate",
                 "Spirits and liqueurs",
                 "Beer lager",
                 "Ice cream",
                 "Biscuits",
                 "Crisps")

## diagnosed DM ---------------
DiagDM <- as.logical(HFood$DM4cat.y == 3)
DiagDMtab <- xtabs(~HFood$mfgLab + HFood$MealTimeSlot, subset = DiagDM)
DiagDMmatrix <- matrix(data = DiagDMtab, nrow = 59, ncol = 7, 
                       dimnames = list(rownames(DiagDMtab), colnames(DiagDMtab)))

DiagDM.ca <- CA(DiagDMmatrix, graph = FALSE)
fviz_ca_biplot(DiagDM.ca, 
               repel = TRUE, title = "Biplot of Correspondence analysis among diagnosed DM.") 

## non-diabetes -----------

nonDiagDM <- as.logical(HFood$DM4cat.y == 0)
nonDiagDMtab <- xtabs(~HFood$mfgLab + HFood$MealTimeSlot, subset = nonDiagDM)
nonDiagDMmatrix <- matrix(data = nonDiagDMtab, nrow = 60, ncol = 7, 
                       dimnames = list(rownames(nonDiagDMtab), colnames(nonDiagDMtab)))

nonDiagDM.ca <- CA(nonDiagDMmatrix, graph = FALSE)
fviz_ca_biplot(nonDiagDM.ca, 
               repel = TRUE, title = "Biplot of Correspondence analysis among non-diabetes participants.") 



## undiagnosed DM ---------------


unDiagDM <- as.logical(HFood$DM4cat.y == 2)
unDiagDMtab <- xtabs(~HFood$mfgLab + HFood$MealTimeSlot, subset = unDiagDM)
unDiagDMmatrix <- matrix(data = unDiagDMtab, nrow = 59, ncol = 7, 
                       dimnames = list(rownames(unDiagDMtab), colnames(unDiagDMtab)))

unDiagDM.ca <- CA(unDiagDMmatrix, graph = FALSE)
fviz_ca_biplot(unDiagDM.ca, 
               repel = TRUE, title = "Biplot of Correspondence analysis among undiagnosed DM participants.") 

## Prediabetes --------

preDiagDM <- as.logical(HFood$DM4cat.y == 1)
preDiagDMtab <- xtabs(~HFood$mfgLab + HFood$MealTimeSlot, subset = preDiagDM)
preDiagDMmatrix <- matrix(data = preDiagDMtab, nrow = 59, ncol = 7, 
                       dimnames = list(rownames(preDiagDMtab), colnames(preDiagDMtab)))

preDiagDM.ca <- CA(preDiagDMmatrix, graph = FALSE)
fviz_ca_biplot(preDiagDM.ca, 
               repel = TRUE, title = "Biplot of Correspondence analysis among Prediabetes participants.") 


## Total Sample --------
Totaltab <- xtabs(~HFood$mfgLab + HFood$MealTimeSlot)
Totalmatrix <- matrix(data = Totaltab, nrow = 60, ncol = 7, 
                      dimnames = list(rownames(Totaltab), colnames(Totaltab)))


## People without DM information --------

MissDM <- is.na(HFood$DM4cat.y)
MissDMtab <- xtabs(~HFood$mfgLab + HFood$MealTimeSlot, subset = MissDM)
MissDMmatrix <- matrix(data = MissDMtab, nrow = 60, ncol = 7, 
                       dimnames = list(rownames(MissDMtab), colnames(MissDMtab)))


## cafit objects for different groups

ca.fit <- ca(Totalmatrix)
ca.fit <- ca(DiagDMmatrix)
ca.fit <- ca(nonDiagDMmatrix)
ca.fit <- ca(unDiagDMmatrix)
ca.fit <- ca(preDiagDMmatrix)
ca.fit <- ca(MissDMmatrix)


ca.plot <- plot(ca.fit)


ca.plot.df <- make.ca.plot.df(ca.plot,
                              row.lab = "Food Groups",
                              col.lab = "Location")
ca.plot.df$StrVariable <- ifelse(ca.plot.df$Label %in% Foodhghlght, 
                                 "highlight", ca.plot.df$Variable)

ca.plot.df$Size <- ifelse(ca.plot.df$Variable == "Location", 2, 1)
ca.sum <- summary(ca.fit)
dim.var.percs <- ca.sum$scree[,"values2"]

p <- ggplot(ca.plot.df, aes(x = Dim1, y = Dim2,
                            col = StrVariable, shape = Variable,
                            label = Label, size = Size)) +
  geom_vline(xintercept = 0, lty = "dashed", alpha = 1) +
  geom_hline(yintercept = 0, lty = "dashed", alpha = 1) +
  geom_point() +
  scale_x_continuous(limits = range(ca.plot.df$Dim1) + c(diff(range(ca.plot.df$Dim1)) * -0.2,
                                                         diff(range(ca.plot.df$Dim1)) * 0.2)) +
  scale_y_continuous(limits = range(ca.plot.df$Dim2) + c(diff(range(ca.plot.df$Dim2)) * -0.2,
                                                         diff(range(ca.plot.df$Dim2)) * 0.2)) +
  scale_size(range = c(1.1, 1.6)) +
  geom_label_repel(show.legend = TRUE,
                   max.overlaps = 90,
                   segment.alpha = .4, 
                   min.segment.length = 0,
                   point.padding = unit(5, "points")) +
  labs(x = paste0("Dimension 1 (", signif(dim.var.percs[1], 3), "%)"),
       y = paste0("Dimension 2 (", signif(dim.var.percs[2], 3), "%)"),
       col = "", shape = "") +
  theme_minimal() + 
  theme(plot.caption = element_text(size = 10,
                                    face = "bold"), 
        panel.grid.major = element_line(colour = "lightgray",  size = 0.2, linetype = "dotted"), 
        panel.grid.minor = element_line(size = 0.1, linetype = "dotted"), 
        axis.title = element_text(size = 10), 
        axis.text = element_text(size = 10, colour = "gray0"), 
        plot.title = element_text(size = 10,  face = "bold", hjust = 0.5, vjust = 2), 
        panel.background = element_rect(fill = "white", 
                                        size = 0), legend.position = "none") +
  scale_color_manual(values = c("#4daf4a", "#e41a1c", "#377eb8")) + 
  # labs(title = "Correspondence Analysis of food groups and Time Slots\n in participants without DM information.",
  # labs(title = "Correspondence Analysis of food groups and 7 time slots\n in the total sample of the NDNS RP. ",
  # labs(title = "Correspondence Analysis of food groups and Time Slots\n in pre-diabetics participants in the NDNS RP. ",
  labs(title = "Correspondence analysis of food groups and Time Slots\n in non-diabetics participants in the NDNS RP. ",
  # labs(title = "Correspondence Analysis of food groups and Time Slots\n in diabetics. ",
  # labs(title = "Correspondence Analysis of food groups and Time Slots\n in undiagnosed diabetics. ",
       colour = NULL, shape = NULL) +
  # , caption = "Coordinates in symmetric") +
  theme(plot.caption = element_text(hjust = 0))  #+ 
  # scale_x_reverse() + 
  # scale_y_reverse()


plot(p)

ggsave(filename = "Submit/Frontier/ResponsetoReviewer1/Fig1.jpg", 
       width = 20, 
       height = 14, 
       device = 'jpg', 
       dpi = 300, 
       units = c("cm"))
ggsave(filename = "Submit/Frontier/ResponsetoReviewer1/Fig2.jpg", 
       width = 20, 
       height = 14, 
       device = 'jpg', 
       dpi = 300, 
       units = c("cm"))
ggsave(filename = "Submit/Frontier/ResponsetoReviewer1/Fig3.jpg", 
       width = 20, 
       height = 14, 
       device = 'jpg', 
       dpi = 300, 
       units = c("cm"))
ggsave(filename = "Submit/Frontier/ResponsetoReviewer1/Fig4.jpg", 
       width = 20, 
       height = 14, 
       device = 'jpg', 
       dpi = 300, 
       units = c("cm"))
ggsave(filename = "Submit/Frontier/ResponsetoReviewer1/Fig5.jpg", 
       width = 20, 
       height = 14, 
       device = 'jpg', 
       dpi = 300, 
       units = c("cm"))
