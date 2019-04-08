module TicTacToe
    class Board
        def craftingBoard(temp)
            tam = temp.to_i
            n = 1
            tam = 3 if tam < 3
            tam = 10 if tam > 10
            tablero = Array.new(tam){Array.new(tam)}
            tablero.each_with_index do |row, idxr|
                row.each_with_index do |colum, idxc|
                    tablero[idxr][idxc] = n
                    n += 1
                end
            end
            tablero
        end

        def displayBoard(tablero)
            tablero.each_with_index do |row, idxr|
                row.each_with_index do |colum, idxc|
                    if tablero[idxr][idxc] == "X"
                        print "|  #{tablero[idxr][idxc]} |".blue
                    elsif tablero[idxr][idxc] == "O"
                        print "|  #{tablero[idxr][idxc]} |".red
                    else
                        print tablero[idxr][idxc].to_i <= 9 ? "|  #{tablero[idxr][idxc]} |" : "| #{tablero[idxr][idxc]} |"
                    end
                end
                puts
            end
            true
        end

        def coords_position(seleccion, tam, tablero, turno)
            in_use = false
            max_tam = tam ** 2

            if seleccion.to_i < 1 || seleccion.to_i > max_tam
                fake_coords = true
            else
                fake_coords = false

                tablero.each_with_index do |row, idxr|
                    row.each_with_index do |colum, idxc|
                        if tablero[idxr][idxc] == seleccion.to_i
                            tablero[idxr][idxc] = turno.upcase
                            in_use = false
                            break
                        else
                            in_use = true
                        end
                    end
                    break if in_use == false
                end
            end
            return fake_coords, in_use
        end

        def check_rows(tablero, tam)
            winner = false

            tam.times do |x|
                tam.times do |y|
                    check = tablero[x][0]
                    if tablero[x][y] == check
                        winner = true
                    else
                        winner = false
                        break
                    end
                end
                break if winner
            end
            if winner == false
                winner = check_colums(tablero, tam) 
            end
            winner
        end

        def check_colums(tablero, tam)
            winner = false

            tam.times do |x|
                tam.times do |y|
                    check = tablero[0][x]
                    if tablero[y][x] == check
                        winner = true
                    else
                        winner = false
                        break
                    end
                end
                break if winner
            end
            if winner == false
                winner = check_diagonal(tablero, tam) 
            end
            winner
        end

        def check_diagonal(tablero, tam)
            winner = false

            tam.times do |x|
                check = tablero[0][0]
                if tablero[x][x] == check
                    winner = true
                else
                    winner = false
                    break
                end
            end
            if winner == false
                winner = check_diagonal_invertida(tablero, tam) 
            end
            winner
        end

        def check_diagonal_invertida(tablero, tam)
            winner = false

            tam.times do |x|
                check = tablero[0][tam-1]
                if tablero[x][tam-x-1] == check
                    winner = true
                else
                    winner = false
                    break
                end
            end
            winner
        end

        def full_board(tablero, tam)
            full = false
            tam.times do |x|
                tam.times do |y|
                    if tablero[x][y].to_i != 0 || tablero[x][y].to_i != 0
                        full = false
                        break
                    else
                        full = true
                    end
                end
                break if full == false
            end
            full
        end
    end
end