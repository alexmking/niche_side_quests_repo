#!/usr/bin/env python3
# THIS SCRIPT IS MEANT TO SETUP A NEW PRACTICE SESSION FOR CPP STUFF BY DOING THE FOLLOWING:
# 1. duplicate this file: /Users/alexking/amk/tools/localcpp/template_to_dup_for_each_new_cpp_practice_session.cpp
# 2. rename the file to 'cppsession' and add an incrementing value so previous cppsession files dont conflict
    # EXAMPLE: cppsession1.cpp, then the next time i run the script it should create cppsession2.cpp, and then cppsession3.cpp etc
# 3. open the new file in vscode


###### NOTE potential annoyance i may want to fix **LATER**, and definitely not right now: ###### 
# each new cppsession.cpp will mean I'd have to slightly edit the int val of the filename in the g++ command...
# HOWEVER, if I just use the coderunner CTRL-ALT-E command instead, i should be able to just run all the new cppsession1.cpp files
# no matter how many new ones I end up creating (since the CTRL-ALT-E goes off of the current file i think)

import os
import shutil
import subprocess

# template_path = "D:\git\niche_side_quests_repo\win\test_file_to_dup1.cpp"
# template_path = "D:\\git\\niche_side_quests_repo\\win\\test_file_to_dup1.cpp"
template_path = "D:\\git\\niche_side_quests_repo\\_universal\\cpp_hub\\template_to_dup_for_each_new_cpp_practice_session.cpp"
destination_dir = "C:\\Users\\aking\\amk\\tools\\localcpp"

# Find the next available cppsession number
i = 1
while os.path.exists(os.path.join(destination_dir, f"cppsession{i}.cpp")):
    i += 1

new_file_path = os.path.join(destination_dir, f"cppsession{i}.cpp")
shutil.copy(template_path, new_file_path)
subprocess.run(["code.cmd", new_file_path])

