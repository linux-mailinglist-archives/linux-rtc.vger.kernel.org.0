Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2FE51D2249
	for <lists+linux-rtc@lfdr.de>; Thu, 14 May 2020 00:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730087AbgEMWqu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 13 May 2020 18:46:50 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:36641 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbgEMWqu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 13 May 2020 18:46:50 -0400
IronPort-SDR: OT24Xiv7NZKVMwwu9K3ZBHOL/2Vkt5fJTU7zAoxBXebtfdv4pUKE8He00Bjo6SjYoAHjTBPipJ
 cb6p+3PMpALW4ITYp9P564IKEe/0cq924ZlQFVsT4zjXAkupjGyw+pktKJqcx/0yS0g2sZZceV
 T4h0BKxmiYJNo7m5kV9va6EeJ0FzBANEHyzA1AS1wXoSBWPhka5UVK+6he0oWeDgJYGzaJ22jI
 nKcGsBPou0BprEKfH4+xV8MkVr1HOM1Mq5frzS4kwbJtobNjklXZSYCXH8B5DaSjEaoMq62SfO
 ELw=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; 
   d="scan'208";a="137958313"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 14 May 2020 06:46:49 +0800
IronPort-SDR: w6/O5c8J/6iMmhPv6IErpNkdmumnY3s6FlTQP7ocfz4MshpbgtiMdZgCFM6+D0pm2XsGORlZFz
 SvGNk5uRrlY3o5aDMXYudxf9FMS64BdUc=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 15:36:29 -0700
IronPort-SDR: jiz/g/5aadFtLFaXk2lng4y2WevEjuWwYCuaiWUu2C20ZELZ/uLbW+D46VN+vDT7vMmyEge1zo
 F6ZFCJ3FoI7g==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 15:46:47 -0700
X-Received: from MN2PR04MB7021.namprd04.prod.outlook.com (2603:10b6:a03:74::17)
 by BYAPR04MB5176.namprd04.prod.outlook.com with HTTPS via
 BYAPR05CA0040.NAMPRD05.PROD.OUTLOOK.COM; Wed, 13 May 2020 22:35:13 +0000
