require_relative "./TicTacToe/version"
require_relative "./TicTacToe/board"
require "colorize"

module TicTacToe
    class My_main
        playing = true
        turno = "x"
        while playing
            continues = true
            in_use = false
            fake_coords = false
            winner = false
            
            board = TicTacToe::Board.new

            print "Ingresa un número para el tamaño del tablero (ej: 3 = 3x3): ".yellow
            temp = gets.chomp
            tam = temp.to_i
            tam = 3 if temp == nil || (temp.to_i < 3 || temp.to_i > 10)
                
            
            tablero = board.craftingBoard(tam)
            board.displayBoard(tablero)
            
            while continues

                puts ""
                puts turno == "x" ? "Turno de 'x'" : "Turno de 'o'"
                print "Ingresa la ubicación tal como se muestra o 't' para terminar: ".green
                temp = gets.chomp               

                if temp == "t" || temp == "T"
                    continues = false
                    playing = false
                else
                    fake_coords, in_use = board.coords_position(temp, tam, tablero, turno)
                    while fake_coords || in_use
                        if fake_coords
                            print "Coordenadas no validas, ingresa nuevas coordenadas o 't' para terminar: ".magenta
                        elsif in_use
                            print "Ubicación ya ocupada, ingresa nuevas coordenadas o 't' para terminar: ".magenta
                        end
                        temp = gets.chomp

                        if temp == "t" || temp == "T"
                            continues = false
                            fake_coords = false
                            in_use = false
                            playing = false
                        else
                            fake_coords, in_use = board.coords_position(temp, tam, tablero, turno)
                        end

                        #Remove the comments below to run the test
                        #continues = false
                        #playing = false
                        #fake_coords = false
                    end

                    winner = board.check_rows(tablero, tam)
                    full = board.full_board(tablero, tam)
                    board.displayBoard(tablero)
                    if winner || full
                        puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
                        if winner
                            puts "$$   GANA EL JUGADOR CON TURNO '#{turno.upcase}'  $$"
                        elsif full
                            puts "$$  JUEGO SIN MOVIMIENTOS - EMPATE  $$"
                        end
                        puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
                        print "\nDeseas seguir jugando? (s/n): "
                        temp = gets.chomp
                        continues = false
                        if (temp != "s" && temp != "S")
                            playing = false 
                        end
                    end
                    turno == "x" ? turno = "o" : turno = "x"
                end
            end
        end
        puts "<<<< Gracias por jugar! >>>>\n".cyan
    end
end
