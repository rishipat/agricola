from colorama import Fore, Style


class AgricolaBoard:
    """A class which stores the state of accumulation spots in agricola."""

    def __init__(self) -> None:
        # These are always available on the main board.
        self.available_resources = ["wood", "clay", "reed", "fish"]
        # These can each appear in later rounds.
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

    def increment_resources(self) -> None:
        for resource in self.available_resources:
            increment_amount = self.resource_increment[resource]
            self.accumulation_spots[resource] += increment_amount
            print(
                Fore.GREEN
                + f"Added {increment_amount} {resource} to accumulation spot in round {self.round_number}."
                + Style.RESET_ALL
            )

    def display_accumulation_spots(self) -> None:
        print(f"Round: {self.round_number}")
        print("Accumulation Spots:")
        for resource, amount in self.accumulation_spots.items():
            if resource in self.available_resources:
                print(
                    Fore.LIGHTBLUE_EX
                    + f"\t{resource.capitalize()}: {amount}"
                    + Style.RESET_ALL
                )

    def prompt_new_resource(self) -> None:
        print("Select a resource to add:")
        for index, res in enumerate(self.additional_resources, start=1):
            print(f"{index}. {res.capitalize()}")

        while True:
            choice = input(
                "Enter the number of the resource to add (or 'd' if done): "
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

    def take_resource(self) -> str:
        """Prompt user to take resource, and return whether or not to proceed to the next round."""
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
                    Fore.RED
                    + f"You took {selected_resource.capitalize()} and reset its counter to 0."
                    + Style.RESET_ALL
                )
                return "same_round"  # Indicates to not increment the round
            else:
                print("Invalid input. Please enter a valid number or 'done'.")

        return "next_round"  # Indicates to increment the round

    def simulate_round(self) -> str:
        """Prompts the user to advance or take resources, and returns whether to proceed."""
        self.display_accumulation_spots()
        input_text = input(
            "Press 'Enter' to advance to the next round, 't' to take a resource, or 'q' to quit: "
        ).lower()

        if input_text == "q":
            return "quit"
        elif input_text == "t":
            return self.take_resource()
        else:
            self.prompt_new_resource()
            return "next_round"  # Increment round after adding resources


def main():
    board = AgricolaBoard()

    while True:
        flag = board.simulate_round()
        if flag == "next_round":
            board.round_number += 1  # Increment round manually
            board.increment_resources()
        elif flag == "quit":
            break
        else:
            continue


if __name__ == "__main__":
    main()
