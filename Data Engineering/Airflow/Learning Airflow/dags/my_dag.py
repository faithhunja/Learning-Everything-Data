# Import required packages
from airflow.sdk import dag, task
from pendulum import datetime

# Define dag decorator
@dag(
    schedule_interval='@daily', 
    start_date=datetime(2025, 1, 1), # takes datetime object
    description="This is my first DAG", # will be displayed in the Airflow UI
    tags=["team_a", "source_a"], # to categorize your dags in the Airflow UI
    max_consecutive_failed_dag_runs=3, # after 3 failures, it should pause
)

# Define dag function - as best practice, should be the same name as the file
def my_dag():

    @task
    def task_a():
        print("Hello from task A!")

    @task
    def task_b():
        print("Hello from task B!")

    @task
    def task_c():
        print("Hello from task C!")

    @task
    def task_d():
        print("Hello from task D!")

    task_a() >> task_b() >> [task_c, task_d()]

# Call the dag function otherwise it won't run
my_dag()


## The above code can be rewritten as:
# from airflow.sdk import dag, task
# from pendulum import datetime

# with DAG(
#     schedule_interval='@daily', 
#     start_date=datetime(2025, 1, 1), # takes datetime object
#     description="This is my first DAG", # will be displayed in the Airflow UI
#     tags=["team_a", "source_a"], # to categorize your dags in the Airflow UI
#     max_consecutive_failed_dag_runs=3, # after 3 failures, it should pause
# ):
#     @task
#     def task_a():
#         print("Hello from task A!")

#     task_a()
