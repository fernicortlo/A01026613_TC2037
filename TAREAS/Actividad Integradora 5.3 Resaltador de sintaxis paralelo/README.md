# <span style = "color: lightblue;"> Actividad Integradora 5.3 Resaltador de sintaxis paralelo </span>

**Created by Fernanda Cortés and Arantza Parra**

## <span style = "color: lightblue;"> Time complexity and Speedup analysis </span>

### <span style = "color: lightgreen;"> Time complexity </span>

The time complexity of this code is mainly determined by the number of lines in the input files and the number of cores available in the system for parallel execution. However, it's important to note that while parallel processing can speed up the execution time, it doesn't change the overall time complexity.

The function highlight_files divides the files into groups based on the number of available cores, and then uses Task.async to process each group of files in parallel. Within each task, the files are processed sequentially using the highlight_file function.

The highlight_file function's time complexity can be considered as O(N), where N is the number of lines in the input file. This function reads the file, splits it into lines, and then processes each line using the do_tokens function.

The do_tokens function's time complexity is also O(N), where N is the number of tokens to match. This function applies regular expression matching for each token in the list.

So, the total time complexity of processing a single file would be O(N * M), where N is the number of lines in the file and M is the number of tokens to match. However, because the files are processed in parallel, the overall time complexity of the highlight_files function will depend on the number of cores and the distribution of lines across the files.

Therefore, the time complexity is effectively O((N * M) / C), where N is the number of lines, M is the number of tokens to match, and C is the number of cores

### <span style = "color: lightgreen;"> Speedup </span>
- The number of cores being used by our tests are 8.

![cores](/TAREAS/Actividad%20Integradora%205.3%20Resaltador%20de%20sintaxis%20paralelo/images/cores.png)

 On this next part we'll analyze the time the function takes to finish running. Time efficiency also translates into better, more efficient programs in terms of resources.

Using the :timer.tc functions returns the time in miliseconds. Then the result is divided into seconds and we get the output. 
Running the function three different times we will calculate an average in order to get a more real result and comparison between functions. 

For the highlighting function using parallel programing, the time obtained is:

![1st function time](/TAREAS/Actividad%20Integradora%205.3%20Resaltador%20de%20sintaxis%20paralelo/images/2nd.png)

If we calculate the average we get 0.0252 seconds. 

The average execution time of 0.0252 seconds demonstrates the power of parallel processing. It's important to note that the actual time will depend on many factors such as the complexity and size of the files, the number of tokens to match, and the number of cores in the system.

However, by splitting the workload across multiple cores, the highlight_files function is able to process multiple files concurrently, which can significantly improve the time efficiency when dealing with large numbers of files.

In comparison to a version of the code that processes the files sequentially, the parallel version should show a clear advantage in terms of time efficiency, especially as the number of files increases. The speed-up will be most noticeable on systems with a larger number of cores.

It's also important to note that in addition to improving the time efficiency, the use of parallel processing can also lead to better utilization of system resources. This is particularly relevant in a multi-core environment, where a sequential program would only be able to utilize a single core at a time.

While this analysis provides a good insight into the performance of the highlight_files function, it's always a good idea to perform further testing and optimization based on the specific needs and constraints of your application.

