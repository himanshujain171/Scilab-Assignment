//Guass Jordan Method to find the inverse
clc;clear;close;
a=[]
n=input("Enter order of matrix = ")
b=eye(n,n)      //Identity Matrix

for i=1:n
    for j=1:n
        printf("Enter a number for a(%d %d):",i,j)
        a(i,j)=input("");
    end
end

A=[a b]
disp("The Augmented Matrix is")
disp(A)

//Forward Elimination
for j=2:n
    for i=j:n
        if(A(j-1,j-1)==0)then
            k=j
            while(k<=n && A(k,j-1)==0)do
                k=k+1
            end
            if(k<=n)then
                A([j-1,k],:)=A([k,j-1],:)
                disp(A)
            else
                break
            end
        end
        A(i,j:2*n)=A(i,j:2*n)-A(j-1,j:2*n)*A(i,j-1)/A(j-1,j-1)
        A(i,j-1)=0
    end
    disp(A)
end

for j=n:-1:2
    for i=j-1:-1:1
        A(i,2*n:-1:n)=A(i,2*n:-1:n)-A(j,2*n:-1:n)*A(i,j)/A(j,j)
        A(i,j-1:-1:1)=A(i,j-1:-1:1)-A(j,j-1:-1:1)*A(i,j)/A(j,j)
        A(i,j)=0
    end
    disp(A)
end

for i=1:n
    if(A(i,i)~=0)then
        A(i,:)=A(i,:)/A(i,i)
    else
        printf("\n Singular Matrix , hence no inverse")
        return;
    end
end
disp(A)

printf("\nThe Inverse Matrix of A is:\n")
disp(A(1:n,n+1:2*n))
