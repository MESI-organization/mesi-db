library(stringr)

# Function to process lines containing '$\backslash$cite'
process_cite_lines <- function(text) {
  # Define the regex pattern to detect lines with '$\backslash$cite'
  pattern <- "\\$\\\\backslash\\$cite"
  
  # Process each line
  processed_lines <- sapply(text, function(line) {
    if (str_detect(line, pattern)) {
      cat("Original line:", line, "\n")
      
      # Find the position of '$\backslash$cite'
      cite_pos <- str_locate(line, pattern)[1, ]
      before_cite <- substr(line, 1, cite_pos[2])
      after_cite <- substr(line, cite_pos[2] + 1, nchar(line))
      
      # Remove all backslashes after '$\backslash$cite'
      after_cite <- gsub("\\\\", "", after_cite)
      
      # Combine the parts
      new_line <- paste0(before_cite, after_cite, " \\\\")
      
      # Replace '$\backslash$' with a single backslash '\'
      new_line <- gsub("\\$\\\\backslash\\$", "\\\\", new_line)
      
      cat("Processed line:", new_line, "\n\n")
      return(new_line)
    } else {
      return(line)
    }
  })
  
  return(processed_lines)
}
