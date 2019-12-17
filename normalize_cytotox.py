
data = []
with open("alamar_blue_cytotox.csv", "r") as handle:
    for line in handle:
        line = line.strip("\n").split(",")
        line = [int(item) for item in line]
        data.append(line)

min_val = 1000000
max_val = 0

for row in data:
    if max(row) > max_val:
        max_val = max(row)
    if min(row) < min_val:
        min_val = min(row)
print(max_val)
print(min_val)

data_out = []
for row in data:
    row_out = []
    for sample in row:
        normalized_val = (sample - min_val) / (max_val - min_val)
        print(f"appending {normalized_val}")
        row_out.append(normalized_val)
    data_out.append(row_out)

with open("normalized_cytotox", "w") as out:
    for row in data_out:
        row = [str(it) for it in row]
        out.write(",".join(row))
        out.write("\n")
