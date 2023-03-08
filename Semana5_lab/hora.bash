#!/bin/bash

# Calcular la hora de la próxima clase de sistemas operativos
next_class=$(date -d "today 10:00" +"%s")
if (( $(date +"%s") >= $next_class )); then
    next_class=$(date -d "tomorrow 10:00" +"%s")
fi

# Calcular la diferencia en horas
diff_hours=$(( ($next_class - $(date +"%s")) / 3600 ))

# Mostrar el resultado
echo "Faltan $diff_hours horas para la próxima clase de sistemas operativos."

