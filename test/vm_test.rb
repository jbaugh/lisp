require 'minitest/autorun'
require_relative '../src/vm'

class VmTest < Minitest::Test
  def test_vm1
    program = '(define r 10) (define a (* 3.14 (* r r)))'
    vm = Vm.new
    vm.run(program)
    assert_equal vm.peek(:r), 10
    assert_equal vm.peek(:a), 314.0
  end

  def test_run_returns
    program = '(* 5 10 (+ 1 2))'
    vm = Vm.new
    assert_equal vm.run(program), 150
  end
end
