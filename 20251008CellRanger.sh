#!/bin/bash
#$ -l h_rt=72:0:0
#$ -l mem_free=16G
#$ -S /bin/bash
#$ -cwd
#$ -j y
#$ -r y
#$ -M Ian.Jones3@ucsf.edu


cellranger multi --id=HumanB_Cell_multi --csv=../multi_config.csv
