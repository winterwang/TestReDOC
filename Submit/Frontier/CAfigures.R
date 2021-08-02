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
                 # "Spirits and liqueurs",
                 "Beer lager",
                 "Ice cream",
                 "Biscuits",
                 "Crisps")

## diagnosed DM ---------------
DiagDM <- as.logical(HFood$DM4cat.y == 3)
DiagDMtab <- xtabs(~HFood$mfgLab + HFood$MealTimeSlot, subset = DiagDM)
DiagDMmatrix <- matrix(data = DiagDMtab, nrow = 59, ncol = 7, 
                       dimnames = list(rownames(DiagDMtab), colnames(DiagDMtab)))

# DiagDM.ca <- CA(DiagDMmatrix, graph = FALSE)
# fviz_ca_biplot(DiagDM.ca, 
#                repel = TRUE, title = "Biplot of Correspondence analysis among diagnosed DM.") 

## non-diabetes -----------

nonDiagDM <- as.logical(HFood$DM4cat.y == 0)
nonDiagDMtab <- xtabs(~HFood$mfgLab + HFood$MealTimeSlot, subset = nonDiagDM)
nonDiagDMmatrix <- matrix(data = nonDiagDMtab, nrow = 60, ncol = 7, 
                       dimnames = list(rownames(nonDiagDMtab), colnames(nonDiagDMtab)))

# nonDiagDM.ca <- CA(nonDiagDMmatrix, graph = FALSE)
# fviz_ca_biplot(nonDiagDM.ca, 
#                repel = TRUE, title = "Biplot of Correspondence analysis among non-diabetes participants.") 



## undiagnosed DM ---------------


unDiagDM <- as.logical(HFood$DM4cat.y == 2)
unDiagDMtab <- xtabs(~HFood$mfgLab + HFood$MealTimeSlot, subset = unDiagDM)
unDiagDMmatrix <- matrix(data = unDiagDMtab, nrow = 59, ncol = 7, 
                       dimnames = list(rownames(unDiagDMtab), colnames(unDiagDMtab)))

# unDiagDM.ca <- CA(unDiagDMmatrix, graph = FALSE)
# fviz_ca_biplot(unDiagDM.ca, 
#                repel = TRUE, title = "Biplot of Correspondence analysis among undiagnosed DM participants.") 

## Prediabetes --------

preDiagDM <- as.logical(HFood$DM4cat.y == 1)
preDiagDMtab <- xtabs(~HFood$mfgLab + HFood$MealTimeSlot, subset = preDiagDM)
preDiagDMmatrix <- matrix(data = preDiagDMtab, nrow = 59, ncol = 7, 
                       dimnames = list(rownames(preDiagDMtab), colnames(preDiagDMtab)))

# preDiagDM.ca <- CA(preDiagDMmatrix, graph = FALSE)
# fviz_ca_biplot(preDiagDM.ca, 
#                repel = TRUE, title = "Biplot of Correspondence analysis among Prediabetes participants.") 


## Total Sample --------
Totaltab <- xtabs(~HFood$mfgLab + HFood$MealTimeSlot)
Totalmatrix <- matrix(data = Totaltab, nrow = 60, ncol = 7, 
                      dimnames = list(rownames(Totaltab), colnames(Totaltab)))


## People without DM information --------

MissDM <- is.na(HFood$DM4cat.y)
MissDMtab <- xtabs(~HFood$mfgLab + HFood$MealTimeSlot, subset = MissDM)
MissDMmatrix <- matrix(data = MissDMtab, nrow = 60, ncol = 7, 
                       dimnames = list(rownames(MissDMtab), colnames(MissDMtab)))


## Total sample cafit objects for different groups --------------

ca.fit <- ca(Totalmatrix) # total sample

ca.plot <- plot(ca.fit)


ca.plot.df <- make.ca.plot.df(ca.plot,
                              row.lab = "Food Groups",
                              col.lab = "Location")
