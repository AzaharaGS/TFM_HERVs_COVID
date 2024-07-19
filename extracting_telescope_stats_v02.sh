# Directorio
directorio_HERVs="D:/Académico/Master Bioinformatica 2022_2023/TFM/endovirusMuestrasSantiago/results_20240527/Telescope_may2024"

#nombre de archivo
archivo_stats="$directorio_HERVs/Run_stats_Telescope2.txt"
archivo_stats_encabezado="$directorio_HERVs/Run_stats_Telescope_encabezado2.txt"

#cadena que queremos reemplazar
cadena_remp="## RunInfo" 

# Procesamiento de cada archivo stats en nuestro directorio 
for filepath in "$directorio_HERVs"/*; do #busca los archivos del directorio
    # nos aseguramos de que sólo busque en los archivos stats
    if [[ -f "$filepath" && "$filepath" =~ COV[0-9]{1,2}[CE]_retro-run_stats.tsv ]]; then
        filename=$(basename "$filepath") 
        nombre_muestra=$(echo "$filename" | grep -oE 'COV[0-9]{1,2}[CE]')
        if [ -z "$nombre_muestra" ]; then
            continue
        fi

        # Leer la primera línea y reemplazar la cadena (el comentario) con el nombre de la muestra
        l1=$(head -n 1 "$filepath" | sed -E 's/[^\t]+://g')
        echo "$l1" | awk -v cadena="$cadena_remp" -v muestra="$nombre_muestra" '{gsub(cadena, muestra)}1'
    fi
done > "$archivo_stats" #generamos archivo de salida con todas las estadísticas de los archivos analizados


# creaamos nombre de columnas (campos separados por tabulador y nombre separado del valor por delimitador :)
encabezado=$(head -n 1 "$directorio_HERVs"/"$filename" | sed -E 's/:[^\t]+//g')
#como la primera columna no tiene nombre, lo creamos nosotros
nuevo_encabezado=$(echo "$encabezado" | awk 'NR==1 {sub(/## RunInfo/, "Muestra")} 1')

# Agregamos encabezado al archivo
echo "$nuevo_encabezado" > "$archivo_stats_encabezado"

#juntar ambos archivos
tail -n +1 "$archivo_stats" >> "$archivo_stats_encabezado"
#!/bin/bash



# Directorio
directorio_HERVs="D:/Académico/Master Bioinformatica 2022_2023/TFM/endovirusMuestrasSantiago/results_20240527/Telescope_may2024"

#nombre de archivo
archivo_stats="$directorio_HERVs/Run_stats_Telescope2.txt"
archivo_stats_encabezado="$directorio_HERVs/Run_stats_Telescope_encabezado2.txt"

#cadena que queremos reemplazar
cadena_remp="## RunInfo" 

# Procesamiento de cada archivo stats en nuestro directorio 
for filepath in "$directorio_HERVs"/*; do #busca los archivos del directorio
    # nos aseguramos de que sólo busque en los archivos stats
    if [[ -f "$filepath" && "$filepath" =~ COV[0-9]{1,2}[CE]_retro-run_stats.tsv ]]; then
        filename=$(basename "$filepath") 
        nombre_muestra=$(echo "$filename" | grep -oE 'COV[0-9]{1,2}[CE]')
        if [ -z "$nombre_muestra" ]; then
            continue
        fi

        # Leer la primera línea y reemplazar la cadena (el comentario) con el nombre de la muestra
        l1=$(head -n 1 "$filepath" | sed -E 's/[^\t]+://g')
        echo "$l1" | awk -v cadena="$cadena_remp" -v muestra="$nombre_muestra" '{gsub(cadena, muestra)}1'
    fi
done > "$archivo_stats" #generamos archivo de salida con todas las estadísticas de los archivos analizados


# creaamos nombre de columnas (campos separados por tabulador y nombre separado del valor por delimitador :)
encabezado=$(head -n 1 "$directorio_HERVs"/"$filename" | sed -E 's/:[^\t]+//g')
#como la primera columna no tiene nombre, lo creamos nosotros
nuevo_encabezado=$(echo "$encabezado" | awk 'NR==1 {sub(/## RunInfo/, "Muestra")} 1')

# Agregamos encabezado al archivo
echo "$nuevo_encabezado" > "$archivo_stats_encabezado"

#juntar ambos archivos
tail -n +1 "$archivo_stats" >> "$archivo_stats_encabezado"
