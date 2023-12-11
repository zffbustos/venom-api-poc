# venom-api-poc

This project is a Proof of concept regarding the Venom testing for the QA team. It contains a basic testing environment that have multiple directories following the main flows used in the Cypress ZF Dashboard testing.

## Venom Installation

To install Venom, you have to run the script `ìnstall_venom.sh`. This scripts will clone the venom repository from `riskive/venom` into your local directory. Then will compile its source code and install it into your machine.
Please notice this process requires you to provide your sudo credentials when installing venom.

To verify Venom has been installed successfully, try this command:

`% venom v`

## Test configuration

TBD (rephrase this)

You run the tests, you need the credentials for the ZF Dashboard account you're currently using.

- Go to Settings -> Data Connectors -> API Data Feeds tab -> API Tokens

- Reset the Personal Access Token, then Copy it.

- Paste this token in the "zfapi-personal-token" variable in the tests

## Test execution example

To run one case using, run the script from the root directory:

`% ./run_test {path_to_your_test}`

For example:

`% ./run_test tests/login/get-request-zfdash-login.venom.yml`

The console will output several results, and you can find them in the directory `outputs`. In this example, the test results will be in:

`outputs/tests/login/get-request-zfdash-login.venom.yml.061223_174002`

## Docker

Venom has a good integration with Docker, that's why in this project we include a small `Hello World` example to prove the capabilities of Venom by using it to make calls to a `http` server within a Docker image.

There is a directory called `images` which contains a Smocker image where you can create a hello world image. The image only contains the Smocker server, and the image creation is out of the scope of this project. You can find more information about Smocker in the References section.

## References

- Venom OVH repository: <https://github.com/ovh/venom>
- Venom Riskive repository: <https://github.com/riskive/venom>
- Venom Tests: <https://github.com/riskive/go-dm/tree/master/e2e/venom/end-to-end>
- ZF API repository: <https://github.com/riskive/API/>
- Smocker: <https://smocker.dev/>
- Hello World with Smocker: <https://smocker.dev/guide/getting-started.html>
