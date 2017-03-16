function [  ] = displayComplexMatrixRealPartImage( matIn )
    
    realPart = real(matIn);
    
    realPart = realPart./max(realPart(:));
    
    imshow(realPart);
    title('Image Interpretation of Re[f(m,n)]');
    %our x and y are swapped with matlab graph notation
    xlabel('n'); 
    ylabel('m');

end

