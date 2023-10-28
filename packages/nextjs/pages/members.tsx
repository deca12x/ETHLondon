import Link from "next/link";
import type { NextPage } from "next";

// import { BugAntIcon, MagnifyingGlassIcon } from "@heroicons/react/24/outline";
// import { MetaHeader } from "~~/components/MetaHeader";

const Members: NextPage = () => {
  return (
    <>
      {/* <MetaHeader /> */}
      <div className="flex items-center flex-col flex-grow pt-10">
        {/* <div className="px-5">
          <h1 className="text-center mb-8">
            <span className="block text-2xl mb-2">Welcome to</span>
            <span className="block text-4xl font-bold">Scaffold-ETH 2</span>
          </h1>
          <p className="text-center text-lg">
            Get started by editing{" "}
            <code className="italic bg-base-300 text-base font-bold max-w-full break-words break-all inline-block">
              packages/nextjs/pages/index.tsx
            </code>
          </p>
          <p className="text-center text-lg">
            Edit your smart contract{" "}
            <code className="italic bg-base-300 text-base font-bold max-w-full break-words break-all inline-block">
              YourContract.sol
            </code>{" "}
            in{" "}
            <code className="italic bg-base-300 text-base font-bold max-w-full break-words break-all inline-block">
              packages/hardhat/contracts
            </code>
          </p>
        </div> */}

        <div className="flex-grow bg-base-300 w-full mt-16 px-8 py-12">
          <div className="flex justify-center items-center gap-12 flex-col sm:flex-row">
            <div className="flex flex-col bg-base-100 px-10 py-10 text-center items-center max-w-xs rounded-3xl">
              <h1>Software</h1> <p>Member 1</p>
              <p>Member 2</p>
              <p>Member 3</p>
              <p>Free Slot</p>
            </div>
            <div className="flex flex-col bg-base-100 px-10 py-10 text-center items-center max-w-xs rounded-3xl">
              <h1>Marketing</h1> <p>Member 1</p>
              <p>Member 2</p>
              <p>Free Slot</p>
              <p>Free Slot</p>
            </div>
            <div className="flex flex-col bg-base-100 px-10 py-10 text-center items-center max-w-xs rounded-3xl">
              <h1>Legal</h1> <p>Member 1</p>
              <p>Member 2</p>
              <p>Member 3</p>
              <p>Free Slot</p>
            </div>
            <div className="flex flex-col bg-base-100 px-10 py-10 text-center items-center max-w-xs rounded-3xl">
              <h1>Finance</h1>
              <p>Member 1</p>
              <p>Free Slot</p>
              <p>Free Slot</p>
              <p>Free Slot</p>
            </div>
          </div>
          <div className="flex justify-center items-center gap-12 flex-col sm:flex-row mt-12">
            <Link href="/" passHref className="link">
              <button className="btn btn-secondary btn-sm normal-case font-thin bg-base-300">Home</button>
            </Link>{" "}
          </div>
        </div>
      </div>
    </>
  );
};

export default Members;
