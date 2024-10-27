function overflow_warning(q,name,bits,m)
    maxval = 2^(bits-1)-1;
    if ((q > maxval) || (q < -maxval))
        fprintf('Overflow warning on %s at time %d, value %d\n', name, m, q);
    end
end
