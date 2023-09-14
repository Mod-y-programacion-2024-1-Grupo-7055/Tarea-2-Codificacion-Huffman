{-
La palabra reservada "data" nos sirve para definir tipos abstractos de datos.
En otras palabras, es la manera de definir estructuras en Haskell.

La clausula deriving es para indicar al compilador que este tipo automáticamente instancia las clases 
Eq y Ord para el nuevo tipo definido. Eso hace que de manera automática queden definidas sus funciones homónimas
eq y ord, que sirven para comparar (==)  dos elementos del tipo y ordenarlos numéricamente(<), respectivamente.

-}
data Huffman = Hoja Int Char | Nodo Int Huffman Huffman deriving (Eq,Ord)


--Función que sirve para obtener el valor de un nodo de Huffman, independientemende de si es de tipo Hoja o Nodo
valor::Huffman -> Int
valor (Hoja i _) = i
valor (Nodo i _ _) = i

{-
Del mismo modo que indicamos la instancia de Eq y Ord, podríamos instancias la clase Show; que sirve para que Haskell
sepa cómo mostrar automáticamente los tipos. Alternativamente decidimos usar la palabra reservada "instance" para
que manualmente indiquemos la forma en que queremos que represente el tipo en una cadena.
Esto es similar a la manera en que funciona el método toString en P.O.O.
-}
instance Show Huffman where
  show (Hoja i c) = "(Hoja "++ show(i) ++" "++[c]++")"
  show (Nodo i izq der) = "{Nodo "++show(i) ++ " 0:"++show(izq) ++ " 1:"++show(der)++"}"

--Función que recibe una cadena y cuenta las repeticiones de cada caracter
repeticiones :: String -> [(Int,Char)]



--Función que toma una lista de pares que representan repeticiones de caracteres (numeroRepeticiones, caracter)
-- y convierte cada par a una Hoja de Huffman y los devuelve en una lista.
aHojas:: [(Int,Char)] -> [Huffman]



--Algoritmo del quicksort, se utiliza en algunas funciones para ordenar listas
-- Hint: Sale en 6 líneas (contando la firma), usando listas por comprensión y where. Ya vimos algo de esto en un laboratorio.
quicksort::Ord a => [a]->[a]



--Función que recibe una lista de pares (Int,Char) con las repeticiones de un alfabeto
--devuelve el árbol de Huffmann correspondiente
huffman:: [(Int,Char)] -> Huffman



--Función que recibe un árbol de Huffman y devuelve el alfabeto de codificaciones de cada caracter en su hoja.
-- Es decir, una lista con pares con (caracter,representaciónBinaria) de cada elemento del árbol
alfabeto:: Huffman -> [(Char,String)]



--Función que recibe una cadena con un mensaje original y devuelve la cadena codificada, de acuerdo con las reglas
-- de la codificación de Huffman. Esta función debe: contar las repeticiones de cada caracter, construír el árbol,
-- calcular el alfabeto de codificaciones y finalmente codificar cada caracter, de acuerdo con el alfabeto.
-- Básicamente es usar las funciones que se piden anteriormente.
codifica:: String -> String



--Función que recibe una cadena de bits (0 y 1), un árbol de Huffman y decodifica la cadena según ese árbol.
decodifica:: String -> Huffman -> String


