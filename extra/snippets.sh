# Clippy auto fixes ############################################################

for d1 in 0*/ 1*/; do cd $d1; for d2 in */; do cd $d2; cargo clippy --fix --allow-dirty; cd ..; done; cd ..; done