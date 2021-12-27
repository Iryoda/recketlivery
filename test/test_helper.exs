ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Recketlivery.Repo, :manual)

Mox.defmock(Recketlivery.ViaCep.ClientMock, for: Recketlivery.ViaCep.Behaviour)
