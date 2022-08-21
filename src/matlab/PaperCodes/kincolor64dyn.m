function [col] = kincolor64dyn(kin,legend_num,motType)
%%
% motType ==1  is kin, ==2 is dyn
cn = 1;
% xmin+rand(1,n)*(xmax-xmin)

% Kinesin-1 colors, from blue to white
if kin.type == 1 && motType == 1 %  Blue to white
    for ii = 0:legend_num
        if ii >0
            if ii > 0 && ii <= ceil(legend_num/2)
                r = 0+(rand*(0.1));
                b = 0.5 + ii/legend_num*(0.9+rand*(1-0.9));
            else
                r = ((legend_num / ceil(legend_num/2) - legend_num / ii)*(0.9+rand*(1-0.9)))-0.1;
            end
            g = (1.5*ii/legend_num )*(0.9+rand*(1-0.9));
            if g > 1
                g = 1;
            end
            
            col(cn2,:) = [r,g,b];
            cn2 = cn2 + 1;
            cn = cn+1;
        else
            cn2 = 1;
        end
    end
    
% Kinesin-2 colors, from Green to white
elseif kin.type == 1 && motType == 2 %  [0.1 0.5 0.1]
    
    for ii = 0:legend_num
        if ii >0
            if ii > 0 && ii <= ceil(legend_num/2)
                r = 0.095+(rand*(0.01)); b = r;
                g = 0.5 + ii/legend_num*(0.9+rand*(1-0.9));
            else
                g = 0.9 + rand(1)*0.1;
                r = 0.27 - 0.05*rand(1) + 0.73*(ii-ceil(legend_num/2)-1)/(legend_num - ceil(legend_num/2)-1);
            end
            if g > 1
                g = 1;
            end
            
            col(cn2,:) = [r,g,b];
            cn2 = cn2 + 1;
            cn = cn+1;
        else
            cn2 = 1;
        end
    end
        
    
    
    
    
    
    for ii = 0:legend_num
        if ii >0
            r = (legend_num - (ii-1)) / legend_num - (0.1+rand*(0.1));
            g = r;
            b = g;
            
            
%             
%             if ii > 0 && ii <= ceil(legend_num*3/4)
%                 r = 0.8+(rand*(0.02));
%             else
%                 r = 0.8 + ii / legend_num / 5 -(rand*(0.02));
%             end
%             g = 0.2 + (ii/legend_num)*4/5*(0.9+rand*(1-0.9));
%             b = g;
%             
%             col(cn2,:) = [r,g,b];
%             cn2 = cn2 + 1;
%             cn = cn+1;
            
            
%             if ii > 0 && ii <= ceil(legend_num*4/5)
%                 r = 0.8 - 0.13*(ii-1) + (0.05+rand*(0.05)) ;
%                 g =  0.2 + (0.05+rand*(0.05)) ;
%                 b = g;
%             else
%                 r =(0.03+rand*(0.03));
%                 g = 0.2 - 0.2*(ii -7) +  (0.05+rand*(0.05)) ;
%                 b = g;
%             end
            col(cn2,:) = [r,g,b];
            cn2 = cn2 + 1;
            cn = cn+1;
            
        else
            cn2 = 1;
        end
    end
    
end
col
end

