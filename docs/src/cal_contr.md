## Idea used

Here, we are calculating the top 5%(bright) pixels and least 5% (dark) pixels and finding the difference between the two to get the contrast. Priority queue is used to get better time and space complexity which is supposedly O((n^2)log(0.05*n^2)).

## compute_contr() function

This function returns the top 5% bright pixels and least 5% dark pixels which is further used in ``autoAdjustments.jl`` to calculate the mapping of brightness using bright pixels.

## Usage

include("cal_contr.jl")
