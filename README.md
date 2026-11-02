# windscope

this repository contains scripts and helpers for the windscope exhibit

## about windscope
A collaborative and interactive wind farm simulator. This project was done during the summer semester 2023 at ifgi.
This project is based on the existing future mobility project from Imaginary and adapted it towards the aim of this project.
Read more about it on the [windpark-simulator repository](https://github.com/ifgi/windpark-simulator)

## relevant repos
- [scanner](https://github.com/ifgi/windscope_scanner)
  - forked from [CityScoPy](https://github.com/CityScope/CS_CityScoPy)
- [app](https://github.com/ifgi/windpark-simulator)

## architecture
relies on [mise-en-place](https://mise.jdx.dev/) for easier dev setup and deployment
```mermaid
flowchart TB
    subgraph scanner
        direction LR
        cam(camera feed)
        keystones[(keystones.txt)]
        cam -.optional.-> calibrate{calibrate.py}
        cam --> scanner_api{run.py}
        calibrate --> keystones
        keystones --> scanner_api
    end
    subgraph app
        direction LR
        api{server} --sends json to socket\n:4848--> frontend{"frontend"}
        frontend --serves app on \n:8080--> browser
    end
    scanner_api --sends json to socket\n:5000--> api
    browser --application capture--> obs{OBS}
    obs --fullscreen projection\n(HDMI)--> beamer@{ shape: win-pane, label: "beamer" }
    browser --displays\n(DP)--> main_display(display-1)
```

## setup the project from a clean system
TBD

## start the server
> note that a shell alias is defined for `run` to be aliased to `mise run`
i would suggest using 3 separate terminal windows/tabs for every mise task
```sh
mise run
```
and now select the task you want
```system
$ mise run
Tasks
Select a task to run
  calibrate  calibrate the scanner camera
❯ frontend   run the frontend
  scanner    run the scanner
  server     run the api backend for the app
/
esc clear filter • enter confirm
```
