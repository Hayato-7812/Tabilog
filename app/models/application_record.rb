# ApplicationRecordクラスは、ActiveRecordのモデルクラスのベースとなるクラスです。
# このクラスを継承することで、アプリケーション内の他のモデルクラスがActiveRecordの機能を利用できます。
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
