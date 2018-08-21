# poa-blockscout-docker

Run [POA BlockScout](https://github.com/poanetwork/blockscout) with two simple commands:

Bring up a database:
```
docker run --name blockscout-postgres \
  -e POSTGRES_PASSWORD=blockscout \
  -e POSTGRES_USER=blockscout \
  --rm -d postgres
```

Bring up BlockScout:
```
docker run -ti --rm --name blockscout \
  --link blockscout-postgres:postgres \
  -p 4000:4000 blockscout
```

Then open a browser window to [http://0.0.0.0:4000](http://0.0.0.0:4000)



<img width="1190" alt="poa blockscout screenshot" src="https://user-images.githubusercontent.com/2653167/44372629-15ab3880-a4a2-11e8-9a52-ee8daebd4bcf.png">


-----------


### [Clevis](https://github.com/austintgriffith/clevis):
```
docker run -ti --rm --name blockscout \
  --link blockscout-postgres:postgres \
  --link clevis:clevis \
  -e ETHEREUM_JSONRPC_VARIANT=geth \
  -e ETHEREUM_JSONRPC_HTTP_URL=http://clevis:8545 \
  -p 4000:4000 blockscout
```
(currently throwing error:)
```
** (FunctionClauseError) no function clause matching in EthereumJSONRPC.Transaction.elixir_to_params/1
    (ethereum_jsonrpc) lib/ethereum_jsonrpc/transaction.ex:106: EthereumJSONRPC.Transaction.elixir_to_params(%{"blockHash" => "0x83706f426d4cab3239935c42d2af2069585dedbe019f98f7d99f938184348105", "blockNumber" => 1, "from" => "0xdebf87caf555837796604a177a462456df26607b", "gas" => 5500000, "gasPrice" => 1600000000, "hash" => "0x94c9770121728693ee6fa12a1785315d6690550e3bd1d7bc9c05d4c54709ea3a", "input" => "0x6080604052348015600f57600080fd5b50603580601d6000396000f3006080604052600080fd00a165627a7a723058206bd6a50040f1d348af1aa5490b88c3323913810d3f120fc2e97d5b55269f215f0029", "nonce" => 0, "to" => "0x0", "transactionIndex" => 0, "value" => 0})
    (elixir) lib/enum.ex:1314: Enum."-map/2-lists^map/1-0-"/2
    (ethereum_jsonrpc) lib/ethereum_jsonrpc.ex:426: EthereumJSONRPC.handle_get_blocks/1
    (indexer) lib/indexer/block_fetcher.ex:197: Indexer.BlockFetcher.import_range/2
    (elixir) lib/task/supervised.ex:89: Task.Supervised.do_apply/2
    (elixir) lib/task/supervised.ex:38: Task.Supervised.reply/5
    (stdlib) proc_lib.erl:249: :proc_lib.init_p_do_apply/3
Last message: {:EXIT, #PID<0.1234.0>, {:function_clause, [{EthereumJSONRPC.Transaction, :elixir_to_params, [%{"blockHash" => "0x83706f426d4cab3239935c42d2af2069585dedbe019f98f7d99f938184348105", "blockNumber" => 1, "from" => "0xdebf87caf555837796604a177a462456df26607b", "gas" => 5500000, "gasPrice" => 1600000000, "hash" => "0x94c9770121728693ee6fa12a1785315d6690550e3bd1d7bc9c05d4c54709ea3a", "input" => "0x6080604052348015600f57600080fd5b50603580601d6000396000f3006080604052600080fd00a165627a7a723058206bd6a50040f1d348af1aa5490b88c3323913810d3f120fc2e97d5b55269f215f0029", "nonce" => 0, "to" => "0x0", "transactionIndex" => 0, "value" => 0}], [file: 'lib/ethereum_jsonrpc/transaction.ex', line: 106]}, {Enum, :"-map/2-lists^map/1-0-", 2, [file: 'lib/enum.ex', line: 1314]}, {EthereumJSONRPC, :handle_get_blocks, 1, [file: 'lib/ethereum_jsonrpc.ex', line: 426]}, {Indexer.BlockFetcher, :import_range, 2, [file: 'lib/indexer/block_fetcher.ex', line: 197]}, {Task.Supervised, :do_apply, 2, [file: 'lib/task/supervised.ex', line: 89]}, {Task.Supervised, :reply, 5, [file: 'lib/task/supervised.ex', line: 38]}, {:proc_lib, :init_p_do_apply, 3, [file: 'proc_lib.erl', line: 249]}]}}
State: %Indexer.Sequence{current: nil, queue: {[], []}, step: -10}
[error] Task #PID<0.1241.0> started from #PID<0.1238.0> terminating
```


### Local Geth Node:
```
docker run -ti --rm --name blockscout \
  --link blockscout-postgres:postgres \
  -e ETHEREUM_JSONRPC_VARIANT=geth \
  -e ETHEREUM_JSONRPC_HTTP_URL=http://0.0.0.0:8545 \
  -p 4000:4000 blockscout
```
(currently throwing error:)
```
Function: &Indexer.BlockFetcher.Catchup.task/1
    Args: [%Indexer.BlockFetcher.Catchup{block_fetcher: %Indexer.BlockFetcher{blocks_batch_size: 10, blocks_concurrency: 10, broadcast: false, callback_module: Indexer.BlockFetcher.Catchup, json_rpc_named_arguments: [transport: EthereumJSONRPC.HTTP, transport_options: [http: EthereumJSONRPC.HTTP.HTTPoison, url: "http://0.0.0.0:8545", http_options: [recv_timeout: 60000, timeout: 60000, hackney: [pool: :ethereum_jsonrpc]]], variant: EthereumJSONRPC.Geth], receipts_batch_size: 250, receipts_concurrency: 10, sequence: nil}, bound_interval: %Indexer.BoundInterval{current: 2500, maximum: 25000, minimum: 2500}, task: nil}]
[error] Catchup index stream exited with reason ({{:badmatch, {:error, :econnrefused}}, [{Indexer.BlockFetcher.Catchup, :task, 1, [file: 'lib/indexer/block_fetcher/catchup.ex', line: 55]}, {Task.Supervised, :do_apply, 2, [file: 'lib/task/supervised.ex', line: 89]}, {Task.Supervised, :reply, 5, [file: 'lib/task/supervised.ex', line: 38]}, {:proc_lib, :init_p_do_apply, 3, [file: 'proc_lib.erl', line: 249]}]}). Restarting
[error] Task #PID<0.1081.0> started from Indexer.BlockFetcher.Supervisor terminating
** (MatchError) no match of right hand side value: {:error, :econnrefused}
    (indexer) lib/indexer/block_fetcher/catchup.ex:55: Indexer.BlockFetcher.Catchup.task/1
    (elixir) lib/task/supervised.ex:89: Task.Supervised.do_apply/2
    (elixir) lib/task/supervised.ex:38: Task.Supervised.reply/5
    (stdlib) proc_lib.erl:249: :proc_lib.init_p_do_apply/3
```


### Local Geth Node (by IP address):
```
docker run -ti --rm --name blockscout \
  --link blockscout-postgres:postgres \
  -e ETHEREUM_JSONRPC_VARIANT=geth \
  -e ETHEREUM_JSONRPC_HTTP_URL=http://10.0.0.107:8545 \
  -p 4000:4000 blockscout
```
(currently throwing error:)
```
** (FunctionClauseError) no function clause matching in EthereumJSONRPC.Transaction.elixir_to_params/1
    (ethereum_jsonrpc) lib/ethereum_jsonrpc/transaction.ex:106: EthereumJSONRPC.Transaction.elixir_to_params(%{"blockHash" => "0x83706f426d4cab3239935c42d2af2069585dedbe019f98f7d99f938184348105", "blockNumber" => 1, "from" => "0xdebf87caf555837796604a177a462456df26607b", "gas" => 5500000, "gasPrice" => 1600000000, "hash" => "0x94c9770121728693ee6fa12a1785315d6690550e3bd1d7bc9c05d4c54709ea3a", "input" => "0x6080604052348015600f57600080fd5b50603580601d6000396000f3006080604052600080fd00a165627a7a723058206bd6a50040f1d348af1aa5490b88c3323913810d3f120fc2e97d5b55269f215f0029", "nonce" => 0, "to" => "0x0", "transactionIndex" => 0, "value" => 0})
    (elixir) lib/enum.ex:1314: Enum."-map/2-lists^map/1-0-"/2
    (ethereum_jsonrpc) lib/ethereum_jsonrpc.ex:426: EthereumJSONRPC.handle_get_blocks/1
    (indexer) lib/indexer/block_fetcher.ex:197: Indexer.BlockFetcher.import_range/2
    (elixir) lib/task/supervised.ex:89: Task.Supervised.do_apply/2
    (elixir) lib/task/supervised.ex:38: Task.Supervised.reply/5
    (stdlib) proc_lib.erl:249: :proc_lib.init_p_do_apply/3
Function: &:erlang.apply/2
    Args: [#Function<8.109633770/1 in Indexer.BlockFetcher.stream_import/1>, [2..0]]
[error] Catchup index stream exited with reason ({:function_clause, [{EthereumJSONRPC.Transaction, :elixir_to_params, [%{"blockHash" => "0x83706f426d4cab3239935c42d2af2069585dedbe019f98f7d99f938184348105", "blockNumber" => 1, "from" => "0xdebf87caf555837796604a177a462456df26607b", "gas" => 5500000, "gasPrice" => 1600000000, "hash" => "0x94c9770121728693ee6fa12a1785315d6690550e3bd1d7bc9c05d4c54709ea3a", "input" => "0x6080604052348015600f57600080fd5b50603580601d6000396000f3006080604052600080fd00a165627a7a723058206bd6a50040f1d348af1aa5490b88c3323913810d3f120fc2e97d5b55269f215f0029", "nonce" => 0, "to" => "0x0", "transactionIndex" => 0, "value" => 0}], [file: 'lib/ethereum_jsonrpc/transaction.ex', line: 106]}, {Enum, :"-map/2-lists^map/1-0-", 2, [file: 'lib/enum.ex', line: 1314]}, {EthereumJSONRPC, :handle_get_blocks, 1, [file: 'lib/ethereum_jsonrpc.ex', line: 426]}, {Indexer.BlockFetcher, :import_range, 2, [file: 'lib/indexer/block_fetcher.ex', line: 197]}, {Task.Supervised, :do_apply, 2, [file: 'lib/task/supervised.ex', line: 89]}, {Task.Supervised, :reply, 5, [file: 'lib/task/supervised.ex', line: 38]}, {:proc_lib, :init_p_do_apply, 3, [file: 'proc_lib.erl', line: 249]}]}). Restarting
[error] GenServer #PID<0.1071.0> terminating
```
