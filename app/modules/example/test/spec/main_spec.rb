describe "main" do
  before(:all) do
    reconfigure_logging # reconfigure Terraspace.logger to a file
    mod_path = File.expand_path("../..", __dir__) # the source of the module to test is 2 levels up
    # Build terraspace project to use as a test harness
    # Will be located at: /tmp/terraspace/test-harnesses/example-harness
    terraspace.build_test_harness(
      name: "example-harness",
      modules: {example: mod_path},
    )
    terraspace.up("example")
  end
  after(:all) do
    terraspace.down("example")
  end

  it "successful deploy" do
    # Replace with your own test
    expect(true).to be true
    # Example
    pp terraspace.outputs
    output_value = terraspace.output("example", "name")
    # terraform generates a bucket name in the form of "terraform-20210531202051034300000001"
    expect(output_value).to include("terraform-")
  end
end
