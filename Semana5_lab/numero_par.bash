#!/bin/bash

function es_primo {
  num=$1
  if ((num < 2)); then
    return 1
  fi
  for ((i = 2; i * i <= num; i++)); do
    if ((num % i == 0)); then
      return 1
    fi
  done
  return 0
}

function solicitar_numero {
  read -p "Introduce un número: " num
  if [[ ! "$num" =~ ^[0-9]+$ ]]; then
    echo "Error: \"$num\" no es un número válido."
    return 1
  fi
  if es_primo "$num"; then
    echo "$num es primo."
  else
    echo "$num no es primo."
  fi
}

trap 'echo "Error: se esperaba un número." >&2; solicitar_numero' ERR

while ! solicitar_numero; do
  :
done
