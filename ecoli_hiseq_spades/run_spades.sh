set -e
true
true
/opt/bioinf/SPAdes-3.15.4/bin/spades-hammer /home/taller-2048/GENOMICS_WORKSHOP/ecoli_hiseq_spades/corrected/configs/config.info
/usr/bin/python /opt/bioinf/SPAdes-3.15.4/share/spades/spades_pipeline/scripts/compress_all.py --input_file /home/taller-2048/GENOMICS_WORKSHOP/ecoli_hiseq_spades/corrected/corrected.yaml --ext_python_modules_home /opt/bioinf/SPAdes-3.15.4/share/spades --max_threads 16 --output_dir /home/taller-2048/GENOMICS_WORKSHOP/ecoli_hiseq_spades/corrected --gzip_output
true
true
/opt/bioinf/SPAdes-3.15.4/bin/spades-core /home/taller-2048/GENOMICS_WORKSHOP/ecoli_hiseq_spades/K21/configs/config.info
/opt/bioinf/SPAdes-3.15.4/bin/spades-core /home/taller-2048/GENOMICS_WORKSHOP/ecoli_hiseq_spades/K33/configs/config.info
/opt/bioinf/SPAdes-3.15.4/bin/spades-core /home/taller-2048/GENOMICS_WORKSHOP/ecoli_hiseq_spades/K55/configs/config.info
/opt/bioinf/SPAdes-3.15.4/bin/spades-core /home/taller-2048/GENOMICS_WORKSHOP/ecoli_hiseq_spades/K77/configs/config.info
/usr/bin/python /opt/bioinf/SPAdes-3.15.4/share/spades/spades_pipeline/scripts/copy_files.py /home/taller-2048/GENOMICS_WORKSHOP/ecoli_hiseq_spades/K77/before_rr.fasta /home/taller-2048/GENOMICS_WORKSHOP/ecoli_hiseq_spades/before_rr.fasta /home/taller-2048/GENOMICS_WORKSHOP/ecoli_hiseq_spades/K77/assembly_graph_after_simplification.gfa /home/taller-2048/GENOMICS_WORKSHOP/ecoli_hiseq_spades/assembly_graph_after_simplification.gfa /home/taller-2048/GENOMICS_WORKSHOP/ecoli_hiseq_spades/K77/final_contigs.fasta /home/taller-2048/GENOMICS_WORKSHOP/ecoli_hiseq_spades/contigs.fasta /home/taller-2048/GENOMICS_WORKSHOP/ecoli_hiseq_spades/K77/first_pe_contigs.fasta /home/taller-2048/GENOMICS_WORKSHOP/ecoli_hiseq_spades/first_pe_contigs.fasta /home/taller-2048/GENOMICS_WORKSHOP/ecoli_hiseq_spades/K77/strain_graph.gfa /home/taller-2048/GENOMICS_WORKSHOP/ecoli_hiseq_spades/strain_graph.gfa /home/taller-2048/GENOMICS_WORKSHOP/ecoli_hiseq_spades/K77/scaffolds.fasta /home/taller-2048/GENOMICS_WORKSHOP/ecoli_hiseq_spades/scaffolds.fasta /home/taller-2048/GENOMICS_WORKSHOP/ecoli_hiseq_spades/K77/scaffolds.paths /home/taller-2048/GENOMICS_WORKSHOP/ecoli_hiseq_spades/scaffolds.paths /home/taller-2048/GENOMICS_WORKSHOP/ecoli_hiseq_spades/K77/assembly_graph_with_scaffolds.gfa /home/taller-2048/GENOMICS_WORKSHOP/ecoli_hiseq_spades/assembly_graph_with_scaffolds.gfa /home/taller-2048/GENOMICS_WORKSHOP/ecoli_hiseq_spades/K77/assembly_graph.fastg /home/taller-2048/GENOMICS_WORKSHOP/ecoli_hiseq_spades/assembly_graph.fastg /home/taller-2048/GENOMICS_WORKSHOP/ecoli_hiseq_spades/K77/final_contigs.paths /home/taller-2048/GENOMICS_WORKSHOP/ecoli_hiseq_spades/contigs.paths
true
/usr/bin/python /opt/bioinf/SPAdes-3.15.4/share/spades/spades_pipeline/scripts/breaking_scaffolds_script.py --result_scaffolds_filename /home/taller-2048/GENOMICS_WORKSHOP/ecoli_hiseq_spades/scaffolds.fasta --misc_dir /home/taller-2048/GENOMICS_WORKSHOP/ecoli_hiseq_spades/misc --threshold_for_breaking_scaffolds 3
true
