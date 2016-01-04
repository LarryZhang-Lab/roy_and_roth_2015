Train/dev/test splits for Roy and Roth (2015)
==================================================

The data sets used in "Solving General Arithmetic Word Problems"
by Roy and Roth (2015) were evaluated using n-fold cross-validation.  Which,
while fine for their model with few hyperparameters, makes the evaluation and
development of several categories of Machine Learning models difficult.

This repository forks the original code, making minimal changes to print
performance for each fold.  It also introduces alternative train/dev/test
splits that can be activated as follows.

    make {dev,test}

Once a data split has been selected, you can evalute the model on the data set
of your choice.  We have found that the *CC pipeline only works on OS X*, but
have been unable to determine why.

    make {ai2,il,cc}

Just as with the original code, all output is stored in the `log` directory and
the first fold gives the result on the dev/test set.

    grep 'Fold 0' log/*Tune.out

Performance increases across the board compared to what was reported in the
original paper, this is expected given the increase in training data compared
to n-fold cross-validation.

|      | AI2   | IL    | CC    |
| ----:|:-----:|:-----:|:-----:|
| Dev  | 79.01 | 68.52 | 60.66 |
| Test | 82.44 | 75.42 | 55.50 |
