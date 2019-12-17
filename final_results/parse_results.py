rows = ["A", "B", "C", "D", "E", "F", "G", "H"]
out = []

curr_row = 0
with open("cooked_results.csv", "r") as handle:
    for line in handle:
        line = line.strip("\n").split(",")
        for val in line:
            out.append([val, rows[curr_row]])
        curr_row += 1

with open("parsed_cooked_results.csv", "w") as out_handle:
    for samp in out:
        out_handle.write(",".join(samp))
        out_handle.write("\n")
