import React, {Dispatch, useEffect, useState} from "react";
import {useDispatch, useSelector} from "react-redux";
import {RootState} from "../../redux/Store";
import {AuthReducerState, UpdateUserRequestDTO} from "../../redux/auth/AuthModel";
import {TOKEN} from "../../config/Config";
import {currentUser, updateUser} from "../../redux/auth/AuthAction";
import WestIcon from '@mui/icons-material/West';
import {Avatar, IconButton, TextField} from "@mui/material";
import CreateIcon from '@mui/icons-material/Create';
import CheckIcon from '@mui/icons-material/Check';
import styles from './Profile.module.scss';
import CloseIcon from '@mui/icons-material/Close';


interface ProfileProps {
    onCloseProfile: () => void;
    initials: string;
}

const Profile = (props: ProfileProps) => {

    const [isEditName, setIsEditName] = useState<boolean>(false);
    const [fullName, setFullName] = useState<string | null>(null);
    const dispatch: Dispatch<any> = useDispatch();
    const auth: AuthReducerState = useSelector((state: RootState) => state.auth);
    const token: string | null = localStorage.getItem(TOKEN);

    useEffect(() => {
        if (auth.reqUser) {
            setFullName(auth.reqUser.fullName);
        }
    }, [auth.reqUser]);

    useEffect(() => {
        if (token && auth.updateUser) {
            dispatch(currentUser(token));
        }
    }, [auth.updateUser, token, dispatch]);

    const onEditName = () => {
        setIsEditName(true);
    };

    const onUpdateUser = () => {
        if (fullName && token) {
            const data: UpdateUserRequestDTO = {
                fullName: fullName,
            };
            setFullName(fullName);
            dispatch(updateUser(data, token));
            setIsEditName(false);
        }
    };

    const onCancelUpdate = () => {
        if (auth.reqUser) {
            setFullName(auth.reqUser?.fullName);
        }
        setIsEditName(false);
    };

    const onChangeFullName = (e: React.ChangeEvent<HTMLTextAreaElement | HTMLInputElement>) => {
        setFullName(e.target.value);
    };

    return (
        <div className={styles.outerContainer}>
            <div className={styles.headingContainer}>
                <IconButton onClick={props.onCloseProfile}>
                    <WestIcon fontSize='medium'/>
                </IconButton>
                <h2>Profile</h2>
            </div>
            <div className={styles.avatarContainer}>
                <Avatar sx={{width: '12vw', height: '12vw', fontSize: '5vw'}}>{props.initials}</Avatar>
            </div>
            <div className={styles.nameContainer}>
                {!isEditName &&
                    <div className={styles.innerNameStaticContainer}>
                        <p className={styles.nameDistance}>{auth.reqUser?.fullName}</p>
                        <IconButton sx={{mr: '0.75rem'}} onClick={onEditName}>
                            <CreateIcon/>
                        </IconButton>
                    </div>}
                {isEditName &&
                    <div className={styles.innerNameDynamicContainer}>
                        <TextField
                            id="fullName"
                            type="text"
                            label="Enter your full name"
                            variant="outlined"
                            onChange={onChangeFullName}
                            value={fullName}
                            sx={{ml: '0.75rem', width: '70%'}}/>
                        <div>
                            <IconButton onClick={onCancelUpdate}>
                                <CloseIcon/>
                            </IconButton>
                            <IconButton sx={{mr: '0.75rem'}} onClick={onUpdateUser}>
                                <CheckIcon/>
                            </IconButton>
                        </div>
                    </div>}
            </div>
            <div className={styles.infoContainer}>
                <p className={styles.infoText}>This name will appear on your messages</p>
            </div>
        </div>
    );
};

export default Profile;