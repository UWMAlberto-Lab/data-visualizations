## Install packages ----
install.packages(c("cowplot", "ggplot2"))

lapply(c("cowplot", "ggplot2"),
       library, character.only = T)

#------- create a panel panel using cowplot

## format aesthetics
require(cowplot)
require(ggthemes)

theme_set(theme_classic(base_size = 16))

cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")



annualTransectBiomassFig_HIRMD <- ggplot(sum_annual1,
                                         aes(Site.x, transectBiomass)) +
  geom_boxplot(aes(fill=Site.x), size=1) + 
  theme(panel.grid.major = element_line(colour = "grey90", linetype = 3)) +
  scale_fill_manual(values = cbPalette) + 
  facet_wrap(~species, ncol=1) +
  ylab("Biomass (g DW) / 20"~m^{2}) +
  xlab("") +
  theme(axis.text=element_text(size=12))+
  theme(legend.position="none")+ 
  theme(plot.title = element_text(hjust = -0.01, vjust=1.12, size =20))

annualTransectBiomassFig_HIRMD


annualTransectBiomassFig<- ggplot(sum_annual1,
                                         aes(Site.x, transectBiomass)) +
  geom_boxplot(aes(fill=Site.x), size=1) + 
  theme(panel.grid.major = element_line(colour = "grey90", linetype = 3)) +
  scale_fill_manual(values = cbPalette) + 
  facet_wrap(~species, ncol=1) +
  ylab("Biomass (g DW) / 20"~m^{2}) +
  xlab("Site") +
  theme(axis.text=element_text(size=12))+
  theme(legend.position="none")+ 
  theme(plot.title = element_text(hjust = -0.01, vjust=1.12, size =20))

annualTransectBiomassFig_HIRMD


#print multiple figures using cowplot
annualFig_HIRMD <- plot_grid(annualTransectBiomassFig_HIRMD,annualTransectBiomassFig,
                              labels = c('A', 'B', size=20), ncol=2)