ca.plot.df$StrVariable <- ifelse(ca.plot.df$Label %in% Foodhghlght, 
                                 "highlight", ca.plot.df$Variable)

ca.plot.df$Size <- ifelse(ca.plot.df$Variable == "Location", 3, 2)
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
  scale_size(range = c(1.8, 1.8)) +
  geom_label_repel(show.legend = TRUE,
                   max.overlaps = 35,
                   segment.alpha = .4, 
                   segment.size = .2,
                   min.segment.length = 0,
                   point.padding = unit(5, "points")) +
  labs(x = paste0("Dimension 1 (", signif(dim.var.percs[1], 3), "%)"),
       y = paste0("Dimension 2 (", signif(dim.var.percs[2], 3), "%)"),
       col = "", shape = "") +
  theme_minimal() + 
  theme(plot.caption = element_text(size = 8,
                                    face = "bold"), 
        panel.grid.major = element_line(colour = "lightgray",  size = 0.2, linetype = "dotted"), 
        panel.grid.minor = element_line(size = 0.1, linetype = "dotted"), 
        axis.title = element_text(size = 10, face = "bold"), 
        axis.text = element_text(size = 10, colour = "gray0", face = "bold"), 
        plot.title = element_text(size = 10,  face = "bold", hjust = 0.5, vjust = 2), 
        panel.background = element_rect(fill = "white", 
                                        size = 0), legend.position = "none") +
  scale_color_manual(values = c("#4daf4a", "#e41a1c", "#377eb8")) + 
  # labs(title = "Correspondence Analysis of food groups and Time Slots\n in participants without DM information.",
  labs(title = "Correspondence Analysis of food groups and time slots\n in the total sample of the NDNS RP. ",
  # labs(title = "Correspondence Analysis of food groups and Time Slots\n in pre-diabetic participants in the NDNS RP. ",
  # labs(title = "Correspondence analysis of food groups and Time Slots\n in non-diabetic participants in the NDNS RP. ",
  # labs(title = "Correspondence Analysis of food groups and Time Slots\n in diabetic participants in the NDNS RP. ",
  # labs(title = "Correspondence Analysis of food groups and Time Slots\n in undiagnosed diabetics participants in the NDNS RP. ",
       colour = NULL, shape = NULL,
       caption = "Coordinates in symmetric\nAbbreviation: \nNDNS RP, National Diet and Nutrition Survery Rolling Programme\nGreen: food groups; Blue: time slots; Red: foods chosen to be tested.") +
  # , caption = "Coordinates in symmetric") +
  theme(plot.caption = element_text(hjust = 0)) 


plot(p)

# ggsave(filename = "Submit/Frontier/ResponsetoReviewer1/Fig1_big.jpg", 
#        width = 20, 
#        height = 14, 
#        device = 'jpg', 
#        dpi = 300, 
#        units = c("cm"))

ggsave(filename = "Fig1_big.jpg", 
       width = 28, 
       height = 20, 
       device = 'jpg', 
       dpi = 300, 
       units = c("cm"))
# Non DM --------------------------

