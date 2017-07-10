### Conways Game of Life


### Two 2D arrays
### Set Rules
### Check Rules
### Grow Generation


function fillArray(){

    $array = New-Object 'object[,]' 20,20

    For($i = 1; $i -lt 20; $i++){
        For($j = 1; $j -lt 20; $j++){
            $array[$i,$j] = '0'
        }
    }   
    , $array
}


$generation1 = fillArray
$generation2 = fillArray

$generation1[5,4] = '#'
$generation1[5,5] = '#'
$generation1[5,6] = '#'
$generation1[4,6] = '#'
$generation1[3,3] = '#'


For($i = 0; $i -lt 20; $i++){
    For($j = 0; $j -lt 20; $j++){
        Write-Host -NoNewline $generation1[$i,$j]
    }
    Write-Host ""
}
Write-Host ""

$lifeCounter = 0;

### Array heck, 4 if statements, transfer generation over to generation 2
For($generationCount = 0; $generationCount -lt 50; $generationCount++){ 
    For($i = 1; $i -lt 19; $i++){
        For($j = 1; $j -lt 19; $j++){
            if ($generation1[$($i-1),$($j-1)] -eq '#'){
                $lifeCounter++
            }

            if ($generation1[$($i-1),$($j+1)] -eq '#'){
                $lifeCounter++
            }

            if ($generation1[$($i-1),$j] -eq '#'){
                $lifeCounter++
            }

            if ($generation1[$i,$($j-1)] -eq '#'){
                $lifeCounter++
            }
            
            if ($generation1[$i,$($j+1)] -eq '#'){
                $lifeCounter++
            }
            
            #if ($generation1[$i,$j] -eq '#'){
            #    $lifeCounter++
            #}


            if ($generation1[$($i+1),$j] -eq '#'){
                $lifeCounter++
            }
            
            if ($generation1[$($i+1),$($j+1)] -eq '#'){
                $lifeCounter++
            }
            
            if ($generation1[$($i+1),$($j-1)] -eq '#'){
                $lifeCounter++
            }

            #$lifeCounter

            if($lifeCounter -lt 2 -and $generation1[$i,$j] -eq '#'){
                $generation2[$i,$j] = '0'
            }

            if($lifeCounter -gt 3 -and $generation1[$i,$j] -eq '#'){
                $generation2[$i,$j] = '0'
            }

            if($lifeCounter -eq 3 -and $generation1[$i,$j] -eq '0'){
                $generation2[$i,$j] = '#'
            }  

            if($lifeCounter -eq 2 -and $generation1[$i,$j] -eq '#'){
                $generation2[$i,$j] = '#'
            }                      

            if($lifeCounter -eq 3 -and $generation1[$i,$j] -eq '#'){
                $generation2[$i,$j] = '#'
            }            

            $lifeCounter = 0
        }
    }
    For($i = 0; $i -lt 20; $i++){
        For($j = 0; $j -lt 20; $j++){
            Write-Host -NoNewline $generation2[$i,$j]
        }
        Write-Host ""
    }

    Write-Host ""

    cls

    $generation1 = $generation2
    $generation2 = fillArray

}




