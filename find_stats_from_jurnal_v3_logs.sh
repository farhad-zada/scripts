# the purpose is to look through all the log files and find if
# any of them had any issue. if yes then print out the last lines 
# of the file to the console which is enough to find the school 
# and its utis code.
LOOKING_FOR="Journal API-dan cavab alınmayan istifadəçi sayı"
echo -e "\033[32mLooking for: \"$LOOKING_FOR\"\033[0m"
for i in {1..5000}; do
  file="storage/logs/save-teachers/$i-2024-10-08.log"
  if [ -f "$file" ]; then
    # Extract the number after "Uğursuz yenilənmə sayı:"
    count=$(grep -Po "$LOOKING_FOR: \K\d+" $file | tail -1)
    if [ -n "$count" ] && [ "$count" -gt 0 ]; then
      echo "File: $file"
      tail -n 8 "$file"
    fi
  fi
done