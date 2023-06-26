; Define the list of words.
wordList := "apple,banana,carrot,dog,elephant,fox,grape,house,ice cream,jellyfish,kangaroo,lion,mango,nutella,orange,pineapple,quail,rabbit,strawberry,turtle,umbrella,vanilla,walnut,x-ray,yellow,zoo"

; Create the autocomplete function.
^!t::
    InputBox, UserInput, Enter text:, , , 200
    if (UserInput != "")
    {
        Loop, Parse, wordList, `,
        {
            if (InStr(A_LoopField, UserInput))
            {
                Send % A_LoopField
                break
            }
        }
    }
return

