import { useEffect } from "react";
import type { NextPage } from "next";
import { useLocalStorage } from "usehooks-ts";
// import { MetaHeader } from "~~/components/MetaHeader";
// import { ContractUI } from "~~/components/scaffold-eth";
import { ContractName } from "~~/utils/scaffold-eth/contract";
import { getContractNames } from "~~/utils/scaffold-eth/contractNames";

const selectedContractStorageKey = "scaffoldEth2.selectedContract";
const contractNames = getContractNames();

const Proposal: NextPage = () => {
  const [selectedContract, setSelectedContract] = useLocalStorage<ContractName>(
    selectedContractStorageKey,
    contractNames[0],
  );

  useEffect(() => {
    if (!contractNames.includes(selectedContract)) {
      setSelectedContract(contractNames[0]);
    }
  }, [selectedContract, setSelectedContract]);

  return (
    <>
      <div className="flex-grow bg-base-300 w-full mt-16 px-8 py-12">
        <div className="flex justify-center items-center gap-12 flex-col sm:flex-row">
          <div className="flex flex-col bg-base-100 px-10 py-10 text-center items-center max-w-xs rounded-3xl">
            Proposal
            <p>Title : Proposal</p>
            <p>Description: Proposal Description</p>
            <p>
              <button className="btn btn-primary btn-sm normal-case font-thin bg-base-300">Vote For</button>
              <button className="btn btn-primary btn-sm normal-case font-thin bg-base-300">Vote Against</button>
            </p>
          </div>
        </div>
      </div>
    </>
  );
};

export default Proposal;
