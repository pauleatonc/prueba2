opcion = 0
menu = <<Menu
\n
Seleccione una opcion

1. Nombre y Primedio de notas
2. Inasistencias
3. Alumnos Aprobados
4. Salir
Menu

def nombre_promedio
  newfile = File.open('promedios.txt', 'a')
  file = File.read('notas.csv')
  promedios = ''
  file.split("\n").map do |alm|
    al = alm.split(', ')
    nom_al = al[0]
    total = al.inject(0) { |suma, item| suma + item.to_i}
    prom_al = total.to_f / (al.length - 1)
    promedios += "alumno: #{nom_al}, promedio: #{prom_al}\n"
    print promedios
    print "\n"
  end
  File.write('promedios.txt', promedios)
  newfile.close
end

def inasistencias
  newfile = File.open('inasistencias.txt', 'a')
  file = File.read('notas.csv')
  inasistencia = ''
  file.split("\n").map do |alm|
    al = alm.split(', ')
    nom_al = al[0]
    inasis = al.count('A')
    inasistencia = "alumno: #{nom_al}, inasistencias: #{inasis}\n"
    print inasistencia
    print "\n"
  end
  File.write('inasistencias.txt', inasistencia)
  newfile.close
  end

def aprobados
  newfile = File.open('aprobados.txt', 'a')
  file = File.read('notas.csv')
  file.split("\n").map do |alm|
    al = alm.split(', ')
    nom_al = al[0]
    total = al.inject(0) { |suma, item| suma + item.to_i}
    prom_al = total.to_f / (al.length - 1)
    print "#{nom_al} aprobó" if prom_al > 5
    print "\n"

  end

  newfile.close
end

while opcion != 4
  print menu
  opcion = gets.to_i
  case opcion
  when 1
    nombre_promedio
  when 2
    inasistencias
  when 3
    aprobados
  when 4
    print "\nAdiós \n\n"
  else
    print "\nError, escoge una de las alternativas \n"
  end
end
