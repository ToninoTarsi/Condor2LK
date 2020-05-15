import os

poladDir = r"D:/Condor2/Tools/XCSoarPolarsHU14"
outFile = r"D:/Condor2/Tools/XCSoarPolarsHU14/C2LKpolars2.txt"


fout = open(outFile, "w")

for filename in os.listdir(poladDir):
    if filename.endswith(".plr") : 
        name = os.path.splitext(filename)[0]
        plr = name + ".plr"
        xcp = name + ".xcp"
        f_plr = open(os.path.join(poladDir,plr) , "r")
        f_xcp = open(os.path.join(poladDir,xcp) ,"r")

        fout.write("[" + name + "]\n")
        print(name,plr,xcp)

        for line in f_xcp.readlines():
            line = line.replace('"','').replace('\n','')

           
            code = line.split("=")[0]
            val = line.split("=")[1]
            
            if ( code == "MaxSpeed"):
                fout.write("SafteySpeed1=" + str(int(float(val)*1000)) + '\n')
                print (int(float(val)*1000))
            elif ( code == "Type"):
                fout.write("AircraftType1=" + val + '\n')
            elif ( code == "Handicap"):
                fout.write("Handicap1=" + val + '\n')
            elif ( code == "DumpTime"):
                fout.write("BallastSecsToEmpty1=" + val + '\n')
            else:
                fout.write(line  + '\n')

        fout.write("polar=" + f_plr.readlines()[1])

        fout.write("\n")

        f_plr.close()
        f_xcp.close()

        continue
    else:
        continue

fout.close()