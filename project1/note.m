function v = note(string, fret, t)
    if string == 6
        fx = 82*2^(fret/12);
        v = exp(-t/1.8).*(0.5435*sin(2*pi*fx*t) + sin(2*pi*2*fx*t) + 0.5796*sin(2*pi*3*fx*t) + 0.4323*sin(2*pi*4*fx*t)...
        + 0.04223*sin(2*pi*5*fx*t) + 0.01019*sin(2*pi*6*fx*t) + 0.02961*sin(2*pi*7*fx*t) + 0.02838*sin(2*pi*8*fx*t)...
        + 0.03048*sin(2*pi*9*fx*t) + 0.03249*sin(2*pi*10*fx*t) + 0.02729*sin(2*pi*11*fx*t));
    end

    if string == 5
        fx = 110*2^(fret/12); 
        v = exp(-t/1.8).*(0.8699*sin(2*pi*fx*t) + sin(2*pi*2*fx*t) + 0.8351*sin(2*pi*3*fx*t) + 0.3423*sin(2*pi*4*fx*t)...
        + 0.09942*sin(2*pi*5*fx*t) + 0.04029*sin(2*pi*6*fx*t) + 0.006155*sin(2*pi*7*fx*t) + 0.01486*sin(2*pi*8*fx*t)...
        + 0.01224*sin(2*pi*9*fx*t) + 0.01422*sin(2*pi*10*fx*t) + 0.009308*sin(2*pi*11*fx*t));
    end
    
    if string == 4
         fx = 147*2^(fret/12);
         v = exp(-t/1.8).*(sin(2*pi*fx*t) + 0.8203*sin(2*pi*2*fx*t) + 0.6749*sin(2*pi*3*fx*t) + 0.3867*sin(2*pi*4*fx*t)...
         + 0.04026*sin(2*pi*5*fx*t) + 0.02066*sin(2*pi*6*fx*t) + 0.002542*sin(2*pi*7*fx*t) + 0.004651*sin(2*pi*8*fx*t)...
         + 0.01059*sin(2*pi*9*fx*t) + 0.004409*sin(2*pi*10*fx*t) + 0.003416*sin(2*pi*11*fx*t));
    end
    
    if string == 3
         fx = 196*2^(fret/12);
         v = exp(-t/1.8).*(0.3981*sin(2*pi*fx*t) + sin(2*pi*2*fx*t) + 0.4618*sin(2*pi*3*fx*t) + 0.1437*sin(2*pi*4*fx*t)...
         + 0.05462*sin(2*pi*5*fx*t) + 0.01186*sin(2*pi*6*fx*t) + 0.002031*sin(2*pi*7*fx*t) + 0.005855*sin(2*pi*8*fx*t)...
         + 0.003145*sin(2*pi*9*fx*t));
    end
    
    if string == 2
         fx = 247*2^(fret/12);
         v = exp(-t/1.8).*(sin(2*pi*fx*t) + 0.7518*sin(2*pi*2*fx*t) + 0.3815*sin(2*pi*3*fx*t) + 0.1095*sin(2*pi*4*fx*t)...
         + 0.03492*sin(2*pi*5*fx*t) + 0.00826*sin(2*pi*6*fx*t));
    end
    
    if string == 1
         fx = 330*2^(fret/12);
         v = exp(-t/1.8).*(sin(2*pi*fx*t) + 0.5258*sin(2*pi*2*fx*t) + 0.2194*sin(2*pi*3*fx*t) + 0.01046*sin(2*pi*4*fx*t)...
         + 0.0158*sin(2*pi*5*fx*t));
    end
end 