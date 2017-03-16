function [  ] = displayComplexMatrixRealPartPlot( matIn )
    
    realPart = real(matIn);
    
    surf(flipud(realPart));
    set(gca,'xtick',[],'ytick',[],'ztick',[])
    xlabel('n');
    ylabel('m');
    zlabel('Re[f(m,n)]');
    title('Surface Plot of Real Part of Function')

end
