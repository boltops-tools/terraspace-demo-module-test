# Testing Modules Example

This is a Terraspace project to show how to test a module.

* This helps answer this forum question: [Terratest testing module](https://community.boltops.com/t/terratest-testing-module/708)
* [Terraspace Docs: Module-Level Testing](https://terraspace.cloud/docs/testing/module/)

## Generate example boiler plate

We can use [terraspace new test]({% link _reference/terraspace-new-test.md %}) run from the **root** of the terraspace project to create a `app/modules/example/test/spec/main_spec.rb` test.

    terraspace new test example --type module

Note, we have already:

1. generated an example test for the example module in this repo
2. edit the example so it checks for the bucket name

## Run Tests

To run the test, you should be **within** in the module folder itself.

    cd app/modules/example
    bundle
    terraspace test

## Output Example


    $ cd app/modules/example
    $ terraspace test
    => cd test && bundle exec rspec

    main
    Terraspace.logger has been reconfigured to /tmp/terraspace/log/test.log
    Building test harness at: /tmp/terraspace/test-harnesses/example-harness
    Test harness built.
    => terraspace up example -y

    An execution plan has been generated and is shown below.
    Resource actions are indicated with the following symbols:
      + create

    Terraform will perform the following actions:
      # aws_s3_bucket.this will be created
      + resource "aws_s3_bucket" "this" {
          + acceleration_status         = (known after apply)
          + acl                         = "private"
          + arn                         = (known after apply)
          + bucket                      = (known after apply)
          + bucket_domain_name          = (known after apply)
          + bucket_regional_domain_name = (known after apply)
          + force_destroy               = false
          + hosted_zone_id              = (known after apply)
          + id                          = (known after apply)
          + region                      = (known after apply)
          + request_payer               = (known after apply)
          + tags_all                    = (known after apply)
          + website_domain              = (known after apply)
          + website_endpoint            = (known after apply)
          + versioning {
              + enabled    = (known after apply)
              + mfa_delete = (known after apply)
            }
        }
    Plan: 1 to add, 0 to change, 0 to destroy.

    Changes to Outputs:
      + name = (known after apply)
    ------------------------------------------------------------------------
    This plan was saved to: /tmp/terraspace/plans/example-33c955bd6d416c613e76c699ad3bc437.plan
    To perform exactly these actions, run the following command to apply:
        terraform apply "/tmp/terraspace/plans/example-33c955bd6d416c613e76c699ad3bc437.plan"
    aws_s3_bucket.this: Creating...
    aws_s3_bucket.this: Creation complete after 1s [id=terraform-20210531205108563900000001]

    Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

    The state of your infrastructure has been saved to the path
    below. This state is required to modify and destroy your
    infrastructure, so keep it safe. To inspect the complete state
    use the `terraform show` command.

    State path: terraform.tfstate

    Outputs:

    name = "terraform-20210531205108563900000001"
    => terraspace output example --format json --out /tmp/terraspace/rspec/output.json
    {"name"=>
      {"sensitive"=>false,
       "type"=>"string",
       "value"=>"terraform-20210531205108563900000001"}}
      successful deploy
    => terraspace down example -y

    An execution plan has been generated and is shown below.
    Resource actions are indicated with the following symbols:
      - destroy

    Terraform will perform the following actions:
      # aws_s3_bucket.this will be destroyed
      - resource "aws_s3_bucket" "this" {
          - acl                         = "private" -> null
          - arn                         = "arn:aws:s3:::terraform-20210531205108563900000001" -> null
          - bucket                      = "terraform-20210531205108563900000001" -> null
          - bucket_domain_name          = "terraform-20210531205108563900000001.s3.amazonaws.com" -> null
          - bucket_regional_domain_name = "terraform-20210531205108563900000001.s3.us-west-2.amazonaws.com" -> null
          - force_destroy               = false -> null
          - hosted_zone_id              = "Z3BJ6K6RIION7M" -> null
          - id                          = "terraform-20210531205108563900000001" -> null
          - region                      = "us-west-2" -> null
          - request_payer               = "BucketOwner" -> null
          - tags_all                    = {} -> null

          - versioning {
              - enabled    = false -> null
              - mfa_delete = false -> null
            }
        }

    Plan: 0 to add, 0 to change, 1 to destroy.

    Changes to Outputs:
      - name = "terraform-20210531205108563900000001" -> null

    ------------------------------------------------------------------------

    Note: You didn't specify an "-out" parameter to save this plan, so Terraform
    can't guarantee that exactly these actions will be performed if
    "terraform apply" is subsequently run.
    aws_s3_bucket.this: Destroying... [id=terraform-20210531205108563900000001]
    aws_s3_bucket.this: Destruction complete after 0s

    Destroy complete! Resources: 1 destroyed.

    Finished in 22.16 seconds (files took 0.29652 seconds to load)
    1 example, 0 failures

    $
