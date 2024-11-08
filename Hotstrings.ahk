#Hotstring EndChars `;
::->::
{
    SendInput("→")
}

::dt::
{
    SendInput(A_YYYY . A_MM . A_DD)
}

::dts::
{
    SendInput(A_YYYY . A_MM . A_DD . "T" . A_Hour . A_Min)
}

::ts::
{
    SendInput("T" . A_Hour . A_Min)
}

::ots::
{
    SendInput("==T" . A_Hour . A_Min . "==")
}

::pts::
{
    SendInput("[T::" . A_Hour . A_Min . "]")
}


::dtw::
{
   SendInput(A_YWeek)
}

::rere::
{
    userprofile := EnvGet("userprofile")
    SendInput(userprofile)
}


::pp::
{
    scripts_folder := EnvGet("SCRIPTS_FOLDER")
    SendInput("py " . scripts_folder . "\")
}

