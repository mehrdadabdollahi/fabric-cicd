[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Products_DataDestination", IsNewTarget = true], Settings = [Kind = "Manual", AllowCreation = true, ColumnSettings = [Mappings = {[SourceColumnName = "ProductID", DestinationColumnName = "ProductID"], [SourceColumnName = "ProductName", DestinationColumnName = "ProductName"], [SourceColumnName = "Category", DestinationColumnName = "Category"], [SourceColumnName = "UnitPrice", DestinationColumnName = "UnitPrice"], [SourceColumnName = "CreatedDate", DestinationColumnName = "CreatedDate"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared Products = let
  Source = FabricSql.Contents([HierarchicalNavigation = null]),
  #"Navigation 1" = Source{[workspaceId = WorkspaceID]}[Data],
  #"Navigation 2" = #"Navigation 1"{[sqlId = SQLObjectID]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Schema = "dbo", Item = "Products"]}[Data],
  #"Removed columns" = Table.RemoveColumns(#"Navigation 3", {"Sales"})
in
  #"Removed columns";
shared Products_DataDestination = let
  Pattern = Fabric.Warehouse([HierarchicalNavigation = null, CreateNavigationProperties = false]),
  Navigation_1 = Pattern{[workspaceId = "7eeefc25-b6f6-4e61-a50b-7137451f9192"]}[Data],
  Navigation_2 = Navigation_1{[warehouseId = "eb74258e-e833-4e54-9eb2-e48bd17bc145"]}[Data],
  TableNavigation = Navigation_2{[Item = "Products", Schema = "dbo"]}?[Data]?
in
  TableNavigation;
shared WorkspaceID = "7eeefc25-b6f6-4e61-a50b-7137451f9192" meta [IsParameterQuery = true, IsParameterQueryRequired = true, Type = type text];
shared SQLObjectID = "14053e54-7dfa-4c4a-9280-1c13def25b28" meta [IsParameterQuery = true, IsParameterQueryRequired = true, Type = type text];
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Customers_DataDestination", IsNewTarget = true], Settings = [Kind = "Manual", AllowCreation = true, ColumnSettings = [Mappings = {[SourceColumnName = "CustomerID", DestinationColumnName = "CustomerID"], [SourceColumnName = "FirstName", DestinationColumnName = "FirstName"], [SourceColumnName = "LastName", DestinationColumnName = "LastName"], [SourceColumnName = "Email", DestinationColumnName = "Email"], [SourceColumnName = "City", DestinationColumnName = "City"], [SourceColumnName = "Country", DestinationColumnName = "Country"], [SourceColumnName = "CreatedDate", DestinationColumnName = "CreatedDate"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared Customers = let
  Source = FabricSql.Contents([HierarchicalNavigation = null]),
  #"Navigation 1" = Source{[workspaceId = WorkspaceID]}[Data],
  #"Navigation 2" = #"Navigation 1"{[sqlId = SQLObjectID]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Schema = "dbo", Item = "Customers"]}[Data],
  #"Removed columns 1" = Table.RemoveColumns(#"Navigation 3", {"Sales"})
in
  #"Removed columns 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Sales_DataDestination", IsNewTarget = true], Settings = [Kind = "Manual", AllowCreation = true, ColumnSettings = [Mappings = {[SourceColumnName = "SalesID", DestinationColumnName = "SalesID"], [SourceColumnName = "CustomerID", DestinationColumnName = "CustomerID"], [SourceColumnName = "ProductID", DestinationColumnName = "ProductID"], [SourceColumnName = "Quantity", DestinationColumnName = "Quantity"], [SourceColumnName = "UnitPrice", DestinationColumnName = "UnitPrice"], [SourceColumnName = "TotalAmount", DestinationColumnName = "TotalAmount"], [SourceColumnName = "SalesDate", DestinationColumnName = "SalesDate"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared Sales = let
  Source = FabricSql.Contents([HierarchicalNavigation = null]),
  #"Navigation 1" = Source{[workspaceId = WorkspaceID]}[Data],
  #"Navigation 2" = #"Navigation 1"{[sqlId = SQLObjectID]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Schema = "dbo", Item = "Sales"]}[Data],
  #"Removed columns" = Table.RemoveColumns(#"Navigation 3", {"Products", "Customers"})
in
  #"Removed columns";
shared Customers_DataDestination = let
  Pattern = Fabric.Warehouse([CreateNavigationProperties = false]),
  Navigation_1 = Pattern{[workspaceId = "7eeefc25-b6f6-4e61-a50b-7137451f9192"]}[Data],
  Navigation_2 = Navigation_1{[warehouseId = "eb74258e-e833-4e54-9eb2-e48bd17bc145"]}[Data],
  TableNavigation = Navigation_2{[Item = "Customers", Schema = "dbo"]}?[Data]?
in
  TableNavigation;
shared Sales_DataDestination = let
  Pattern = Fabric.Warehouse([CreateNavigationProperties = false]),
  Navigation_1 = Pattern{[workspaceId = "7eeefc25-b6f6-4e61-a50b-7137451f9192"]}[Data],
  Navigation_2 = Navigation_1{[warehouseId = "eb74258e-e833-4e54-9eb2-e48bd17bc145"]}[Data],
  TableNavigation = Navigation_2{[Item = "Sales", Schema = "dbo"]}?[Data]?
in
  TableNavigation;
