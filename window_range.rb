def windowed_max_range(arr, window_size)
  max_range = 0
  starting_index = 0

  until starting_index > arr.length - window_size
    ending_index = starting_index + window_size - 1
    window = arr[starting_index..ending_index]
    #do some min max stuff
    min = window.min
    max = window.max
    window_range = max - min

    if window_range > max_range
      max_range = window_range
    end

    starting_index += 1
  end

  max_range
end
