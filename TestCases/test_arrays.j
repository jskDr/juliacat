load("../juliacat/UnitTest.j")

begin # Basic Functions
  assert_equal(1, ndims([1,2,3]))
  assert_equal((3,), size([1,2,3]))
  assert_equal(Int, eltype([1,2,3]))
  assert_equal(3, numel([1,2,3]))
  assert_equal(3, length([1,2,3]))
  assert_equal(3, nnz([1,2,3,0]))

  assert_equal(2, ndims(reshape(1:9, 3, 3)))
end
