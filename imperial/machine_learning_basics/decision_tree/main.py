import os

import numpy as np
import metrics
from kfold import kfold
from decision_tree import build_tree_and_prune
from helpers import split_dataset
from plot_tree import plot_tree


class bcolors:
    HEADER = "\033[95m"
    OKBLUE = "\033[94m"
    OKGREEN = "\033[92m"
    WARNING = "\033[93m"
    FAIL = "\033[91m"
    ENDC = "\033[0m"
    BOLD = "\033[1m"
    UNDERLINE = "\033[4m"


def print_h(msg):
    columns = os.get_terminal_size().columns
    print(
        bcolors.HEADER
        + bcolors.BOLD
        + "#" * columns
        + "\n"
        + "#"
        + " " * int((columns - len(msg)) / 2 - 1)
        + msg.upper()
        + " " * int((columns - len(msg)) / 2 - 1)
        + "#"
        + "\n"
        + "#" * columns
        + "\n"
        + bcolors.ENDC
    )


def print_t(m, metric):
    print(
        bcolors.OKGREEN
        + bcolors.BOLD
        + bcolors.UNDERLINE
        + m.upper()
        + bcolors.ENDC
        + metric
    )


def print_metrics(metrics):
    for m in metrics:
        if m == "Confusion Matrix":
            print_t(
                "{m}:\n".format(m=m), "{metric} \n".format(metric=metrics[m])
            )
        else:
            if isinstance(metrics[m], float) and m != "Average Height":
                print_t(
                    "{m}:".format(m=m),
                    " {metric:.2%} \n".format(metric=metrics[m]),
                )

            elif (
                isinstance(metrics[m], list)
                or isinstance(metrics[m], np.ndarray)
            ) and m != "Height":
                print_t(
                    "{m}:".format(m=m),
                    " {metric} \n".format(
                        metric=["{k:.2%}".format(k=k) for k in metrics[m]]
                    ),
                )
            else:
                print_t(
                    "{m}:".format(m=m),
                    " {metric} \n".format(metric=metrics[m]),
                )


def main():
    clean_dataset = np.loadtxt("./data/wifi_db/clean_dataset.txt")
    noisy_dataset = np.loadtxt("./data/wifi_db/noisy_dataset.txt")

    print_h("Metrics for Clean Dataset (Not Pruned)")

    clean_not_pruned = kfold(clean_dataset, 10, run_pruning=False, n_jobs=os.cpu_count())
    clean_not_pruned_metrics = metrics.get_all_metrics(
        clean_not_pruned[0], clean_not_pruned[1]
    )
    print_metrics(clean_not_pruned_metrics)

    print_h("Metrics for Clean Dataset (Pruned)")

    clean_pruned = kfold(clean_dataset, 10, run_pruning=True, n_jobs=os.cpu_count())
    clean_pruned_metrics = metrics.get_all_metrics(
        clean_pruned[0], clean_pruned[1]
    )
    print_metrics(clean_pruned_metrics)

    print_h("Metrics for Noisy Dataset (Not Pruned)")

    noisy_not_pruned = kfold(noisy_dataset, 10, run_pruning=False, n_jobs=os.cpu_count())
    noisy_not_pruned_metrics = metrics.get_all_metrics(
        noisy_not_pruned[0], noisy_not_pruned[1]
    )
    print_metrics(noisy_not_pruned_metrics)

    print_h("Metrics for Noisy Dataset (Pruned)")

    noisy_pruned = kfold(noisy_dataset, 10, run_pruning=True, n_jobs=os.cpu_count())
    noisy_pruned_metrics = metrics.get_all_metrics(
        noisy_pruned[0], noisy_pruned[1]
    )
    print_metrics(noisy_pruned_metrics)
    
    print_h("Generating decision tree plots")

    final_clean = build_tree_and_prune(*split_dataset(clean_dataset))
    plot_tree(final_clean, save_path="pruned_clean_dataset.png")

    print_h("A final plot of the decision tree for the Clean Dataset has been saved to <pruned_clean_dataset.png>")

    final_noisy = build_tree_and_prune(*split_dataset(noisy_dataset))
    plot_tree(final_noisy, figsize=(300, 300), save_path="pruned_noisy_dataset.png")
    
    print_h("A final plot of the decision tree for the noisy dataset has been saved to <pruned_noisy_dataset.png>")

if __name__ == "__main__":
    main()
