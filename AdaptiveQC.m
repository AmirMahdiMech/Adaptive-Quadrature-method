function [] = AdaptiveQC(f,a,b,tol,N)
    global APP RL counter points
    h = (b-a)/2;
    S = h*(f(a)+4*f(a+h)+f(b))/3;
    S1 = h*(f(a)+4*f(a+h/2)+f(a+h))/6;
    S2 = h*(f(a+h)+4*f(a+3*h/2)+f(b))/6;
    counter = counter + 1;
    if abs(S1+S2-S) < 10*tol
        APP = APP + (S1+S2);
        points = [points a];
        return;
    elseif counter >= N
        RL = false;
        return;
    end
        AdaptiveQC(f,a,a+h,tol/2,N);
        AdaptiveQC(f,a+h,b,tol/2,N);
    return;
end 
