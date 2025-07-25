%extend lldb::SBMemoryRegionInfoList {
#ifdef SWIGPYTHON
    %pythoncode%{
    def __len__(self):
      '''Return the number of memory region info in a lldb.SBMemoryRegionInfoList object.'''
      return self.GetSize()

    def __iter__(self):
      '''Iterate over all the memory regions in a lldb.SBMemoryRegionInfoList object.'''
      import lldb
      size = self.GetSize()
      for i in range(size):
        region = lldb.SBMemoryRegionInfo()
        self.GetMemoryRegionAtIndex(i, region)
        yield region
    %}
#endif
}