ca.fit <- ca(nonDiagDMmatrix) # non-diagnosed DM


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
  scale_size(range = c(1.8, 1.8)) +
  geom_label_repel(show.legend = TRUE,
                   max.overlaps = 90,
                   segment.alpha = .4, 
                   segment.size = .2,
                   min.segment.length = 0,
                   point.padding = unit(5, "points")) +
  labs(x = paste0("Dimension 1 (", signif(dim.var.percs[1], 3), "%)"),
       y = paste0("Dimension 2 (", signif(dim.var.percs[2], 3), "%)"),
       col = "", shape = "") +
  theme_minimal() + 
  theme(plot.caption = element_text(size = 8,
                                    face = "bold"), 
        panel.grid.major = element_line(colour = "lightgray",  size = 0.2, linetype = "dotted"), 
        panel.grid.minor = element_line(size = 0.1, linetype = "dotted"), 
        axis.title = element_text(size = 10, face = "bold"), 
        axis.text = element_text(size = 10, colour = "gray0", face = "bold"), 
        plot.title = element_text(size = 10,  face = "bold", hjust = 0.5, vjust = 2), 
        panel.background = element_rect(fill = "white", 
                                        size = 0), legend.position = "none") +
  scale_color_manual(values = c("#4daf4a", "#e41a1c", "#377eb8")) + 
  # labs(title = "Correspondence Analysis of food groups and Time Slots\n in participants without DM information.",
  # labs(title = "Correspondence Analysis of food groups and 7 time slots\n in the total sample of the NDNS RP. ",
  # labs(title = "Correspondence Analysis of food groups and Time Slots\n in pre-diabetic participants in the NDNS RP. ",
       labs(title = "Correspondence analysis of food groups and Time Slots\n in non-diabetic participants in the NDNS RP. ",
       # labs(title = "Correspondence Analysis of food groups and Time Slots\n in diabetic participants in the NDNS RP. ",
       # labs(title = "Correspondence Analysis of food groups and Time Slots\n in undiagnosed diabetics participants in the NDNS RP. ",
       colour = NULL, shape = NULL,
       caption = "Coordinates in symmetric\nAbbreviation: \nNDNS RP, National Diet and Nutrition Survery Rolling Programme\nGreen: food groups; Blue: time slots; Red: foods chosen to be tested.") +
  # , caption = "Coordinates in symmetric") +
  theme(plot.caption = element_text(hjust = 0)) #+ 
  # scale_x_reverse() #+
  # scale_y_reverse()


plot(p)

# ggsave(filename = "Submit/Frontier/ResponsetoReviewer1/Fig2.jpg", 
#        width = 20, 
#        height = 14, 
#        device = 'jpg', 
#        dpi = 300, 
#        units = c("cm"))
ggsave(filename = "Fig2_big.jpg", 
       width = 28, 
       height = 20, 
       device = 'jpg', 
       dpi = 300, 
       units = c("cm"))
# diagnosed DM -------------------------------------------

ca.fit <- ca(DiagDMmatrix) # diagnosed DM


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
  scale_size(range = c(1.8, 1.8)) +
  geom_label_repel(show.legend = TRUE,
                   max.overlaps = 90,
                   segment.alpha = .4, 
                   segment.size = .2,
                   min.segment.length = 0,
                   point.padding = unit(5, "points")) +
  labs(x = paste0("Dimension 1 (", signif(dim.var.percs[1], 3), "%)"),
       y = paste0("Dimension 2 (", signif(dim.var.percs[2], 3), "%)"),
       col = "", shape = "") +
  theme_minimal() + 
  theme(plot.caption = element_text(size = 8,
                                    face = "bold"), 
        panel.grid.major = element_line(colour = "lightgray",  size = 0.2, linetype = "dotted"), 
        panel.grid.minor = element_line(size = 0.1, linetype = "dotted"), 
        axis.title = element_text(size = 10, face = "bold"), 
        axis.text = element_text(size = 10, colour = "gray0", face = "bold"), 
        plot.title = element_text(size = 10,  face = "bold", hjust = 0.5, vjust = 2), 
        panel.background = element_rect(fill = "white", 
                                        size = 0), legend.position = "none") +
  scale_color_manual(values = c("#4daf4a", "#e41a1c", "#377eb8")) + 
  labs(title = "Correspondence Analysis of food groups and time slot\n in diabetic participants in the NDNS RP. ",
       colour = NULL, shape = NULL,
       caption = "Coordinates in symmetric\nAbbreviation: \nNDNS RP, National Diet and Nutrition Survery Rolling Programme\nGreen: food groups; Blue: time slots; Red: foods chosen to be tested.") +
  theme(plot.caption = element_text(hjust = 0))  


