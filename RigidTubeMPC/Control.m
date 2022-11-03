function u_cur = Control(u_nominal , x_nominal , K , x)
u_feedback = K*(x - x_nominal);
u_cur = u_nominal + u_feedback;
end