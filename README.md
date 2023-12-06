# venom-api-poc

This project is a Proof of concept regarding the Venom testing for the QA team. It contains a basic testing environment that have multiple directories following the main flows used in the Cypress ZF Dashboard testing.

## Venom Installation

To install Venom, you have to run the script `ìnstall_venom.sh`. This scripts will clone the venom repository from `riskive/venom` into your local directory. Then will compile its source code and install it into your machine.
Please notice this process requires you to provide your sudo credentials when installing venom.

To verify Venom has been installed successfully, try this command:

`% venom v`

## Test execution example

To run one case using, run the script from the root directory:

`% ./run_test {path_to_your_test}`

For example:

`% ./run_test tests/login/get-request-zfdash-login.venom.yml`

The console will output several results, and you can find them in the directory `outputs`. In this example, the test results will be in:

`outputs/tests/login/get-request-zfdash-login.venom.yml.061223_174002`
