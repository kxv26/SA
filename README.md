# Software analytics
## Data collection
For our analysis, we will be using the dataset (https://zenodo.org/records/3922907) Zhang et al. presented that consists of  $11,230$ OSS projects with a total of $3,347,937$ pull requests. The dataset includes three main groups of data: contributor characteristics, project characteristics and pull request characteristics. This dataset is an extension of the dataset produced by Gousios and Zaidman.

## Data filtering
In order to focus on large projects, we had to filter the data. We developed the following step-by-step procedure applying our criteria to retrieve the large projects:
- number of pull requests must be more than 5000
- mean number of issues at the time of the pull requests must be at least 50
- mean number of forks at the time of the pull requests must be at least 2000
- mean team size of repositories at the time of the pull requests must be at least 20 (normally, $\geq$ 30 is considered for large projects but our goal was to include at least ten projects in our analysis)
- 
With these selection criteria fulfilled, the following repositories remained: 'scikit-learn', 'salt', 'metasploit-framework', 'kubernetes', 'react', 'node', 'ansible', 'odoo', 'rails', 'matplotlib', 'ember.js', 'pandas', 'gatsby'.

## Pre-processing
The main continuous data of interest is the merge time of pull requests and we, thus, only consider merged pull requests. Specifically, the mergetime\_minutes field undergoes a transformation using the natural logarithm, adjusted by adding 1 to avoid the undefined log of zero. We do this to minimize any skewness.

To infer from a more reliable dataset, we also try to identify and remove outliers. The interquartile range (IQR) method is employed, defining outliers as points lying more than 1.5 IQRs below the first quartile (25\%) or above the third quartile (75\%).

Additionally, we define the following criteria to discard data that is not relevant for our task:
  - the pull request must contain at least 1 file that has been changed
  - the pull request must contain at least one line of code that was either added or removed
  - the pull request log transformed lifetime must be between $2$ and $14$ (removes some skew based on histogram visualization)
  - pull requests with a time to first response of less than 0 minutes are removed
