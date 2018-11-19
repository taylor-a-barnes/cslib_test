module load intel/2017u4
module load intel-mpi/2017u4

cd ../
rm -rf build
mkdir build
cd build
cmake ../cslib_test
make
