vec <- c(1,2,3) # creates a vector named vec
vec

assign("vec2", c(4,5,6))
vec2


numeric_vec <- c(1,2,3,4,5)
integer_vec <- c(1L,2L,3L,4L,5L)
logical_vec <- c(TRUE, TRUE, FALSE, FALSE, FALSE)
complex_vec <- c(12+2i, 3i, 4+1i, 5+12i, 6i)
character_vec <- c("techvidvan", "this", "is", "a", "character vector")
numeric_vec
integer_vec
logical_vec
complex_vec
character_vec

test_list <- list(1, "hello", c(2,3,1), FALSE, 3+4i, 6L)
test_list

test_list2<-list(list(1,"a",TRUE), list("b",45L,"c"), list(1,2))
str(test_list2) #shows the structure of an object

test_matrix1 <- matrix(c(1:9), ncol = 3, byrow = TRUE)
test_matrix1

rownames <- c("row1", "row2", "row3")
colnames <- c("col1", "col2", "col3")
test_matrix2 <- matrix(c(1:9), ncol = 3, dimnames = list(rownames, colnames))
test_matrix2

student_id <- c(1:5)
student_name <- c("raj", "jacob", "iqbal", "shawn", "hitesh")
student_rank <- c("third", "fifth", "second", "fourth", "first")
student.data <- data.frame(student_id , student_name, student_rank)
student.data
student.data

arr1 <- array(c(1:18),dim=c(2,3,3))
arr1

fac <- factor(c("a", "b", "a", "b", "b"))

fac

