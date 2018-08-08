echo "Lotto 6/49 -"
for i in {1..6}; do shuf -i 1-49 -n1; done | xargs -n6
echo -e "- We hope you win :)"
