import torchvision

torchvision.datasets.KMNIST(".", train=True, download=True)
torchvision.datasets.KMNIST(".", train=False, download=True)
