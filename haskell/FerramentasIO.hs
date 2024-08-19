module FerramentasIO where
import System.Process(callCommand)

limparTela :: IO()
limparTela = callCommand "clear"

