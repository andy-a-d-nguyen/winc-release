# winc-release

A [BOSH](http://docs.cloudfoundry.org/bosh/) release for deploying [winc](https://github.com/cloudfoundry-incubator/winc)

The following powershell script can be used to quickly create a new container.

  

- Build required binaries

```
. ".\src\build-binaries.ps1"
```
 
  

- Create Container with an optional containerId as an argument. This requires
  setting `WINC_TEST_ROOTFS` to an image (e.g. docker:///cloudfoundry/windows2016fs:1709)
  and `GROOT_IMAGE_STORE` (e.g  C:\var\vcap\data\tmp\groot)

```
Start-Process -FilePath "powershell.exe" 
    -ArgumentList "-ExecutionPolicy ByPass -File .\src\create-container.ps1 <CONTAINER_ID>" 
    -Wait -PassThru -NoNewWindow
```
 
  

- Get Container state

```
winc state <CONTAINER_ID>
```
 
  

- Delete Container

```
Start-Process -FilePath "powershell.exe" 
    -ArgumentList "-ExecutionPolicy ByPass -File .\src\delete-container.ps1 <CONTAINER_ID>" 
    -Wait -PassThru -NoNewWindow
```
 
  

### Example of a valid bundle config.json

```json
{
    "ociVersion":  "1.0.1",
    "root":  {
                 "path":  "\\\\?\\Volume{guid-xxxx-xxxx-xxxxxxxxxxxxx}"
             },
    "windows":  {
                    "layerFolders":  [
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\32705e47a01f0e978fa4ba436084a32ffe1eca2ad1b38918eb0fc951c008883c",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\2d74b4e862de847cd9c26be5885bbdf6e70e8cded6f59f8c28860315d8e330d7",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\91679d4f2b45dbd917e4274fdebf2d7f1416ad6f4aa83413fee030840fe220cc",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b89c04e8eb6bb7291fae04746e3a85980b36fb1946b47c213dd41e1a158c3d08",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\fb6dcfd6ceec4dd8a261d250f79778a7e6510b155de80d89eae03c64d06ef70f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\cc8ea6d42aa42f9bd2cc36ccfc42f809453efdafab1a5e4d4e51382436eeb078",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\360c1f2b53c86919d431344110a0265675d2647cf818e73a5051f5f106d1facd",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\b2a1fb1003844639c059ed46beab04e3ddce57254c76b26153d73ef5e283828b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\ee45dbe0471f2b6ee129cd7e7f6eedbdfb4af49a46c9259865e58abdd4bb91b5",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\7d4beabb9afdd8dc59be29251a391843b102e4078a3c6d2dc36ac08847b1ed91",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\8cca2b6327baa5b29771901986c2e2814ba16ca45a949bc910fb6e43f590fa2f",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\353f082405648753656161356dbd878a3ae4b687477c0f0a8bbf76a8f71e1c06",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\63732655dd0ac0700e00b7b32675a68509c879bf59beee32dc4c26d24e59a343",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\f3f58917a75d29ac91055d0c3c4e7fa5407291d149017977f7660ad01bb97f9b",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\94ccccb82d10b233ff450aca07c89c56e7b098f8eb7962a7972b1452a322a7a3",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\166a3ed3673bb92406e21950da78b7c0493e93fe1916f5319ad2bfb58decbdc1",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\dc84381339545c311b13db694b909016cfe200f00afccf615f1844fccd8e26db",
                                         "C:\\var\\vcap\\data\\tmp\\groot\\layers\\4bfe49d7bc33014df317149be23a71dfe176f2ddd6a78977068a37973dde89d8"
                                     ]
                },
    "process":  {
                    "args":  [
                                 "cmd.exe"
                             ],
                    "cwd":  "C:\\"
                }
}
```
 

