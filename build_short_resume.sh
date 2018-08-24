FIELD=$(cat long_marker)
RESUME=resume.md
cat markdown/$RESUME | grep -ve "$FIELD\$" > markdown/short_$RESUME
