require 'test_helper'

# ApplicationSystemTestCaseクラスは、システムテストの基底クラスです。
class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
end
