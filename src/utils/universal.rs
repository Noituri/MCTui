use crate::SETTINGS;
use crate::constants::DOT_MCTUI;
use crate::structs::settings::Profile;
use uuid::Uuid;
use std::fs::File;
use std::process::Command;

pub fn start_checker() {
    let mut settings = SETTINGS.lock().unwrap();

    let output = Command::new("ping").arg("-c").arg("1").arg("8.8.8.8").output().unwrap();

    *crate::CONNECTION.lock().unwrap() = output.status.success();

    if settings.auth.username == "" && !settings.auth.online {
        settings.auth.username = "Steve".to_string();
    }

    if settings.auth.online {
        // TODO Yggdrasil
        panic!("implement me");
    }
}

pub fn create_profile(name: String, version: String) {
    let mut settings = SETTINGS.lock().unwrap();

    let mut id = Uuid::new_v4().to_string();

    loop {
        let mut exists = false;
        for p in &settings.profiles.profiles {
            if p.id == id {
                id = Uuid::new_v4().to_string();
                exists = true
            }
        }

        if !exists {
            break
        }
    }

    settings.profiles.profiles.push(Profile{
        id: id.to_owned(),
        name,
        version
    });


    if settings.profiles.selected == "" {
        settings.profiles.selected = id;
    }

    serde_json::to_writer_pretty(&File::create(format!("{}/mctui.json", DOT_MCTUI)).unwrap(),&*settings).unwrap();
}