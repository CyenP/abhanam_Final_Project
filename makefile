report.html: report.rmd code/render_report.R output/clean_data.rds \
  output/table_one.rds output/boxplot.png 
	Rscript code/render_report.R

output/clean_data.rds: code/00_clean_data.R raw_data/heart.csv
	Rscript code/00_clean_data.R
	
output/table_one.rds: code/01_make_table1.R output/clean_data.rds
	Rscript code/01_make_table1.R
	
output/boxplot.png: code/02_make_box.R output/clean_data.rds
	Rscript code/02_make_box.R

.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"
	
.PHONY: clean
clean: 
	rm -f output/*.rds