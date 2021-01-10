import os


def create_templates(database, number = 5, directory = os.getcwd()):
    dirnames =sorted([f for f in os.listdir(directory) if os.path.isdir(os.path.join(directory, f))])
    last = 0
    if dirnames:
        last = max([int(''.join(filter(str.isdigit, name))) for name in dirnames])

    for i in range(1, number+1):
        ex_num = i+ last
        name = "\ex"+str(ex_num)
        os.mkdir(directory + name)
        with open(directory+name+"\query.sql", "w") as file:
            file.write(f"USE {database};\ngo\n")



