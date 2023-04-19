#show heading: set text(font: "Linux Biolinum")

#show link: underline
#set page(
 margin: (x: 0.9cm, y: 1.3cm),
)
#set par(justify: true)

#let chiline() = {v(-3pt); line(length: 100%); v(-5pt)}

= Eva Pace (she/her)

#link("https://github.com/evaporei")[Github] | #link("https://gitlab.freedesktop.org/eva")[Gitlab] | #link("https://www.linkedin.com/in/evapace/")[LinkedIn] |
#link("mailto:eba.pachi@gmail.com")[eba.pachi\@gmail.com]

#chiline()

Software Engineer with 6 years of experience. Worked with Web, FFI, WebAssembly and Blockchain. Currently looking for a low-level role in compilers or computer graphics.

== Experience
#chiline()

*Rust Engineer* #h(1fr) 2021/04 -- 2023/02 \
Edge & Node #h(1fr) San Francisco, US (remote)
\
I've worked to make #link("https://thegraph.com")[The Graph] move forward in the decentralization of public data. Delivered features such as: \
- Integration of our first non-EVM compatible chain, NEAR Protocol;
- Update of our AssemblyScript version, from the oldest to the newest (\~2 year change) that required a lot of ABI changes in our runtime code (WASM).
Most of the code I made there is open source:
- #link("https://github.com/graphprotocol/graph-node")[Rust node that indexes blockchain data and serves it via GraphQL];
- #link("https://github.com/graphprotocol/graph-tooling")[JS CLI tool for creating subgraphs];
- #link("https://github.com/graphprotocol/graph-ts")[AssemblyScript standard library].

*Senior Software Engineer* #h(1fr) 2020/07 -- 2021/03 \
Magazine Luiza #h(1fr) São Paulo, Brazil (remote) \
I worked at MagaluPay, the company's digital account, that has over 2 million users. Took part in most of the new integration with the new government instant payments API (PIX). \

*Software Engineer* #h(1fr) 2017/10 -- 2020/07 \
Pagar.me #h(1fr) São Paulo, Brazil (on-site)
- Developed multiple features at the core payments API;
- Developed the payment link product;
- Took front in a project that interpreted and parsed payments terminal commands using Rust, FFI and WebAssembly. \

*Junior Software Engineer* #h(1fr) 2017/04 -- 2017/09 \
FCamara #h(1fr) São Paulo, Brazil (on-site) \
I worked at LinkApi, a start up that is an application integration tool, much like #link("https://zapier.com")[Zapier]. I did a lot of integration with multiple third party APIs, mostly REST and SOAP. \

== Education
#chiline()

*Software Systems: Behind the Abstractions* - Bradfield CS (remote) #h(1fr) 2022/09 -- 2022/11 \

*Purely Functional Data Structures* - UFABC (Santo André, Brazil) #h(1fr) 2019/11 \

*Category Theory* - UFABC (Santo André, Brazil) #h(1fr) 2019/08 \

*Analysis and Systems Development (Associate Degree)* - FIAP (São Paulo, Brazil) #h(1fr) 2015/01 -- 2016/12 \

== Extra-curricular Activities
#chiline()

*Talk: How allocating zero bytes can be useful to remove lazyness* - GambiConf (Brazil, remote) #h(1fr) 2021/12 \
Talk about a workaround done at The Graph to make an AssemblyScript compiler internal lazy variable
be evaluated eagerly. Link for: #link("https://github.com/evaporei/gambi-talk")[slides] and #link("https://www.youtube.com/watch?v=dExsHjzqnGU")[video].\

*Podcast: Rust* - TOTVS (Brazil, remote) #h(1fr) 2020/11 \
Guest on a podcast about Rust. We talked about the advantages and disadvantages of the language and ecosystem. #link("https://www.buzzsprout.com/774398/6533485-totvs-developers-21-rust")[Podcast link].\

*Talk: Interop with Android, IOS and WASM in the same project* - Rust LATAM (Uruguay, on-site) #h(1fr) 2019/03 \
Talk about how we did a Rust library at Pagar.me which had to be compiled to Android, iOS and WASM at the same time. Links for: #link("https://www.youtube.com/watch?v=W-HUyTwV4LA")[video] and #link("https://github.com/evaporei/doom-fire-interop")[repository].\
