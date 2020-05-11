Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FAE81D224F
	for <lists+linux-rtc@lfdr.de>; Thu, 14 May 2020 00:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731484AbgEMWrk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 13 May 2020 18:47:40 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:27751 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbgEMWrj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 13 May 2020 18:47:39 -0400
IronPort-SDR: pBxB5QgUKyIGt1FMAYgYxIytp5jhmHmUHOvixm1z7sZn9lBguvN2LA6UUFkmw92UAFQubUqrOB
 IC6um+uZK7cwUIINxmbq3lqk9KAs0pAVefbBZrZD65W+UuFRweiMpL9kgWmEpzN0XhZyZaYAzL
 lceGdzNsxzvr/SpzSHuJKm+LoMQBHXdErF05ujTfY/vJ5XVx82HfbTW1Ele7IZlCtsV9NzRpY2
 5iMrPIxyM+X6I1P+v7LFIcr3dXHneQyrwauzicVNU7B2PouOUphwnu8gTHKAtMaIhL9I8NsCL2
 ZpA=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; 
   d="scan'208";a="137958329"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 14 May 2020 06:47:35 +0800
IronPort-SDR: bZmDWVM3MQkpeg485VE5S5dRwyZgdpWY8aDW36iyesE6Q512JtR32eHk49TWmSs7z67a5FQkk5
 UEvCzAodXf0n+YtakYKmrc8k3xXBgmFl4=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 15:37:16 -0700
IronPort-SDR: 2EySntN24zxi0edUzpgZhV+CpTP0Z3zImfdH57LckXl1Ua9E2Ptxzweq/LDVPFX2H3aQJp5EIM
 dlSmuNPUu7dQ==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 15:47:34 -0700
X-Received: from SN6PR04MB3824.namprd04.prod.outlook.com (2603:10b6:a03:255::8)
 by BYAPR04MB5176.namprd04.prod.outlook.com with HTTPS via
 BY3PR10CA0003.NAMPRD10.PROD.OUTLOOK.COM; Wed, 13 May 2020 22:35:15 +0000
