import importlib
import os
import pkgutil

import problems


def load_problems():
    problems_modules = {}
    for _, module_name, _ in pkgutil.iter_modules(problems.__path__):
        full_module_name = f"problems.{module_name}"
        module = importlib.import_module(full_module_name)

        if hasattr(module, "solve"):
            problems_modules[module_name] = module.solve

    return problems_modules


def main():
    os.makedirs("target", exist_ok=True)
    filepath = "target/answers.txt"

    all_questions = load_problems()

    existing_answers = {}
    if os.path.exists(filepath):
        with open(filepath, "r") as file:
            for line in file:
                if " | " in line:
                    q_name, q_ans = line.strip().split(" | ", 1)
                    existing_answers[q_name] = q_ans

    with open(filepath, "a") as file:
        for q_name, q_function in sorted(all_questions.items()):
            if q_name in existing_answers:
                print(f"    [CACHED] {q_name}: {existing_answers[q_name]}")
            else:
                print(f"    [RUNNING] {q_name}...")
                actual_answer = q_function()

                print(f"    [COMPLETED] {q_name}: {actual_answer}")
                file.write(f"{q_name} | {actual_answer}\n")


if __name__ == "__main__":
    main()
