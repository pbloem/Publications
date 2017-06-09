# shell for the job:
#PBS -S /bin/bash
# use one node with eight cores:
#PBS -lnodes=1:cores16:cpu3:mem64gb
#PBS -lwalltime=12:00:00
module load java/1.8u40

cd $HOME/experiments/fractals/runs/sierpinski-off

# call the programs
java -Xmx56g -jar $HOME/lilian/ifsem.jar --ifs.hq --type ifs --components 3 --repeats 8 --samples 500 --iterations 300 --data-source sierpinski-off --data-size 50000 --with-init --num-candidates 500 > sys.log 2>&1
wait          # wait until programs are finished
