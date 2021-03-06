# test_all.jl
#                           wookay.noh at gmail.com

IsNotMain = true

for test = split(strip("""
test_arrays.jl
test_control_flow.jl
test_docs.jl
test_fft.jl
test_floating_point_functions.jl
test_functions.jl
test_hangul.jl
test_iteration.jl
test_mathematical_operations.jl
test_metaprogramming.jl
test_parallel_computing.jl
test_promotion.jl
test_strings.jl
test_types.jl
test_ranges.jl
"""), "\n")
  include(test)
end

ignores = """
test_code_native.jl
test_ccall.jl
test_say.jl
test_jump.jl
"""

UnitTest.run()
