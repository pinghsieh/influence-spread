function output = obj_func(input, obj_id)
switch obj_id
    case 1
        output = -1/input;
    case 2
        output = input;
    case 3
        output = -1/(input^2);
end