
const numberMap: { [key: string]: string } = {
    zero: "0",
    one: "1",
    two: "2",
    three: "3",
    four: "4",
    five: "5",
    six: "6",
    seven: "7",
    eight: "8",
    nine: "9",
};

const digitsRegex = /\d/g;
const digitWordRegex = new RegExp(`(?=(${digitsRegex.source}|${Object.keys(numberMap).join("|")}))`, "gi");

const getLines = async () => {
    const path = "./day-1/input.txt";
    const file = Bun.file(path);
    
    const text = (await file.text()).trim();
    
    return text.split("\n");
}

const wordToNumber = (word: string) => {
    return numberMap[word] ?? word;
}

export const runPart1 = async () => {
    
    const lines = await getLines();
    
    const total = lines.reduce((total, line) => {
        const ints = line.match(digitsRegex); // This should be fine here as a digit can only be 1 char long
        const first = ints?.at(0) ?? "0";
        const last = ints?.at(-1) ?? "0";
        return total + parseInt(first + last);
    }, 0);
    return total;
}

export const runPart2 = async () => {
    
    const lines = await getLines();

    const total = lines.reduce((total, line) => {
        const ints = [...line.matchAll(digitWordRegex)]; //There can be letter overlap, match consumes these letters and we lose info. Lesson Learnt!
        const filtered = ints.flat().filter(n => n) // Remove empty strings
        const first = wordToNumber(filtered.at(0) ?? "0");
        const last = wordToNumber(filtered.at(-1) ?? "0");
        return total + parseInt(first + last);
    }, 0);
    return total;
}