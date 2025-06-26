function [stb_point, ust_point] = ClassifyStability(stb_point, ust_point, fix_point, rE2_fixed, param)
%     threshold = 1;
    for i = 1 : length(fix_point(1,:))
        y0 = fix_point(:,i);
%         orz = false;
        f0 = solve_Jacobian(0,y0,param,rE2_fixed);
        [Jacobian, fail] = numjac(@(t,y_jac) solve_Jacobian(t, y_jac, param, rE2_fixed), 0, y0, f0, 1e-6*ones(size(y0)));
        if any(fail(:) > 0.001)
            error('Jacobian Matrix is Inaccurate');
        end
        eigenvalues = eig(Jacobian);
        if all(real(eigenvalues) < 0)
            groups = stb_point;
        else
            groups = ust_point;
        end
        groups{1}(end+1) = rE2_fixed;
        groups{2}(end+1) = y0(1);
        
        if all(real(eigenvalues) < 0)
            stb_point = groups;
        else
            ust_point = groups;
        end
    end
end
