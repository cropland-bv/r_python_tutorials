library(plumber)
library(stringi)

ahipify <- function(x) {
  stri_replace_all_regex(x, "[aeiou]", "ahip")
  
}


#* @apiTitle Zet je boodschap om in CROPLAND geheimtaal

#* Zet je boodschap om in CROPLAND geheimtaal
#* @param msg De boodschap die je wil omzetten
#* @get /ahipify
function(msg="") {
  return(list(status="success", message=ahipify(msg)))
  
}
