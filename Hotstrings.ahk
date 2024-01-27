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

::dtw::
{
   SendInput(A_YWeek)
}

::rere:: ;This is a comment
{
    userprofile := EnvGet("userprofile")
    SendInput(userprofile)
}

::r.jp::
{
    SendInput("jupyter lab")
}

::sn::
{
    SendInput("%SNIPPETS%")
}

::rp::
{
    SendInput("%REPOS%")
}

::nmp::
{
    var:= "
(
import matplotlib.pyplot as plt
import matplotlib as mpl
import pandas as pd
import numpy as np
from pathlib import Path
import os
from functools import reduce
from itertools import repeat, accumulate
)"
    SendInput(var)
}

::pdo::
{
    var:= "
(
pd.options.display.max_rows = 100
pd.options.display.min_rows = 100
)"
    SendInput(var)
}

::mpp::
{
    var:= "fig, ax = plt.subplots()"
    SendInput(var)
}

::rpp::
{
    SendInput("$Env:REPOS")
}

::snp::
{
    SendInput("$Env:SNIPPETS")
}

::plm::
{
    SendInput("lambda x: ")
}
