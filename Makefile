OBJ_NAME = ProjectName 
TEST_NAME = TestRunner 
install:
	cd build; cmake ..; make
run:
	cd build; ./$(OBJ_NAME)
test:
	cd build; ./$(TEST_NAME)
