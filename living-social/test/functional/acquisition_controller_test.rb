require 'test_helper'

class AcquisitionControllerTest < ActionController::TestCase
  test "should route appropriately" do
    assert_routing "/acquisition/new", {:controller => "acquisition", :action => "new"}
    assert_routing "/acquisition/revenue", {:controller => "acquisition", :action => "revenue"}
    assert_routing({:method => 'post', :path => '/acquisition'}, {:controller => "acquisition", :action => "create"})
  end

  test "should have errors on missing file on create" do
    post :create
    assert_response :success
    assert_equal ["Please provide a file"], assigns(:errors)
  end

  test "should fail on malformed file" do
    company = ActionDispatch::Http::UploadedFile.new({
      :filename => 'malformed.tab',
      :content_type => 'application/text',
      :tempfile => fixture_file_upload('files/malformed.tab', 'application/text')
    })

    post :create, :company => company

    assert_response :success
    assert_equal 1, assigns(:errors).size
    assert_match /File upload failed on line: Snake Plissken/, assigns(:errors)[0]
  end

  test "should successfully create acquisition" do
    company = ActionDispatch::Http::UploadedFile.new({
      :filename => 'example_input.tab',
      :content_type => 'application/text',
      :tempfile => fixture_file_upload('files/example_input.tab', 'application/text')
    })

    post :create, :company => company

    assert_response :redirect
    assert_redirected_to acquisition_revenue_path(:revenue => assigns(:total))
  end

end
