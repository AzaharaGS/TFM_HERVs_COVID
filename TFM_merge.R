##Combinamos la portada y la memoria
library(qpdf)

qpdf::pdf_combine(input = c("TFM_AGS_frontpage.pdf", "TFM_memoria_AMGS.pdf"),
                  output = "TFM_AMGS_Bioinformatica_24.pdf")