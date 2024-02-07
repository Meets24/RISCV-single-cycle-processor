module signextension #(
  parameter InputWidth  = 12,
  parameter OutputWidth = 32
) (
  input  logic signed [InputWidth-1:0]  in_put,
  output logic signed [OutputWidth-1:0] out_put
);

  assign out_put = { {OutputWidth-InputWidth{in_put[InputWidth-1]}}, in_put };

endmodule
