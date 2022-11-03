function z = restricted_preimage(system,constraints,target)

M = [constraints.C constraints.D ; target.G*system.A target.G*system.B]; %D ro tabdil kardam be d dar inja 
l = [constraints.e; target.h-target.G*system.C];
z = Polyhedron(M,l);
%plot(z)%in restricted preimage ro rasm mikune %deghat kun ke faghat intersection ba gheyd haro rasm mikune
end