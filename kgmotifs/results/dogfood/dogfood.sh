#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH -N 1
#SBATCH --ntasks-per-node=1

module load java/jre-1.8.0

source /home/pbloem/.bashrc

mkdir -p /local/pbloem
cp /home/pbloem/java/motive-rdf.jar /local/pbloem

cd /home/pbloem/experiments/kgmotifs/dogfood

java -jar /local/pbloem/motive-rdf.jar --experiment real-world --iterations 100000 --topk 100 --data dogfood --max-time 5
wait          # wait until programs are finished

rm -rf /local/pbloem