X-Received: from BN3PR05CA0003.namprd05.prod.outlook.com (2603:10b6:400::13) by
 SN6PR04MB3824.namprd04.prod.outlook.com (2603:10b6:805:4f::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.33; Wed, 13 May 2020 22:35:13 +0000
X-Received: from BN3NAM04FT044.eop-NAM04.prod.protection.outlook.com
 (2603:10b6:400:0:cafe::b2) by BN3PR05CA0003.outlook.office365.com
 (2603:10b6:400::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.12 via Frontend
 Transport; Wed, 13 May 2020 22:35:13 +0000
Authentication-Results: spf=none (sender IP is 216.71.154.42)
 smtp.mailfrom=linux-mips.org; wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=none action=none header.from=linux-mips.org;
X-Received: from esa4.hgst.iphmx.com (216.71.154.42) by
 BN3NAM04FT044.mail.protection.outlook.com (10.152.93.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Wed, 13 May 2020 22:35:12 +0000
Authentication-Results-Original: esa4.hgst.iphmx.com; dkim=none (message not
 signed) header.i=none; spf=None smtp.mailfrom=macro@linux-mips.org; spf=None
 smtp.helo=postmaster@cvs.linux-mips.org
X-Ironport-Dmarc-Check-Result: validskip
IronPort-SDR: 6ITrYayVJ17T5nzs64uONfWC8P6FWqxy4BUmjDsoNXwRfLas9emPEydOW8aPjY1dEbx9+vCZIL
 uZLsQNqlfPwt+LS2UhTSGx0wWVNhAFbGv9RDckSUi41kCg+vnv4TIUI+7fmf81+ggvLWKxxui1
 tuWaZmu6soXjicD/nWzMEeKonuXlCfx7OAMq3s3ZsA6RM/nc64l8GUaQRS4hxnYCSPhQOAOIRI
 JYlFGdml10lEbWqV+X7U22aFdUweC4nm96frDaaCWgy6MnEYQfr61wRfOTUBtGuXfIDMWGBnNI
 zbvrYUF6/Hf/HeagLHCaNwOu
IronPort-PHdr: =?us-ascii?q?9a23=3Axuei2hAX2/Ao/GJLPNa3UyQJP3N1i/DPJgcQr6?=
 =?us-ascii?q?AfoPdwSPT/ocbcNUDSrc9gkEXOFd2Cra4d1qyH7uu4CCQp2tWoiDg6aptCVh?=
 =?us-ascii?q?sI2409vjcLJ4q7M3D9N+PgdCcgHc5PBxdP9nC/NlVJSo6lPwWB6nK94iQPFR?=
 =?us-ascii?q?rhKAF7Ovr6GpLIj8Swyuu+54Dfbx9HiTagYb5+NhG7oAXeusUKhYZpN7o8xA?=
 =?us-ascii?q?bOrnZUYepd2HlmJUiUnxby58ew+IBs/iFNsP8/9MBOTLv3cb0gQbNXEDopPW?=
 =?us-ascii?q?Y15Nb2tRbYVguA+mEcUmQNnRVWBQXO8Qz3UY3wsiv+sep9xTWaMMjrRr06RT?=
 =?us-ascii?q?iu86FmQwLzhSwZKzA27n3Yis1ojKJavh2hoQB/w5XJa42RLfZyY7/Rcc8fSW?=
 =?us-ascii?q?dHQ81fVTFOApmkYoUBD+QPI/tWoIv+qVsAohSxGRKhBP/zxjNUmnP6wbE23/?=
 =?us-ascii?q?onHArb3AIgBdUOsHHModn7M6kdS/y6zKjWwjXBcvhZ2S3x45XUfBAmoPCNXa?=
 =?us-ascii?q?5/ccnQyUUhCgjIiVCQppb5MDOP0eQAqGyb7+tmVeKyhG8rsgRxojm3xsc3kI?=
 =?us-ascii?q?XJgZgVyl/d+Ch/3Y06KsG2RlRhbt64DJtfqTuaN41uT84iQGxluyU3xLIHtJ?=
 =?us-ascii?q?O/YiUH1YkrygDcZvKHbYWF4g7uWfqPLTtlmX5odq6yiwiv/EauxeDxV8e53E?=
 =?us-ascii?q?tKoCdGj9XBsG0G2R/L6sWfV/dw8USs1SyR2w3T9+1IO0Q5mKrBJ5I8zLM9lZ?=
 =?us-ascii?q?weulnZECDsgkX5lqqWe10k+ue27+TnZa3rqYOCN49vkA3+NqUumsqiAeU3Kw?=
 =?us-ascii?q?QOWmmb+fyn1LH5+k35WrpKguU3kqnfrp/aOdwWqrO2DgJWyIov9RayAyq83N?=
 =?us-ascii?q?kcnXQLNk9JdRyEgoTxPlHBOvH4DfOxg1S2lzdrwujLPrj7DZrRNHjDl6zsfb?=
 =?us-ascii?q?J8605a1QoywslT55dVCrEZO/L/QEjxtMbXDhMhKQy73/7nCMlh1oMZQW+PB7?=
 =?us-ascii?q?WWP7/IsV+P/e8uLfSDa5MPtDnhLPgl4q2msXhsvF4eYK2gxtMvYWy/Ffdvax?=
 =?us-ascii?q?GceXPwhdwCGE8QswY+RfCsg1qHB219fXG3CugZ7zo6BYDuMsGLfIe/kbeC3W?=
 =?us-ascii?q?3zSphfbXpBIlSNF2r4MoCFQ+xKbziddJwy2gcYXKSsHtdynSqlsxX3nv8+dr?=
 =?us-ascii?q?KOoH8xqI7j2d5p5ubaiRA183lOAt+A132WFj8szG4TTmNw3K9kvQp80leGwe?=
 =?us-ascii?q?5zhPkLXdBQ5vYcVAA8ONacyuFhENn9V0rHecvBU1epRNiqQHkxQ9s9zsVIYh?=
 =?us-ascii?q?N7HNOv3VjYxyT/JbgTmvSQAYAstKfV3nz/PcF4nnPP37Mmp10nRNZfcGinnr?=
 =?us-ascii?q?U58BLcVMbSi0vMsaGseOwH2TLVsmeOyW3bpEZDTAt5SrnIR1gUeFCQqdX/+1?=
 =?us-ascii?q?OHSr62EvIgKAQYk5y4J6BHa8PkgRB9fNm5aY6MRWW3li/wCA2BmvWMY5H2PW?=
 =?us-ascii?q?QF3CDNTkMDllJb+3HOLgU4Ciq762vDEDxjE07uaELw4Iwc4Du6SEEz1QSDc0?=
 =?us-ascii?q?xm0fK85BcUgfWWT/5b0KgDvW8trDB9HVD12NyeDtOLvQ1JeKRafMN45VZfzi?=
 =?us-ascii?q?TerQM8W/7oZ6Fui1gCchhm6kbn1hF5EIJFwoAhqHInyhY3KLrNiQ8RMWnFhN?=
 =?us-ascii?q?ahZ/uOcTmhmXLnI7Tb0VzfztuMr6oU4ah+q1r4oEeoDkon4zNs1NwGthnUrp?=
 =?us-ascii?q?jMEgcWVor8F0gt8B0v7bTTaTM6z4fV02B8dKy1qiSE3MgmTrhAqF7ob5JEPa?=
 =?us-ascii?q?WIGRWnWcgTDNKpAOgrnUW5KxcFJPsU87Q7dZDuZ76N36ilO/xllTStgDFc+I?=
 =?us-ascii?q?5K1USI5nMmGNTF1JsE3fyUmzC/eWyk3QWHtcb60cBJfjhOWGqw0jSiBZZRY7?=
 =?us-ascii?q?00doEOWy+oJIWsy9NyioSlUmNE9FOlG1IN2dO4HHjaJ1370wpK0E0LoHuh0S?=
 =?us-ascii?q?Kmxj1wmjsto+KRxivLi+jlcRMGPCZMSgwAxR/0JpOoitkBQEWyRwM3j12h5E?=
 =?us-ascii?q?Dn1+1epbxkaW7JTgYAfiT7KX1jTrrltreGZJ0qittguiFWXeKgJFGCH+eh81?=
 =?us-ascii?q?1AjnqlTjYYnWtrJHmwt570ngJ3kjeQN38v6nrWYt02xA/f4cyaTvlUjV9kDG?=
 =?us-ascii?q?F1jyfaAl+kMpyn59KRwt3Gu+ukUEqlV5tOYWzuzJub8iyh6ic5ZH/31+D2gd?=
 =?us-ascii?q?DhHQUghGXj0MJ2UCzTsBvmSoL1zOK+MOR6bgxtBUfnrc1gFcst9+l4zIFV0n?=
 =?us-ascii?q?8ciJKP+HMBmmqmKs1V7qX4aGtUFGw7huXN6Q2g43VNa3eAxob3THKYm5UzY9?=
 =?us-ascii?q?i8f3NT3yMl9IZNEqjGtOUZzxswmUKxqEfqWdY4njoZzqF2unUEmKcNuQww3m?=
 =?us-ascii?q?CYA6gJW05CMn60mg=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0FgAwC0dbxefYpf+5RmHQEBAQEJARI?=
 =?us-ascii?q?BBQUBQIFHgiWBawMEC41Sh2Alm2APATsEAQGERAKCKwY6EwIDAQEBAwIFAQE?=
 =?us-ascii?q?BBAEBAQIBAQEDAgEBAQECEAEBFjo0YFOBR4FBLAkGAwE7gjspAYNiAQEBAgE?=
 =?us-ascii?q?SKD8FCwsOOFcGNYVcBSCkJgGBKD4CIwE/AQyBBYl+gTSKcoE4jFYGgUE/gRE?=
 =?us-ascii?q?zA4Fcfj6KQgSOOoJfAYcomjwHA4JNjiCKFB2dSS2vSCGBWH0IgyVMAQIBAgE?=
 =?us-ascii?q?MAQICAQEBAgEBCAEBAQGfBkNnAgYIAQEDCY9EAQE?=
X-IPAS-Result: =?us-ascii?q?A0FgAwC0dbxefYpf+5RmHQEBAQEJARIBBQUBQIFHgiWBa?=
 =?us-ascii?q?wMEC41Sh2Alm2APATsEAQGERAKCKwY6EwIDAQEBAwIFAQEBBAEBAQIBAQEDA?=
 =?us-ascii?q?gEBAQECEAEBFjo0YFOBR4FBLAkGAwE7gjspAYNiAQEBAgESKD8FCwsOOFcGN?=
 =?us-ascii?q?YVcBSCkJgGBKD4CIwE/AQyBBYl+gTSKcoE4jFYGgUE/gREzA4Fcfj6KQgSOO?=
 =?us-ascii?q?oJfAYcomjwHA4JNjiCKFB2dSS2vSCGBWH0IgyVMAQIBAgEMAQICAQEBAgEBC?=
 =?us-ascii?q?AEBAQGfBkNnAgYIAQEDCY9EAQE?=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; 
   d="scan'208";a="137621459"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-Received: from eddie.linux-mips.org (HELO cvs.linux-mips.org) ([148.251.95.138])
  by esa4.hgst.iphmx.com with ESMTP; 14 May 2020 06:35:02 +0800
X-Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23994956AbgEMWezdCe7c (ORCPT <rfc822;macro@wdc.com>);
        Thu, 14 May 2020 00:34:55 +0200
Date:   Mon, 11 May 2020 15:58:24 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Mikulas Patocka <mpatocka@redhat.com>
cc:     Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/2 v3] alpha: add a delay to inb_p, inb_w and inb_l
In-Reply-To: <alpine.LRH.2.02.2005101443290.15420@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org>
References: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com> <alpine.LRH.2.02.2005061308220.18599@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005070404420.5006@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com>
 <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com> <alpine.LFD.2.21.2005100209340.487915@eddie.linux-mips.org> <alpine.LRH.2.02.2005101443290.15420@file01.intranet.prod.int.rdu2.redhat.com>
Content-Type: text/plain; charset=US-ASCII
X-ReSent-Date: Wed, 13 May 2020 23:34:55 +0100 (BST)
X-Resent-Sender: "Maciej W. Rozycki" <macro@linux-mips.org>
X-ReSent-From: "Maciej W. Rozycki" <macro@linux-mips.org>
X-ReSent-To: "Maciej W. Rozycki" <macro@wdc.com>
X-ReSent-Subject: Re: [PATCH 1/2 v3] alpha: add a delay to inb_p, inb_w and
 inb_l
X-ReSent-Message-ID: <alpine.LFD.2.21.2005132334553.1120869@eddie.linux-mips.org>
X-Return-Path: macro@linux-mips.org
X-MS-Exchange-Organization-ExpirationStartTime: 13 May 2020 22:35:12.6544
 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: 92a7625c-0900-49a9-2bf7-08d7f78de68b
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:216.71.154.42;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:esa4.hgst.iphmx.com;PTR:esa4.hgst.iphmx.com;CAT:NONE;SFTY:;SFS:(4636009)(33430700002)(86362001)(82310400002)(7636003)(33440700001)(6666004)(7596003)(6862004)(107886003)(4326008)(5660300002)(8676002)(356005)(34756004)(1096003)(26005)(8936002)(54906003)(42186006)(336012)(1736002);DIR:INB;SFP:;
X-MS-PublicTrafficType: Email
X-MS-Exchange-Organization-AuthSource: BN3NAM04FT044.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-OriginatorOrg: sharedspace.onmicrosoft.com
X-MS-Office365-Filtering-Correlation-Id: 92a7625c-0900-49a9-2bf7-08d7f78de68b
X-MS-TrafficTypeDiagnostic: SN6PR04MB3824:
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-Organization-SCL: 1
X-Microsoft-Antispam: BCL:0;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2020 22:35:12.4095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a7625c-0900-49a9-2bf7-08d7f78de68b
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=b61c8803-16f3-4c35-9b17-6f65f441df86;Ip=[216.71.154.42];Helo=[esa4.hgst.iphmx.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB3824
X-MS-Exchange-Transport-EndToEndLatency: 00:00:02.7540472
X-MS-Exchange-Processed-By-BccFoldering: 15.20.2979.027
X-Microsoft-Antispam-Mailbox-Delivery: ucf:1;jmr:0;auth:0;dest:C;OFR:CustomRules;ENG:(20160514016)(750127)(520002050)(944506383)(944626516);
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tS5cGOkS7BKblWxrMJDESsfhRaK/n+NgCOGz84uy0anebKmprI4/bTbGYEO+?=
 =?us-ascii?Q?yethRZAWbWDD6mD303DiWnk1Gv2UUB6Z8VAW+VXS+DJwXac6TxJ/f3dDZuzP?=
 =?us-ascii?Q?yzqVmfgEJPUT5uxYlTWqpgVj+Rrt070k47EB4Ak+jst5F6QxLTwrTNvHhY+h?=
 =?us-ascii?Q?CTLfURpD6M6p+2msdce1ZX5SgfmKSEAPff18CPdns1SJ8wTnptw6tP/MENhC?=
 =?us-ascii?Q?leynS+8jQk3QnmWvdZE3JolVfJnX46EnI5MaRjZRdPRqPN68TfVl7TAc9kTZ?=
 =?us-ascii?Q?xiyvhl6RwefMYJOb33JXBxJnMRDI7jzesBHbAOLCACINJICrO/CMJ/qRAEX7?=
 =?us-ascii?Q?XMYl/7kzZikbwG6SEfUb36wDWJ92dCgac34RvcI+3HDllQY8zv3Qi92OWYb2?=
 =?us-ascii?Q?P82e1RPOBXlToyJaDTRnceOsaoPI6VPpAYzRFESqaTVCoKZuSJWx7YXzqA4Y?=
 =?us-ascii?Q?R54RFlQ4nGs/lnJsowEqvTvO0sD3XG4WCspGCQgVWmhtXfnS5zluChKZejsN?=
 =?us-ascii?Q?n8alsyQ515PyW2qk5gfizCnwXKDVWkcMAi/DQJn7ztW43gQeqQ1meVqQAU5+?=
 =?us-ascii?Q?CE3f9vvH7keg7mzW2aSzHZFzmqX57KBkcGk4pYN8GtOd1FISXBOYAIavaiGt?=
 =?us-ascii?Q?Q/CJwtYYUCGD2wqiPrT8LdnaPy5PrGe6KnP7UYpE2G9hWhxeLRg3mgYSXogf?=
 =?us-ascii?Q?avsovxhOmguSus40V08gDkjlVxfwvJx9seCGPLO+LdpYvf3pHgQWt700q61B?=
 =?us-ascii?Q?Ug9yDcU6J3xcg5BLmSQtdJyrYScrNlp/tNiSfyVlo/a6NS+H5JJYU8V6iGSV?=
 =?us-ascii?Q?Jr225pIiQuP47uGJKkBkg7KmXBKdVeOaE99zZJ2/oBjliqs5IpaaePkR1HtF?=
 =?us-ascii?Q?QIiVdBPBTiJE8ubwo9UZo4p/TDO156MaM7w4wxWZa1icAn2Ti6e/BKbf7ln0?=
 =?us-ascii?Q?6qkaf/N3KKpVPOh/Gbf1cN/kR4Rvy8j37wCIyBZXQdnuShuBDgXDBBWVBp33?=
 =?us-ascii?Q?CZk4i5UKpCZh/9zr+N7rIjxMo4RMqz/rujXyuE8FtSQGW0Zue/lBDoCGaEtV?=
 =?us-ascii?Q?15FY4F22v5AzZHSavUzbXZHPEbUl3ReWTZ5prfqsZwwmvwjITp9xS++KPRaN?=
 =?us-ascii?Q?pn07KzfxzrIA4Vwh4bn7dwnH5S3dmqL5J/hHakUXu84WD1ialoXZieepnVDR?=
 =?us-ascii?Q?7IznM1HINHygJnpcMKnhqEJbF2V3Gl4yz2iW7IrFm3O0gX6eEF5zwa5n9niv?=
 =?us-ascii?Q?qFmBPBUInZ2Ua3vd9MppfX28OzFR0k5q3T7egrl7DqQ212NSb5vwhBOCYCEA?=
 =?us-ascii?Q?oDFvVekcGK0pJtDIkGdNSn6iWz3qY+j3R4889JtSKeSndjv46nbVo97HjQsY?=
 =?us-ascii?Q?UqUXjZxirAWbrQStzfGBe9Kuv7m0?=
MIME-Version: 1.0
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, 10 May 2020, Mikulas Patocka wrote:

> > > That's what we do on some other architectures to emulate the non-posted
> > > behavior of out[bwl], as required by PCI. I can't think of any reasons to
> > > have a barrier before in[bwl], or after write[bwl], but we generally want
> > > one after out[bwl]
> > 
> >  Alpha is weakly ordered, also WRT MMIO.  The details are a bit obscure 
> > (and were discussed before in a previous iteration of these patches), but 
> > my understanding is multiple writes can be merged and writes can be 
> > reordered WRT reads, even on UP.  It's generally better for performance to 
> 
> We discussed it some times ago, and the conclusion was that reads and 
> writes to the same device are not reordered on Alpha. Reads and writes to 
> different devices or to memory may be reordered.

 Except that "device" in this context is a particular MMIO location; most 
peripherals span multiple locations, including the RTC and the UART in the 
Avanti line in particular.

> In these problematic cases, we only access serial port or real time clock 
> using a few ports (and these devices don't have DMA, so there's not any 
> interaction with memory) - so I conclude that it is timing problem and not 
> I/O reordering problem.

 Individual PCI port locations correspond to different MMIO locations, so 
yes, accesses to these can be reordered (merging won't happen due to the 
use of the sparse address space).

 As I noted using a small program to verify actual behaviour ought to 
reveal what the problem really is.  And /dev/mem can be mmapped for PCI 
port I/O access on Alpha (some X-servers do this), so it can be done even 
in the userland with a running system.

 And if timing is indeed the culprit, then I think it will be best fixed 
in the 82378IB southbridge, i.e.[1]:

"The I/O recovery mechanism in the SIO is used to add additional recovery 
delay between PCI originated 8-bit and 16-bit I/O cycles to the ISA Bus.  
The SIO automatically forces a minimum delay of four SYSCLKs between 
back-to-back 8 and 16 bit I/O cycles to the ISA Bus.  The delay is 
measured from the rising edge of the I/O command (IOR# or IOW#) to the 
falling edge of the next BALE.  If a delay of greater than four SYSCLKs is 
required, the ISA I/O Recovery Time Register can be programmed to increase 
the delay in increments of SYSCLKs.  Note that no additional delay is 
inserted for back-to-back I/O "sub cycles" generated as a result of byte 
assembly or disassembly.  This register defaults to 8 and 16-bit recovery 
enabled with two clocks added to the standard I/O recovery."

where it won't be causing unnecessary overhead for native PCI devices or 
indeed excessive one for ISA devices.  It might be interesting to note 
that later SIO versions like the 82378ZB increased the minimum to five 
SYSCLKs, so maybe a missing SYSCLK (that can still be inserted by suitably
programming the ICRT) is the source of the problem?

References:

[1] "82378IB System I/O (SIO)", April 1993, Intel Corporation, Order 
    Number: 290473-002, Section 4.1.17 "ICRT -- ISA Controller Recovery 
    Timer Register"

  Maciej


