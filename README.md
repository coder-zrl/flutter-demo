# Flutter APP代码结构

我们先来创建一个全新的Flutter工程，命名为"github_client_app"；创建新工程的步骤视读者使用的编辑器而定，都比较简单，在此不再赘述。创建完成后，工程结构如下：
```markdown
github_client_app
├── android
├── ios
├── lib
└── test
```

由于我们需要使用外部图片和Icon资源，所以我们在项目根目录下分别创建“imgs”和“fonts”文件夹，前者用于保存图片，后者用于保存Icon文件。关于图片和Icon，读者可以参考第三章中相应的内容。

由于在网络数据传输和持久化时，我们需要通过Json来传输、保存数据；但是在应用开发时我们又需要将Json转成Dart Model类，现在我们使用在第十一章中“Json转Model”小节中介绍的方案，所以，我们需要在根目录下再创建一个用于保存Json文件的“jsons”文件夹。

多语言支持我们使用第十三章“国际化”中介绍的方案，所以还需要在根目录下创建一个“l10n”文件夹，用于保存各国语言对应的arb文件。

现在工程目录变为：

```markdown
github_client_app
├── android
├── fonts
├── l10n-arb
├── imgs
├── ios
├── jsons
├── lib
└── test
```

由于我们的Dart代码都在“lib”文件夹下，笔者根据技术选型和经验在lib文件下创建了如下目录：

```markdown
lib
├── common
├── l10n
├── models
├── states
├── routes
└── widgets
```

![img.png](assets/md/img.png)

# 配置签名

1. 创建一个密钥库：你可以使用keytool命令来创建一个密钥库。这个命令可能会像这样：

```bash
keytool -genkey -v -keystore ~/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
```

正在存储/Users/username/key.jks

将文件copy到android/app目录下

2. 在你的Flutter项目中创建一个名为android/key.properties的文件，并在其中存储你的密钥库信息：

```bash
storePassword=<store password>
keyPassword=<key password>
keyAlias=key
storeFile=<location of the key store file, e.g. /Users/<user name>/key.jks>
```

3. 更新你的android/app/build.gradle文件，以从key.properties文件中读取密钥库信息，并将其用于签名你的应用：

```bash
android {
    ...
    signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile file(keystoreProperties['storeFile'])
            storePassword keystoreProperties['storePassword']
        }
    }

    buildTypes {
        release {
            signingConfig signingConfigs.release
        }
    }
}
```

4. 现在，你可以使用命令来生成一个已签名的APK文件。

```bash
flutter build apk --release
```