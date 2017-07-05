BEGIN {IFS="\t";print "#"}
FNR == 1 || (system("[ ! -f ../iaps/" $1 ".jpg ]") == 0) {next}
FNR == NR {for(i = 0 ; i < 4 ; i++)
	T[$1][i] = $(i * 2 + 4)}
FNR != NR {for(i = 0 ; i < 4 ; i++)
	T[$1][i + 4] = $(i * 2 + 4)}
END {for(r in T){
	printf("\47%s.jpg\47", r);
	for(i = 0 ; i < 8 ; i++)
		printf(",%d", T[r][i] * 1000)
	print ""}}
