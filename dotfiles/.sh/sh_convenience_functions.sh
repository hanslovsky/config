function show-only-common {
    comm -12 <( sort $1 )  <( sort $2 )
}
