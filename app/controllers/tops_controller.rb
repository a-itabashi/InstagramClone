class TopsController < ApplicationController
  # トップページ　layoutを使わない
  def index
    render layout: false
  end
end
