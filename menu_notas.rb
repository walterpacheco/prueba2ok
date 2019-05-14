def read_alum(file_name)
    file = File.open(file_name, 'r')
    alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
    file.close
    alum
end
def promedio
    aux_arr = {}
    pro=0
    alumno = read_alum('notas.csv')
    alumno.each do |item_line|
        suma=0  
        item_line.each_with_index do |elem, index|
        suma += elem.to_f if index != 0
      end
      pro = suma/(item_line.length-1).to_f
      puts "El alumno #{item_line[0]} tiene un promedio de #{pro}"
      aux_arr[item_line[0]] = suma
  end
  return aux_arr
end

def inasistencias
    alumno = read_alum('notas.csv')
    alumno.each do |item_line|
      contador=0
        item_line.each_with_index do |elem, index|
          if elem=="A"
            contador = contador+1
            puts "El alumnos #{item_line[0]} tiene #{contador} ausecias" 
          end
      end
    end
  end



  def aprobacion
    aux_arr = {}
    pro=0
    alumno = read_alum('notas.csv')
    alumno.each do |item_line|
        suma=0  
        item_line.each_with_index do |elem, index|
        suma += elem.to_f if index != 0
      end
      pro = suma/(item_line.length-1).to_f
      if pro >=5
        puts "El alumno #{item_line[0]} tiene un promedio de #{pro} por lo que aprobo"
        aux_arr[item_line[0]] = suma
      end
  end
  return aux_arr
end


  
    condition = 0
  while condition != 4
    puts "Elije una opción entre 1 y 3. 4 para salir"
    condition = gets.chomp.to_i
    case condition
    when 1
        promedio
    when 2
        inasistencias
    when 3
      aprobacion
    when 4
        puts "Hasta luego"
    else
        puts "Opción no válida"
    end 
end   
