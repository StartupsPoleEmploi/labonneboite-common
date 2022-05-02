from labonneboite_common.chunk import chunks


def test_chunks():
    result = chunks([1, 2], 1)
    assert list(result) == [[1], [2]]
