//Guassian elimination
clc;clear;close;

a=[]
b=[]

n=input("Enter order of matrix = ")

printf("Enter the elements of matrix A\n\n");
for i=1:n
    for j=1:n
        printf("a(%d %d) = ",i,j)
        a(i,j)=input("");
    end
end

printf("Enter the elements of matrix b\n\n");
for i=1:n
    printf("b(%d %d)",1,i)
    b(i,1)=input("");
end

A=[a b]
disp("The Augmented Matrix is")
disp(A)

//Forward elimination
for j=2:n
    for i=j:n
        if(A(j-1,j-1)==0)then               //If pivot is 0
            k=j
            while(k<=n && A(k,j-1)==0)do    //Check non-zero column
                k=k+1
            end
            if(k<=n)then
                A([j-1,k],:)=A([k,j-1],:)   //Row swap
                disp(A)
            else
                break;
            end
        end
        A(i,j:n+1)=A(i,j:n+1)-A(j-1,j:n+1)*A(i,j-1)/A(j-1,j-1)      //Row Transformation
        A(i,j-1)=0
    end
    disp(A)
end

for i=1:n
    if(A(i,i)~=0)then
        printf("\nPivot %d => %.2f",i,A(i,i))
    elseif(A(n,n)==0 && A(n,n+1)==0)then
        printf("\nPivot %d => %.2f",i,A(i,i))
        printf("\n\nThe system has infinitely many solutions (Temporary Breakdown)");
        return;
    else
        printf("\n\nThe system has no solution - Inconsistent (Permanent Breakdown)");
        return;
    end    
end

//Backward substitution
x(n)=A(n,n+1)/A(n,n)        
for i=n-1:-1:1
    sum=0
    for j=i+1:n
        sum=sum+A(i,j)*x(j)
    end
    x(i)=(A(i,n+1)-sum)/A(i,i)
end
for i=1:n
   printf("\nSolution x(%d) => %.2f",i,x(i))
end