X-Received: from BN4PR11CA0005.namprd11.prod.outlook.com (2603:10b6:403:1::15)
 by MN2PR04MB7021.namprd04.prod.outlook.com (2603:10b6:208:1e6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.24; Wed, 13 May
 2020 22:35:12 +0000
X-Received: from BN3NAM04FT016.eop-NAM04.prod.protection.outlook.com
 (2603:10b6:403:1:cafe::81) by BN4PR11CA0005.outlook.office365.com
 (2603:10b6:403:1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.29 via Frontend
 Transport; Wed, 13 May 2020 22:35:12 +0000
Authentication-Results: spf=none (sender IP is 216.71.154.42)
 smtp.mailfrom=linux-mips.org; wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=none action=none header.from=linux-mips.org;
X-Received: from esa4.hgst.iphmx.com (216.71.154.42) by
 BN3NAM04FT016.mail.protection.outlook.com (10.152.92.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Wed, 13 May 2020 22:35:10 +0000
Authentication-Results-Original: esa4.hgst.iphmx.com; dkim=none (message not
 signed) header.i=none; spf=None smtp.mailfrom=macro@linux-mips.org; spf=None
 smtp.helo=postmaster@cvs.linux-mips.org
X-Ironport-Dmarc-Check-Result: validskip
IronPort-SDR: KOrFUC4XMazWOHhIo/8W/LlsJG2RYy5RYHLLyMTS25H3Ta276wai88F3fyZiIUlouDzloQhxbM
 P++AxioluZl8kk6xiTPFgE4ZJlRC0f0XTjTQeADt0VGTzgx/caa6Lk9anoEjUiJGW/DLoZJ+qJ
 iMQKtHFbbJE+JXJxUgUAzi25i6Z14YScp+F2ZJKXDgVGZtTj4Eus6Wqu8km4MUSKUEowt9gKIC
 R/RmSt0LBy3AOXbjSgOocjN980/qlODPcy0QzibcARCDT9H4+cYDh5riuv4sg1Sa1LuDGwBay1
 kgxUEVqJ/+mSN+o/zFGSavmu
IronPort-PHdr: =?us-ascii?q?9a23=3A+9L4rxe5fd5biZ3QcZQEm7zblGMj4u6mDksu8p?=
 =?us-ascii?q?Mizoh2WeGdxcS5bB7h7PlgxGXEQZ/co6odzbaP7uaxBCdYsN6oizMrSNR0TR?=
 =?us-ascii?q?gLiMEbzUQLIfWuLgnFFsPsdDEwB89YVVVorDmROElRH9viNRWJ+iXhpTEdFQ?=
 =?us-ascii?q?/iOgVrO+/7BpDdj9it1+C15pbffxhEiCCybL9vLBi6twHcu8kZjYd+Lqs61w?=
 =?us-ascii?q?fErGZPd+lK321jOEidnwz75se+/Z5j9zpftvc8/MNeUqv0Yro1Q6VAADspL2?=
 =?us-ascii?q?466svrtQLeTQSU/XsTTn8WkhtTDAfb6hzxQ4r8vTH7tup53ymaINH2QLUpUj?=
 =?us-ascii?q?ms86tnVBnlgzocOjUn7G/YlNB/jKNDoBKguRN/xZLUYJqIP/Z6Z6/RYM8WSX?=
 =?us-ascii?q?ZEUstXSidPAJ6zb5EXAuQPPehWsZTzqFkNoxuwCgajGPjiyiNUinPqwaE2z/?=
 =?us-ascii?q?gtHR/A0Qc9H9wOqnPUrNDtOascVu661rXHzTTdYPNUxDzy6JLEeQ09r/GLXL?=
 =?us-ascii?q?NxcdbeyUouFw/Lk16dronlMCmJ2eQXtGiW9O5gVeOpi246pAB9uz2vxsY0io?=
 =?us-ascii?q?nSnI4VzUrE9SpgzYszONa3R1J1b8S+H5tMqyGVKZF2QsU6Tmxouys3yb4Lt5?=
 =?us-ascii?q?G6cSUO1pkq2gPTZuKEfoaI/B/uVPqcLCtmiH54Zb6yiQq//Va9x+PyWcS50V?=
 =?us-ascii?q?hHojdFnNTPq3wA0QHY5MufSvZl40us1jWC2xrN5uxEPEw4j67WJp47zrItmJ?=
 =?us-ascii?q?ceskLOFTLslkrslq+ZbEAk9/Co6+v5ZrXmoYeROJNqigHlKKguns2/AeIlMg?=
 =?us-ascii?q?kBRmSb/OW81KX4/UHjR7VKlPI2nrHYsJDcO8sbura0DxJa34sg8RqzETer3M?=
 =?us-ascii?q?kCkXQDLF9JYg+LgobqNl3WJfD3F/a/g1CikDdxwPDGO6XsApDXIXffirfheq?=
 =?us-ascii?q?1w60pdyAo10NBe6ItYCrQAIPLrQU/9rtvYDgU2MwCs2eboFM191p8CWWKIGq?=
 =?us-ascii?q?KZNbndvkOS5uIoOOSNapIatyrnJ/c54P7uiCxxpVhIVLOv0dM9ZWq3G/1gJQ?=
 =?us-ascii?q?3NaGDqjv8IC2EGtEwyQbq5pkeFVGsZQn+5Xq8+rg59QLihH5bIRYHnyOiE1S?=
 =?us-ascii?q?yhGbVSZ2ZbGhWJEG/zMYKeVKFfO2qpPsZ9n2lcBvCaQIg72ETr7VeikeA1B/?=
 =?us-ascii?q?fI+iAeqZPo3cR04OuWrxwp6DhoFJ3DizOAVGgo2GMHXCNw3bh/pFw7wVCGgu?=
 =?us-ascii?q?B0gP1dQNpU4f4BEgI3LoXVwOEyDdfuEhnAcdGERBfuQtivDTwrCNNkxdgIbh?=
 =?us-ascii?q?U1AM2s2zbE2SfiGLoJj/qODZ0w/Ljb2i30Ls1nzF7C1a88nxwjQ9NUc2q8if?=
 =?us-ascii?q?037BDdUqjOlUjRjKO2beIc0SrKoX+E1naLtVpEXRRYWrveG3QeYFbG6NH4/l?=
 =?us-ascii?q?iESKWhUO51CAZKxM+cJ6cPUeXH1wQcFtHkPtmWI2+qkjv2BRmT2vWNdIrvay?=
 =?us-ascii?q?MW2yCPQE4D2xse+3qLL0A3GzuhrmTCDTdvCUOKAQuk8O9wr2m+R1M1yAfCZl?=
 =?us-ascii?q?No1r688BoYzfKGTPZb0rUBsSYn4zJ6VFO01MjRI96BoRdxOaBdech7501IlA?=
 =?us-ascii?q?e7/0R8MpGmM6F+lwsbegVzsVnp0kY/AYFBnM426XIymVMueeTCjQoHJm7ehM?=
 =?us-ascii?q?ugadi1YiHo8RuiarDbwATTy9/KvKcA8+h+qk3juRHvHU0noBAFm5FY1WWR4p?=
 =?us-ascii?q?LSAU8cS5X0Bwwy/hNgoJneYy8g98bR1GV3d66uvXWRvrBhTPtg0Rumc9pFZe?=
 =?us-ascii?q?mBHQToFOUeBs6zOKkvmkCyKBUeM6oBvL5xNMSgefyc3aetN+s1hyqoumNB5J?=
 =?us-ascii?q?EkiBC2+iFxS/DF09M++9/DhlrVcTD6gR/hv9v+xcZEaioOWGunyS30QoVWY/?=
 =?us-ascii?q?86e4FDEmqoL8Ctjtxjm57gXWJZ/1+/FjZkkIeofxSVdVn0wQxX0wwev3WmnS?=
 =?us-ascii?q?KyyzE8nSsuq+KT2ynHwuKqcxRiWCYDXG55kVLlOpS5lfgRQlPuawkviQvg4E?=
 =?us-ascii?q?fi3O5cvqs+Z2jfTEFUfjTnemFvVqzj09jKK8VL6Z4urWBWSLHlPQDcEOOk5U?=
 =?us-ascii?q?pHlXq4TzgW3j0wejC0t4+skgdz1CSdI21v6nvBecRggxzY4Y+5J7YZ0zwYSS?=
 =?us-ascii?q?1/kTSSCEK7Oozj+NyfjZDrtuG4SnLkU5xLam/s14zK507ZrSV6RAaymfy+gI?=
 =?us-ascii?q?itCQ8hzSryzMVnTw3Dsg26ZojtyrT/NON/ZQ9vHlC2uK8YUslu14A3gp8Xw3?=
 =?us-ascii?q?0TgJ6YqGEfn1D0N9FKgPOsXD82XTcOhuXtzk3g0UxnIGiOwtunBHGcxNZxIt?=
 =?us-ascii?q?y7enhQ3TgyvZgTVfWkqYdclC4wmWKW6ALcZf8nxmUW1+Bo7H8cnvFMvQs11W?=
 =?us-ascii?q?OaGL9ARUQ=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0FTAgC0dbxefYpf+5RmHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQFAgUeCJYFrAwQLjVKHYCWbYA8BOwQBAYREAoIrBjoTAgMBAQE?=
 =?us-ascii?q?DAgUBAQEEAQEBAgEBAQMCAQEBAQIQAQEWOjRgU4FHgUEsCQYDATuCOykBg2I?=
 =?us-ascii?q?BAQECARIoPwULC0ZXBjWFXAUgpCYBgSg+AiMBPwEMgQWJfoE0inKBOIxWBoF?=
 =?us-ascii?q?BP4ERMwOCWj6EBoY8BJEZAaFkBwOCTY4gihQdgl2Nbox+r3UhgVh9CIMlTAE?=
 =?us-ascii?q?CAQIBDAECAgEBAQIBAQgBAQEBnwZDZwIGCAEBAwmNEII0AQE?=
X-IPAS-Result: =?us-ascii?q?A0FTAgC0dbxefYpf+5RmHAEBAQEBAQcBARIBAQQEAQFAg?=
 =?us-ascii?q?UeCJYFrAwQLjVKHYCWbYA8BOwQBAYREAoIrBjoTAgMBAQEDAgUBAQEEAQEBA?=
 =?us-ascii?q?gEBAQMCAQEBAQIQAQEWOjRgU4FHgUEsCQYDATuCOykBg2IBAQECARIoPwULC?=
 =?us-ascii?q?0ZXBjWFXAUgpCYBgSg+AiMBPwEMgQWJfoE0inKBOIxWBoFBP4ERMwOCWj6EB?=
 =?us-ascii?q?oY8BJEZAaFkBwOCTY4gihQdgl2Nbox+r3UhgVh9CIMlTAECAQIBDAECAgEBA?=
 =?us-ascii?q?QIBAQgBAQEBnwZDZwIGCAEBAwmNEII0AQE?=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; 
   d="scan'208";a="137621458"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-Received: from eddie.linux-mips.org (HELO cvs.linux-mips.org) ([148.251.95.138])
  by esa4.hgst.iphmx.com with ESMTP; 14 May 2020 06:35:01 +0800
X-Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23994955AbgEMWezZd6k8 (ORCPT <rfc822;macro@wdc.com>);
        Thu, 14 May 2020 00:34:55 +0200
Date:   Sun, 10 May 2020 02:27:10 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Arnd Bergmann <arnd@arndb.de>
cc:     Mikulas Patocka <mpatocka@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v4] alpha: add a barrier after outb, outw and outl
In-Reply-To: <CAK8P3a3SBg=w72KVgGUGAUcmU-6RxrQW=mnYf8vmFjBL5jbDpg@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.2005100153470.487915@eddie.linux-mips.org>
References: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com> <alpine.LRH.2.02.2005061308220.18599@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005070404420.5006@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com>
 <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com> <alpine.LRH.2.02.2005071145250.15191@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a3SBg=w72KVgGUGAUcmU-6RxrQW=mnYf8vmFjBL5jbDpg@mail.gmail.com>
Content-Type: text/plain; charset=US-ASCII
X-ReSent-Date: Wed, 13 May 2020 23:34:55 +0100 (BST)
X-Resent-Sender: "Maciej W. Rozycki" <macro@linux-mips.org>
X-ReSent-From: "Maciej W. Rozycki" <macro@linux-mips.org>
X-ReSent-To: "Maciej W. Rozycki" <macro@wdc.com>
X-ReSent-Subject: Re: [PATCH v4] alpha: add a barrier after outb, outw and
 outl
X-ReSent-Message-ID: <alpine.LFD.2.21.2005132334552.1120869@eddie.linux-mips.org>
X-Return-Path: macro@linux-mips.org
X-MS-Exchange-Organization-ExpirationStartTime: 13 May 2020 22:35:11.1155
 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: 248fb7f2-0ebb-4c1a-5cad-08d7f78de5a0
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:216.71.154.42;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:esa4.hgst.iphmx.com;PTR:esa4.hgst.iphmx.com;CAT:NONE;SFTY:;SFS:(4636009)(33430700002)(6666004)(4326008)(107886003)(5660300002)(356005)(42186006)(7636003)(33440700001)(82310400002)(7596003)(6862004)(54906003)(8676002)(336012)(34756004)(86362001)(8936002)(1096003)(26005)(1736002);DIR:INB;SFP:;
X-MS-PublicTrafficType: Email
X-MS-Exchange-Organization-AuthSource: BN3NAM04FT016.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-OriginatorOrg: sharedspace.onmicrosoft.com
X-MS-Office365-Filtering-Correlation-Id: 248fb7f2-0ebb-4c1a-5cad-08d7f78de5a0
X-MS-TrafficTypeDiagnostic: MN2PR04MB7021:
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-Organization-SCL: 1
X-Microsoft-Antispam: BCL:0;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2020 22:35:10.8717
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 248fb7f2-0ebb-4c1a-5cad-08d7f78de5a0
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=b61c8803-16f3-4c35-9b17-6f65f441df86;Ip=[216.71.154.42];Helo=[esa4.hgst.iphmx.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB7021
X-MS-Exchange-Transport-EndToEndLatency: 00:00:02.6897821
X-MS-Exchange-Processed-By-BccFoldering: 15.20.2979.027
X-Microsoft-Antispam-Mailbox-Delivery: ucf:1;jmr:0;auth:0;dest:C;OFR:CustomRules;ENG:(20160514016)(750127)(520002050)(944506383)(944626516);
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mDqpm7pB1g8oQ/32atlzuMHhUVNKIswVU9rp0ZZUD6bO+Pj2tm57o8XbBjkY?=
 =?us-ascii?Q?j+HbLCdTIFH2n1pX28Cw8DyFL3HE/Ffjdh63DmflDPZL7KfizczzFsBqIPEF?=
 =?us-ascii?Q?u++4RfZ76Px3JpH1vHj7Gs4U3FJ59J48xXj2lht5mfD4zkdJ7LGf4/YNSzRl?=
 =?us-ascii?Q?bOKARFw9/nv7cDMGUsmyJe8mrTePFlt0rPcolVU52V49yva2kQLPJgmQwhXm?=
 =?us-ascii?Q?Uhlhr5s+dC5X3OR3HUNDL9FQJRK5S6eUp/oFsklR9uhpWXfFKEUSNU9xzjc2?=
 =?us-ascii?Q?MWd7Pva/OwLB2UXbPLLVFlza0A0jsuoeRV1gI79Y6iWJuWCwJLHgAQ67xoKj?=
 =?us-ascii?Q?K87bFDIcnrf9RXYyxlhi93EqfmCGVoDfIcPGZwi+lMHRZ/Ch1AZrM0NR3mKI?=
 =?us-ascii?Q?KW0NvlXSt8LxhNVuvjkgN1fQXeiOJFxneDFiUS/Z7Ks/prZKClOeXHnqa4EN?=
 =?us-ascii?Q?zoOwp8UwC66TZj9WA7J4ymrEszxvxuIRkVeoJVW6pd/e1Id6A3W01KhOzF4X?=
 =?us-ascii?Q?vGiMPagI0OtU30+wZhK1IrJJ/32WunJrzyr1HgGTcQ7Cq9yz5zor+xmO+LnY?=
 =?us-ascii?Q?vzjDL+1AfR3oEpygJYZjUeRCrWuKezfkm2lesuswe0SfP3K90rArC38tTF1V?=
 =?us-ascii?Q?KI78xboNKsh3wAVDUr8XO+O5KROtuIXE9TAP7e3J2Y06dTGLnLEd3FY8nRBO?=
 =?us-ascii?Q?aGFimlhZzmtmKXeQn9b1Wy8eDaz35RnT/aWqn3iyL5CbvAixrpA7J/eKrhph?=
 =?us-ascii?Q?KOHPfBYteAi1NhFz1HJSifbg20Ah2aSJCt/6Bcb/42b4RLrtPlXs3uGKECk6?=
 =?us-ascii?Q?K2dtSCmJtCVxEM8phnzMVqGWt/BtyUAPw+eQz5xIOCnffkWDlr0hNqDBI5dF?=
 =?us-ascii?Q?yCLeKYOBR5lsQKzpyEgJ0ogVj/yd4zOgvJ1yijBwQe8Vy/zTykXfEO4gsn9Z?=
 =?us-ascii?Q?bNsP2Ht2rV/+ygkSMQTEPTAiVyxtMerip24Hn8Xbr27M7EL44VGypyyEj38a?=
 =?us-ascii?Q?8OzqHTq65PFKboklHnag5wO7pMz5k6tzn7BR0nXNdAFhVQk6zW5W0olMJ2DC?=
 =?us-ascii?Q?Lipml7VIlbGh9IhgiATUa4/tBwvnW2lbnSdFSYUpONC5KEzVLKBGbZXXeM8Y?=
 =?us-ascii?Q?hd7DEc1k0DLIkYizSkQNBPEu/6Of8fSpmq25twq9A7pzRZXqQz5t/K3uTEkt?=
 =?us-ascii?Q?LLLN5vkPeUiP6BlIG1xzMKf73tpcfbZHJMdmdK4kkL+Zxux9c2ssZzYjckCj?=
 =?us-ascii?Q?koQPE3vLcRjiyT8zfiKk5TeQEGcKTTGP8oLdBD/wAVvwgk6QSWpJgdfexCoW?=
 =?us-ascii?Q?9QxQ8shetPs+vFSNUEWAWFQKHPD49n9mc1OlmF7eUIdC0QwuInkAkfo58CGM?=
 =?us-ascii?Q?n5M09js=3D?=
MIME-Version: 1.0
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 7 May 2020, Arnd Bergmann wrote:

> > The patch 92d7223a74235054f2aa7227d207d9c57f84dca0 ("alpha: io: reorder
> > barriers to guarantee writeX() and iowriteX() ordering #2") broke boot on
> > the Alpha Avanti platform.
> >
> > The patch changes timing between accesses to the ISA bus, in particular,
> > it reduces the time between "write" access and a subsequent "read" access.
> >
> > This causes lock-up when accessing the real time clock and serial ports.
> >
> > This patch fixes the bug by adding a memory barrier after the functions
> > that access the ISA ports - outb, outw, outl. The barrier causes that
> > there is some delay between the write to an IO port and a subsequent read.

 There is no delay guarantee, just an in-order completion guarantee:

#define mb()	__asm__ __volatile__("mb": : :"memory")

MB is a hardware memory barrier instruction.

> Based on your earlier explanations, I would mention here that the barrier
> avoids the back-to-back I/O instructions on the bus that seem to be causing
> the problem. As I understand it (having very little alpha specific knowledge),
> they should prevent them by design. However if you are sure it's just the
> added delay rather than any actual barrier effect, that would also be worth
> pointing out.

 Alpha is weakly ordered, also WRT MMIO.  Writing a simple test program to 
poke directly (e.g. using `ioremap' and then inline asm on the location 
obtained) at RTC and UART registers would be a good way to determine what 
is really going on here.

  Maciej


