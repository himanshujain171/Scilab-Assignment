//LUD Decomposititon
clc;clear;close;
A=[]
L=[]

n=input("Enter order of matrix = ")

printf("Enter the elements of matrix A\n\n");
for i=1:n
    for j=1:n
        printf("A(%d %d):",i,j)
        A(i,j)=input("");
    end
end

disp("Matrix A is")
disp(A)

//Gaussian Elimination - Generate U and L
for i=1:n
    for j=i:n
        if(i==j)then
            L(i,j)=A(i,j)/A(i,j)
        else
            L(i,j)=0
        end
    end 
end

for j=2:n
    for i=j:n
        if(A(j-1,j-1)==0)then
            k=j
            while(k<=n && A(k,j-1)==0)do
                k=k+1
            end
            if(k<=n)then
                A([j-1,k],:)=A([k,j-1],:)
                if(j>2)then
                    temp=L(j-1,1:j-2)
                    L(j-1,1:j-2)=L(k,1:j-2)
                    L(k,1:j-2)=temp
                end  
                disp(A)
            else
                break
            end
        end
        A(i,j:n)=A(i,j:n)-A(j-1,j:n)*A(i,j-1)/A(j-1,j-1)    //Row Transformation
        L(i,j-1)=A(i,j-1)/A(j-1,j-1)                        //Multipliers
        A(i,j-1)=0
    end
    disp(A)
end

//Diagonal Matrix
U=A
D=U
for i=1:n
    for j=i+1:n
        D(i,j)=0
        U(i,j)=U(i,j)/U(i,i)
    end
    U(i,i)=1
end

printf("\n The Upper Triangular Matrix is :\n")
disp(U)
printf("\n The Lower Triangular Matrix is :\n")
disp(L)
printf("\n The Diagonal Matrix is :\n")
disp(D)
