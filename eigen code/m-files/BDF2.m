function [LHS, RHS] = BDF2(timestep, M, B, C,sol)
    LHS = 3/2 * M - timestep/M * B;  % error
    RHS = 2 * sol(1) - 0.5 * sol(2) + timestep/M * C; % error
    disp('test')
    disp(LHS)
    disp(RHS)
    LHS = 3/2 * M - timestep * B;
    RHS = 2 * M * sol(1) - 1/2 * M * sol(2) + timestep * C;
    
end

