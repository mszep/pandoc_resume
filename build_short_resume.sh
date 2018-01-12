FIELD=$(cat long_marker)
RESUME=resume.md
cat $RESUME | grep -ve "$FIELD\$" > short_$RESUME
