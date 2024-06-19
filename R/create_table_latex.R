create_table_latex <- function( df, caption, filn = "", ... ){

	latextable <- xtable::xtable( 
	  df, 
	  caption = caption, 
	  align = rep("l", (ncol(df)+1)) 
	  )

	print(
	  latextable, 
	  hline.after = c(-1, 0), 
	  file = filn, 
	  include.rownames = FALSE, 
	  ... 
	  )
	
  return(NULL)
}

