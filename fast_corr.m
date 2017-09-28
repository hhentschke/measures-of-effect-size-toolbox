function [r,p] = fast_corr(X,Y)
% [R,P] = FAST_CORR(X,Y)
% 
% Enables the quick vectorized computation of pair-wise correlations 
% between corresponding columns of two large matrices.
% 
% -Around 6.75 times faster than using corr.m in a for loop for 100 
%   observations, 1000 variables
% -Over 11 times faster than computing the full correlation matrix using
%   corr.m
% 
% Inputs:
% X & Y,    size [n_observations x n_variables] matrices/vectors; both must
%           be of equal size to enable computation of pair-wise
%           correlations, column-by-column
% 
% Outputs:
% r,        a vector of Pearson product-moment correlation coefficients of
%           length equal to the number of columns in X and Y; columns of X 
%           and Y are correlated pair-wise
% p,        a vector of p-values corresponding to r
% 
% Author:  Elliot Layden, The University of Chicago, 2017
    
    % Check Data Sizes:
    [r1,c1] = size(X); [r2,c2] = size(Y); 
    if r1~=r2 
        error('''X'' and ''Y'' must contain the same number of rows/observations.')
    end
    if c1~=c2 
        error('''X'' and ''Y'' must contain the same number of columns/variables.')
    end
    
    % Pair-wise Removal of Rows w/ NaN's:
    %   Note: this removes any NaN-containing rows from entire matrices;
    %       otherwise speed would be sacrificed
    if any(isnan(X(:))) || any(isnan(Y(:)))
        nan1 = isnan(X); nan2 = isnan(Y);
        nans = sum([nan1,nan2],2)>0;
        X(nans) = []; Y(nans) = [];
    end
    
    % De-mean Columns:
    X = bsxfun(@minus,X,nansum(X,1)./size(X,1)); 
    Y = bsxfun(@minus,Y,nansum(Y,1)./size(Y,1));
    
    % Normalize by the L2-norm (Euclidean) of Rows:
    X = X.*repmat(sqrt(1./max(eps,nansum(abs(X).^2,1))),[size(X,1),1]); 
    Y = Y.*repmat(sqrt(1./max(eps,nansum(abs(Y).^2,1))),[size(Y,1),1]);
    
    % Compute Pair-wise Correlation Coefficients:
    r = nansum(X.*Y);
    
    % Calculate p-values if requested:
    if nargout==2
        t = (r.*sqrt(r1-2))./sqrt(1-r.^2);
        p = 2*tcdf(abs(t),(r1-2),'upper');
    end
    
end