plot(p)

# ggsave(filename = "Submit/Frontier/ResponsetoReviewer1/Fig3.jpg", 
#        width = 20, 
#        height = 14, 
#        device = 'jpg', 
#        dpi = 300, 
#        units = c("cm"))


ggsave(filename = "Fig3_big.jpg", 
       width = 28, 
       height = 20, 
       device = 'jpg', 
       dpi = 300, 
       units = c("cm"))



# un-diagnosed DM ----------------------
ca.fit <- ca(unDiagDMmatrix) # un-diagnosed DM


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
  scale_size(range = c(1.8, 1.8)) +
  geom_label_repel(show.legend = TRUE,
                   max.overlaps = 27,
                   segment.alpha = .4, 
                   segment.size = .2,
                   min.segment.length = 0,
                   point.padding = unit(5, "points")) +
  labs(x = paste0("Dimension 1 (", signif(dim.var.percs[1], 3), "%)"),
       y = paste0("Dimension 2 (", signif(dim.var.percs[2], 3), "%)"),
       col = "", shape = "") +
  theme_minimal() + 
  theme(plot.caption = element_text(size = 8,
                                    face = "bold"), 
        panel.grid.major = element_line(colour = "lightgray",  size = 0.2, linetype = "dotted"), 
        panel.grid.minor = element_line(size = 0.1, linetype = "dotted"), 
        axis.title = element_text(size = 10, face = "bold"), 
        axis.text = element_text(size = 10, colour = "gray0", face = "bold"), 
        plot.title = element_text(size = 10,  face = "bold", hjust = 0.5, vjust = 2), 
        panel.background = element_rect(fill = "white", 
                                        size = 0), legend.position = "none") +
  scale_color_manual(values = c("#4daf4a", "#e41a1c", "#377eb8")) + 
  labs(title = "Correspondence Analysis of food groups and time slots\n in undiagnosed diabetics participants in the NDNS RP. ",
       colour = NULL, shape = NULL,
       caption = "Coordinates in symmetric\nAbbreviation: \nNDNS RP, National Diet and Nutrition Survery Rolling Programme\nGreen: food groups; Blue: time slots; Red: foods chosen to be tested.") +
  theme(plot.caption = element_text(hjust = 0)) + 
  scale_y_reverse()


plot(p)

# ggsave(filename = "Submit/Frontier/ResponsetoReviewer1/Fig4.jpg", 
#        width = 20, 
#        height = 14, 
#        device = 'jpg', 
#        dpi = 300, 
#        units = c("cm"))
# 

ggsave(filename = "Fig4_big.jpg", 
       width = 28, 
       height = 20, 
       device = 'jpg', 
       dpi = 300, 
       units = c("cm"))

# Pre-diabetes -------------------------------------
ca.fit <- ca(preDiagDMmatrix) # pre-diabetes


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
  scale_size(range = c(1.8, 1.8)) +
  geom_label_repel(show.legend = TRUE,
                   max.overlaps = 27,
                   segment.alpha = .4, 
                   segment.size = .2,
                   min.segment.length = 0,
                   point.padding = unit(5, "points")) +
  labs(x = paste0("Dimension 1 (", signif(dim.var.percs[1], 3), "%)"),
       y = paste0("Dimension 2 (", signif(dim.var.percs[2], 3), "%)"),
       col = "", shape = "") +
  theme_minimal() + 
  theme(plot.caption = element_text(size = 8,
                                    face = "bold"), 
        panel.grid.major = element_line(colour = "lightgray",  size = 0.2, linetype = "dotted"), 
        panel.grid.minor = element_line(size = 0.1, linetype = "dotted"), 
        axis.title = element_text(size = 10, face = "bold"), 
        axis.text = element_text(size = 10, colour = "gray0", face = "bold"), 
        plot.title = element_text(size = 10,  face = "bold", hjust = 0.5, vjust = 2), 
        panel.background = element_rect(fill = "white", 
                                        size = 0), legend.position = "none") +
  scale_color_manual(values = c("#4daf4a", "#e41a1c", "#377eb8")) + 
  labs(title = "Correspondence Analysis of food groups and time slots\n in pre-diabetic participants in the NDNS RP. ",
       colour = NULL, shape = NULL,
       caption = "Coordinates in symmetric\nAbbreviation: \nNDNS RP, National Diet and Nutrition Survery Rolling Programme\nGreen: food groups; Blue: time slots; Red: foods chosen to be tested.") +
  theme(plot.caption = element_text(hjust = 0))  


