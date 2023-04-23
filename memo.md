
TFDV=tensorflow_data_validation-1.10.0-cp38-cp38-linux_aarch64.whl
TFX_BSL=tfx_bsl-1.10.1-cp38-cp38-linux_aarch64.whl
docker run -v /tmp/tf_aarch64/volumes/builds/$TFDV:/$TFDV -v /tmp/tf_aarch64/volumes/builds/$TFX_BSL:/$TFX_BSL -it python:3.8 bash

tensorflow_data_validation-1.10.0-cp38-cp38-linux_aarch64.whl  tfx_bsl-1.10.0-cp38-cp38-linux_aarch64.whl
tensorflow_data_validation-1.10.0-cp39-cp39-linux_aarch64.whl  tfx_bsl-1.10.0-cp39-cp39-linux_aarch64.whl
tensorflow_data_validation-1.9.0-cp38-cp38-linux_aarch64.whl   tfx_bsl-1.9.0-cp38-cp38-linux_aarch64.whl
tensorflow_data_validation-1.9.0-cp39-cp39-linux_aarch64.whl   tfx_bsl-1.9.0-cp39-cp39-linux_aarch64.whl

```sh
gcloud artifacts repositories create tfdv-internal \
    --repository-format=python \
    --location=asia-northeast1 \
    --description="Test Python package repository"
```


```bash
TF_FILE=tensorflow-2.10.1-cp38-cp38-linux_aarch64.whl
python3 -m twine upload --config-file ./.pypirc --repository-url https://asia-northeast1-python.pkg.dev/citadel-testing/tfdv-aarch64/ volumes/builds/*
```

```bash
gcloud artifacts print-settings python \
    --repository=test-python-repo \
    --location=asia-northeast1
```
