

def after_build(source,target,env):
    import os
    for root,dirs,files in os.walk("."):
        for f in files:
            if ".elf" in f:
               ## print(root,dirs,files);
                path = root+"\\"+f
               ## print(path)
                try:
                    os.remove("Dumped.txt")
                except:
                    pass
                os.system("objdump.exe "+path+" -dSC > Dumped.asm")
                print("Dumped ASM")

if __name__ == "__main__":
    after_build(None,None,None)
else:
    Import("env")
    env.AddPostAction("buildprog",after_build)