plot(p)

# ggsave(filename = "Submit/Frontier/ResponsetoReviewer1/Fig5.jpg", 
#        width = 20, 
#        height = 14, 
#        device = 'jpg', 
#        dpi = 300, 
#        units = c("cm"))


ggsave(filename = "Fig5_big.jpg", 
       width = 28, 
       height = 20, 
       device = 'jpg', 
       dpi = 300, 
       units = c("cm"))


# DM status unknown ------------------------------------- 
ca.fit <- ca(MissDMmatrix) #unknown


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
                   segment.size = .2,
                   min.segment.length = 0,
                   point.padding = unit(5, "points")) +
  labs(x = paste0("Dimension 1 (", signif(dim.var.percs[1], 3), "%)"),
       y = paste0("Dimension 2 (", signif(dim.var.percs[2], 3), "%)"),
       col = "", shape = "") +
  theme_minimal() + 
  theme(plot.caption = element_text(size = 8,
                                    face = "bold"), 
        panel.grid.major = element_line(colour = "lightgray",  size = 0.2, linetype = "dotted"), 
        panel.grid.minor = element_line(size = 0.1, linetype = "dotted"), 
        axis.title = element_text(size = 10, face = "bold"), 
        axis.text = element_text(size = 10, colour = "gray0", face = "bold"), 
        plot.title = element_text(size = 10,  face = "bold", hjust = 0.5, vjust = 2), 
        panel.background = element_rect(fill = "white", 
                                        size = 0), legend.position = "none") +
  scale_color_manual(values = c("#4daf4a", "#e41a1c", "#377eb8")) + 
  # labs(title = "Correspondence Analysis of food groups and Time Slots\n in participants without DM information.",
  # labs(title = "Correspondence Analysis of food groups and 7 time slots\n in the total sample of the NDNS RP. ",
  labs(title = "Correspondence Analysis of food groups and Time Slots\n in pre-diabetic participants in the NDNS RP. ",
  # labs(title = "Correspondence analysis of food groups and Time Slots\n in non-diabetic participants in the NDNS RP. ",
  # labs(title = "Correspondence Analysis of food groups and Time Slots\n in diabetic participants in the NDNS RP. ",
  # labs(title = "Correspondence Analysis of food groups and Time Slots\n in undiagnosed diabetics participants in the NDNS RP. ",
       colour = NULL, shape = NULL,
       caption = "Abbreviation: \nNDNS RP, National Diet and Nutrition Survery Rolling Programme") +
  # , caption = "Coordinates in symmetric") +
  theme(plot.caption = element_text(hjust = 0)) + 
  # scale_x_reverse() #+
  scale_y_reverse()







# generate the supplementary contingency table


load("../CA-NDNSRP/HFood.Rdata")
load("../CA-NDNSRP/TFood.Rdata")
Allfood <- rbind(HFood, TFood)


freqtab <- xtabs(~Allfood$mfgLab + Allfood$MealTimeSlot)

freqtab

library(janitor)

Allfood %>% tabyl(mfgLab, MealTimeSlot) %>%
  adorn_totals(c("row", "col")) %>%
  adorn_percentages("row") %>% 
  adorn_pct_formatting(rounding = "half up", digits = 2) %>%
  adorn_ns() %>% 
  knitr::kable()




