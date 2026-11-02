
GREEN='\033[0;32m'
RED='\033[0;31m'
RESET='\033[0m'

declare -A programs_required=(\
[mise]="mise-en-place" \
[gum]="gum" \
[python3]="python" \
[poetry]="poetry" \
[pnpm]="pnpm" \
[flatpak]="flatpak" \
[rg]="ripgrep" \
)

declare -A programs_optional=(\
[docker]="docker" \
[pipx]="pipx" \
)

if ! [ -x "$(command -v pacman)" ]; then
  echo 'ERROR: non arch linux systems not supported yet.' >&2
  exit 1
fi

echo ""
echo "=== STEP 1: REQUIRED PROGRAMS ==="
echo "checking what REQUIRED programs are installed / missing"
missing=()

for program in "${!programs_required[@]}"; do
  if ! [ -x "$(command -v "$program")" ]; then
    printf "${RED}[NOT FOUND]${RESET} %s\n" "$program"
    missing+=("$program")
  else
    printf "${GREEN}[INSTALLED]${RESET} %s\n" "$program"
  fi
done


echo ""
echo "=== STEP 2: OBS STUDIO ==="
echo "checking if/what OBS Studio is installed"

command -v obs
test $? -eq 0 \
  && printf "${GREEN}[INSTALLED]${RESET} %s\n" "obs-studio (normal)" \
  || printf "${RED}[NOT FOUND]${RESET} %s\n" "obs-studio (normal)"

flatpak info com.obsproject.Studio &>> /dev/null
test $? -eq 0 \
  && printf "${GREEN}[INSTALLED]${RESET} %s\n" "obs-studio (flatpak)" \
  || printf "${RED}[NOT FOUND]${RESET} %s\n" "obs-studio (flatpak)"


echo ""
echo "=== STEP 3: OPTIONAL PROGRAMS ==="
echo "checking what OPTIONAL programs are installed / missing"

for program in "${!programs_optional[@]}"; do
  if ! [ -x "$(command -v "$program")" ]; then
    printf "${RED}[NOT FOUND / OPTIONAL]${RESET} %s\n" "$program"
  else
    printf "${GREEN}[INSTALLED]${RESET} %s\n" "$program"
  fi
done

if [ ${#missing[@]} -gt 0 ]; then
  echo "Missing: ${missing[*]}"
  exit 1
fi
