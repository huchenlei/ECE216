function [ basisVector ] = FourierBasisVector2D(l, k, M, N )
    
    basisVector = zeros(M,N); %preallocate the array we need
    
    %Write the rest of the code nessecary to complete the basisVector
    %Matrix. The 2D complex exponential definition in your lab manual
    %will help with this.
    for m=0:M-1
        for n=0:N-1
            basisVector(m+1,n+1) = exp(2*pi*1i*(k*(n+1)/N + l*(m+1)/M));%Fill this part!;
        end
    end
end

