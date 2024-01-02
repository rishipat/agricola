from colorama import Fore, Style


class AgricolaBoard:
    def __init__(self):
        self.available_resources = ["wood", "clay", "reed", "fish"]
        self.additional_resources = [
            "stone_western",
            "stone_eastern",
            "grain",
            "pig",
            "sheep",
            "cattle",
        ]
        self.accumulation_spots = {res: 0 for res in self.available_resources}
        for res in self.additional_resources:
            self.accumulation_spots[res] = 0
        self.round_number = 0
        self.resource_increment = {"wood": 3, "clay": 1, "reed": 1, "fish": 1}
        for res in self.additional_resources:
            self.resource_increment[res] = 1

    def increment_resources(self):
        for resource in self.available_resources:
            increment_amount = self.resource_increment[resource]
            self.accumulation_spots[resource] += increment_amount
            print(
                Fore.GREEN
                + f"Added {increment_amount} {resource} to accumulation spot in round {self.round_number}."
                + Style.RESET_ALL
            )

    def display_accumulation_spots(self):
        print(f"Round: {self.round_number}")
        print("Accumulation Spots:")
        for resource, amount in self.accumulation_spots.items():
            if resource in self.available_resources:
                print(
                    Fore.RED + f"\t{resource.capitalize()}: {amount}" + Style.RESET_ALL
                )

    def prompt_new_resource(self):
        print("Select a resource to add:")
        for index, res in enumerate(self.additional_resources, start=1):
            print(f"{index}. {res.capitalize()}")

        while True:
            choice = input(
                "Enter the number of the resource to add (or 'done' if none): "
            ).lower()
            if choice.startswith("d"):
                break
            elif choice.isdigit() and 1 <= int(choice) <= len(
                self.additional_resources
            ):
                selected_resource = self.additional_resources[int(choice) - 1]
                self.available_resources.append(selected_resource)
                self.accumulation_spots[selected_resource] = 0
                print(f"{selected_resource.capitalize()} added.")
            else:
                print("Invalid input. Please enter a valid number or 'done'.")

    def take_resource(self):
        print("Select a resource to take:")
        for index, res in enumerate(self.available_resources, start=1):
            print(f"{index}. {res.capitalize()}")

        while True:
            choice = input(
                "Enter the number of the resource to take (or 'done' if none): "
            ).lower()
            if choice.startswith("d"):
                break
            elif choice.isdigit() and 1 <= int(choice) <= len(self.available_resources):
                selected_resource = self.available_resources[int(choice) - 1]
                self.accumulation_spots[selected_resource] = 0
                print(
                    f"You took {selected_resource.capitalize()} and reset its counter to 0."
                )
                return False  # Indicates to not increment the round
            else:
                print("Invalid input. Please enter a valid number or 'done'.")

        return "continue"  # Indicates to increment the round

    def simulate_round(self):
        self.display_accumulation_spots()
        input_text = input(
            "Press 'Enter' to advance to the next round, 'take' to take a resource, or 'exit' to quit: "
        ).lower()

        if input_text == "exit":
            return "exit"
        elif input_text.startswith("t"):
            return self.take_resource()
        else:
            self.prompt_new_resource()
            return "continue"  # Increment round after adding resources


def main():
    board = AgricolaBoard()

    while True:
        exit_flag = board.simulate_round()
        if exit_flag == "exit":
            break
        elif exit_flag == "continue":
            board.round_number += 1  # Increment round manually
            board.increment_resources()


if __name__ == "__main__":
    main()
