function table_summary = summarize(mytable)
    table_summary = cell2table(cell( size(mytable,2),5));
    table_summary.Properties.RowNames = columns;
    table_summary.Properties.VariableNames = columns;
    
    for column  = columns
       column = column{:}; %from cell to string
       data = mytable.(column);
       table_summary.columnname = column;
       table_summary.shape = size(data);
       table_summary.datatype = class(data);
       table_summary.uniquevalues = {unique(data)};
       
       if isa(data, 'categorical')
        table_summary.nans = length(find(isundefined(data)));
       else
        table_summary.nans = length(find(isnan(data)));
       end  
    end
end