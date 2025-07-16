@n = (10**9).to_f
def cputime(&b)
  if b
    t = cputime
    b.call
    return cputime - t
  end
  Process.clock_gettime(:CLOCK_PROCESS_CPUTIME_ID).round(9)
end
