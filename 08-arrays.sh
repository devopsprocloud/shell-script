#!/bin/bash

FRUITS=(mango banana grape) # or we can use FRUITS("mango" "banana" "grape")

echo "First fruit is ${FRUITS[0]}."

echo "Second fruit is ${FRUITS[1]}."

echo "Third fruit is ${FRUITS[2]}."

echo "All fruits are ${FRUITS[@]}."