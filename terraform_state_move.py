terraform_moved_param = "moved {\n from = #FROM to = #TO\n }\n"
terraform_move = open("terraform_moved.tf", "w")
# Using readlines()
terraform_resources_state = open("terraform_state_resources.txt", "r")
Lines = terraform_resources_state.readlines()
# Strips the newline character
for line in Lines:
    # print(line.strip())
    split_resource = line.split(".")
    # add only eu and us resources excluding keyclock resources as well
    if (
        "create_in_" in split_resource[1] or "create_sea_" in split_resource[1]
    ) and ".data." not in line:
        split_resource[1] = split_resource[1] + "[0]"
        # print(split_resource)
        new_resource_index = ".".join(split_resource).strip()
        terraform_resource_moved = terraform_moved_param.replace(
            "#FROM", line.strip() + "\n"
        ).replace("#TO", new_resource_index)

        print(terraform_resource_moved)
        terraform_move.writelines(terraform_resource_moved)
terraform_move.close()