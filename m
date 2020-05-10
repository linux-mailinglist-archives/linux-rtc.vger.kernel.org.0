Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06AE91D223B
	for <lists+linux-rtc@lfdr.de>; Thu, 14 May 2020 00:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730864AbgEMWnL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 13 May 2020 18:43:11 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:21377 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbgEMWnJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 13 May 2020 18:43:09 -0400
IronPort-SDR: kvtwpwOadzfbx5chN2/5lCdRr0n5RDgK05t+8DtmejKT2kyl0E/yQ32blLH8sVYHqt5VKTNylD
 Yd3abav740lwa7NbF9vexP65RT6WywjUBsYvri1VA69cVkqPEyRZnd7Tt7sNnsNnIyudAPqVav
 4jimX6HsPmJ7HZMyeWLO+tYA7I3WVez3y7WDMBYPGrY5gdkl+uL6D7cHLrCSEAODS/lOycKPcy
 SbhuwGklw7/J7rMSWI8yIf4QGsSx1aIXR9bYfh1GzNbnCA+HWHn7MPg4VzWZxcTzZGUcsAbx6X
 Rjg=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; 
   d="scan'208";a="141968800"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 14 May 2020 06:43:09 +0800
IronPort-SDR: LYQ4YihZp1Kv5QohRrTdro/IyqPTAjApSMjD5IpZcf9wj7amzA1j4VQ7QbYmycXhr8n400ww6i
 MPr4www8UAFKRTmlBmRoJGB/ODhMoYZEA=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 15:33:22 -0700
IronPort-SDR: KRHikuq4/SeiV7GDDQW5tiQUEA+TYdBqrBvafNDdQ07BYujS4iJjeA5dZdO8wods+E77ORLS01
 Fy0BqZvAH7Cg==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 15:43:08 -0700
X-Received: from MWHPR04MB0800.namprd04.prod.outlook.com (2603:10b6:a03:217::25)
 by BYAPR04MB5176.namprd04.prod.outlook.com with HTTPS via
 BY3PR04CA0020.NAMPRD04.PROD.OUTLOOK.COM; Wed, 13 May 2020 22:35:12 +0000
X-Received: from CO2PR04CA0150.namprd04.prod.outlook.com (2603:10b6:104::28) by
 MWHPR04MB0800.namprd04.prod.outlook.com (2603:10b6:300:f8::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.20; Wed, 13 May 2020 22:35:11 +0000
X-Received: from CO1NAM04FT036.eop-NAM04.prod.protection.outlook.com
 (2603:10b6:104:0:cafe::b7) by CO2PR04CA0150.outlook.office365.com
 (2603:10b6:104::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Wed, 13 May 2020 22:35:11 +0000
Authentication-Results: spf=none (sender IP is 216.71.154.42)
 smtp.mailfrom=linux-mips.org; wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=none action=none header.from=linux-mips.org;
X-Received: from esa4.hgst.iphmx.com (216.71.154.42) by
 CO1NAM04FT036.mail.protection.outlook.com (10.152.91.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Wed, 13 May 2020 22:35:10 +0000
Authentication-Results-Original: esa4.hgst.iphmx.com; dkim=none (message not
 signed) header.i=none; spf=None smtp.mailfrom=macro@linux-mips.org; spf=None
 smtp.helo=postmaster@cvs.linux-mips.org
X-Ironport-Dmarc-Check-Result: validskip
IronPort-SDR: 0ZeM6kPubIy9APManEER78MHt7oZeyughPoWkSfCbHypaJ1yeFUM2nSphUj0t72sCB2SfiSEvc
 0JWpXfLtzFmthN+gyy4q+39cPiZFc5b8BdqUYK0AJyy6m0Zi8+BCZ7BN+gQ754fgEB5yloSdm5
 axDrY/Je0VXPFu750g9dx/SxL6DI6joUw30TjJAMSO3NJkxgsRuk7SHvZhF+nrwpTnAtiomMjw
 pvO1obPlNEJoXx9H2hsKCGLxTpXniqKj/YOyLQd/nm5Od9nPcrhIcbpkzwg6J8+Sk7TD1qUFHh
 voWHhHTD6yIrwsw24Zv/v1BF
IronPort-PHdr: =?us-ascii?q?9a23=3AvlLuLx0KcqEvsQ2hsmDT+DRfVm0co7zxezQtwd?=
 =?us-ascii?q?8ZseIVIvad9pjvdHbS+e9qxAeQG9mCtrQV1qGO4ujJYi8p2d65qncMcZhBBV?=
 =?us-ascii?q?cuqP49uEgeOvODElDxN/XwbiY3T4xoXV5h+GynYwAOQJ6tL1LdrWev4jEMBx?=
 =?us-ascii?q?7xKRR6JvjvGo7Vks+7y/2+94fcbglVhDexe7d/IRW5oQnNssQdnJdvJLs2xh?=
 =?us-ascii?q?bVuHVDZv5YxXlvJVKdnhb84tm/8Zt++ClOuPwv6tBNX7zic6s3UbJXAjImM3?=
 =?us-ascii?q?so5MLwrhnMURGP5noHXWoIlBdDHhXI4wv7Xpf1tSv6q/Z91SyHNsD4Ubw4RT?=
 =?us-ascii?q?Kv5LpwRRT2lCkIKSI28GDPisxxkq1bpg6hpwdiyILQeY2ZKeZycr/Ycd4cWG?=
 =?us-ascii?q?FPXNteVzZZD42yb4UBEfcPMuRboYnzqFQBsQCzBRWwCO/z1jNEmmP60bM83u?=
 =?us-ascii?q?88EQ/GxgsgH9cWvXjaq9v6LrsdUeGrw6nK0D7Mb+la0irh5ojPcxEgoe2DXb?=
 =?us-ascii?q?Fxccbf1EIiEAbFgU+Mpoz/ODOYzeANs2md7+p9WuOjkmsnqwBpoji03MssjZ?=
 =?us-ascii?q?PJho0Mx13C6C52z5o7K8eiR05nfd6rDoFQtyeCOoZ2Qc4vQGJltik7x7ACp5?=
 =?us-ascii?q?O2YTUGxYokyhDfdfGKc5SF7w79WOqMPDt1im5odKyiihi8/kWty+PxWtS03l?=
 =?us-ascii?q?tJsyZIlMTHuHMV1xHL98SKRfhw8l2/1TuPygzf8OVJLEAumabGJZMswbg9nY?=
 =?us-ascii?q?cJv0vZBC/5gkD2gbeWdko6/uio7Pzqban4pp+HLYN0jgD+MqIzms2wGOg4Nw?=
 =?us-ascii?q?kOX3CA+eim073j50L5TK1Ljv0wjKbZrIjXKdkUq6O6GQNZzIYu5wulAzqi0N?=
 =?us-ascii?q?kUh2QLIVxGdR6fiojmIVDOIPT2DfelhFSslS9mx/XcMbL9GJXNKWPOkLPgfb?=
 =?us-ascii?q?Z79k5dxxM/zdVe55JMEbENOvXzWlX+tNDAFB82LxS0w/r7CNV6zo4eXHiADb?=
 =?us-ascii?q?ODMKPVqlKJ6P8gLPWWaIAJvzb9Lqtt2/m7pGU/lRc3cLOm2JIRbjjsF+5gL2?=
 =?us-ascii?q?2Qe3zgiJENHDFZkBA5SbmgrVSJUDNRL0n0F5g79CAwC4PsRdPGT4u3h5SF3S?=
 =?us-ascii?q?GmDthTZ3hdTFeWHiG7JM2/R/4QZXfKcYdamTseWO3kEtd5j0v8nRLmy7dhMu?=
 =?us-ascii?q?vf8zEZspSm7tVu+unPjkhsrW55FM3BlWGCVH0yn3sIQi9w16d68gRxyVaGhK?=
 =?us-ascii?q?5/hfEQVdle/OhAXQpyM5nAh/d7BNb/VkOJftqARFu8BNTzBzY3Q4F52McANm?=
 =?us-ascii?q?B6HdjqlRXfx2yvCr4RmaaMAckx+6nG2FD1JsBg2zPD1bE6yV48TZgHLnWo04?=
 =?us-ascii?q?h48QWbHIvViwOZmqKtILwbxzLI/XyfwHCmt19DFgpxV7jVGHUeflCQqs72vx?=
 =?us-ascii?q?mQdbKlBLU5PwcE8vascPoQOPvui1gOBPr4MYiYY22qhyGxHRaN1vWHa4+4M2?=
 =?us-ascii?q?MalD7QDkQJiUga4GqGOA4iByygv3O7bnQmFFThZFnp+PV/r3XzR1E9zgWDZU?=
 =?us-ascii?q?lsn7Sv/RtdifuZQvIVlrUK8CIooC9zNFK82c/GTt+BvxEne79TILZfqB9G2W?=
 =?us-ascii?q?/fqw1hL8mlJqFmiEQZdlc/tEfv2hNrT4RYxJF2/DVwkVM0eP/eiQgRJFb6ld?=
 =?us-ascii?q?jqN7baK3f/5kWicKeKnFHRy8rQ+78P7eR+oFLm72TLXgIv9Wtq195N3j6S/J?=
 =?us-ascii?q?LPWUAXWJnrVW4z9h5nt/TfYzEmoYTO2jc/VMv8+i+HwN8vCOY/n1yldtxFN4?=
 =?us-ascii?q?uAFQnvA4gfBtC1buswlBL6JgJBN+dU+qkuOsqgfPbTw7alC+FmmCP/1zZ97Y?=
 =?us-ascii?q?tw01yB+29HcsCTh8dX5fae00PHWiz10BGhvdvr34FcZTQCWGG4zHqsAokZfa?=
 =?us-ascii?q?B0cYsRQW6zP826wMl/jJ/xShs6vBaiAV0BwsqgZRuVaRT0wwRR0U0dpXHvlz?=
 =?us-ascii?q?G/ynR4lDQgr6zX2yKroayqbB0cJmtCX3Vvl3/nP5Pyi9EcQVjtagkxj12i/0?=
 =?us-ascii?q?m7j6lXqaJjLnXCFEdFey+lSgMqGqC0t7eEf4tO8MZx7XURCrnlJwHHDOem80?=
 =?us-ascii?q?hSyS7oEmpAySpueiqj5tP5kAdmzmOFLHNj6nHefJIVp1+X6drCSPpWxjdDSj?=
 =?us-ascii?q?N/jGydA1G3Jd6B+dSSioeGt+GmTCSmTJIZIkyJhcuQ8TC242FnG0j1h/eoht?=
 =?us-ascii?q?juChQ3ywfwycIsUSTOsQa5Z4jzzOK9K+0tLSwKTBfsrsF9HI95iI45gpodjG?=
 =?us-ascii?q?MCiKKS+34WyDahAZBgwav7KUE1a3sOyt/R7hLi3RQ9fHaIwZ/pE3Cc2tAnYM?=
 =?us-ascii?q?O1MDtPh3ANqvtSAaLR14Rq2Ct4pl3i9VDaf+M7mjYb1Otr7X8CmKcOogV/li?=
 =?us-ascii?q?g=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0FfAwC0dbxefYpf+5RmHQEBAQEJARI?=
 =?us-ascii?q?BBQUBQIFHgiWBawMEC41Sh2Alm2APATsEAQGERAKCKwY6EwIDAQEBAwIFAQE?=
 =?us-ascii?q?BBAEBAQIBAQEDAgEBAQECEAEBFjo0YFOBR4FBLAkGAwE7gjspAYNiAQEBAgE?=
 =?us-ascii?q?SKD8QC0ZXBjWFXAUgpCYBgSg+AiMBPwEMgQWJfoE0inKBOIxWBoFBP4ERMwO?=
 =?us-ascii?q?CWj6KQgSOOoJfAaFkBwOCTZg0HZ1JLa9IIYFYfQiDJUwBAgECAQwBAgIBAQE?=
 =?us-ascii?q?CAQEIAQEBAZ8GQ2cCBggBAQMJj0QBAQ?=
X-IPAS-Result: =?us-ascii?q?A0FfAwC0dbxefYpf+5RmHQEBAQEJARIBBQUBQIFHgiWBa?=
 =?us-ascii?q?wMEC41Sh2Alm2APATsEAQGERAKCKwY6EwIDAQEBAwIFAQEBBAEBAQIBAQEDA?=
 =?us-ascii?q?gEBAQECEAEBFjo0YFOBR4FBLAkGAwE7gjspAYNiAQEBAgESKD8QC0ZXBjWFX?=
 =?us-ascii?q?AUgpCYBgSg+AiMBPwEMgQWJfoE0inKBOIxWBoFBP4ERMwOCWj6KQgSOOoJfA?=
 =?us-ascii?q?aFkBwOCTZg0HZ1JLa9IIYFYfQiDJUwBAgECAQwBAgIBAQECAQEIAQEBAZ8GQ?=
 =?us-ascii?q?2cCBggBAQMJj0QBAQ?=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; 
   d="scan'208";a="137621456"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-Received: from eddie.linux-mips.org (HELO cvs.linux-mips.org) ([148.251.95.138])
  by esa4.hgst.iphmx.com with ESMTP; 14 May 2020 06:34:59 +0800
X-Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23994954AbgEMWezQpXcX (ORCPT <rfc822;macro@wdc.com>);
        Thu, 14 May 2020 00:34:55 +0200
Date:   Sun, 10 May 2020 02:25:08 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Arnd Bergmann <arnd@arndb.de>
cc:     Mikulas Patocka <mpatocka@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/2 v3] alpha: add a delay to inb_p, inb_w and inb_l
In-Reply-To: <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.2005100209340.487915@eddie.linux-mips.org>
References: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com> <alpine.LRH.2.02.2005061308220.18599@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005070404420.5006@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com>
 <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com>
Content-Type: text/plain; charset=US-ASCII
X-ReSent-Date: Wed, 13 May 2020 23:34:55 +0100 (BST)
X-Resent-Sender: "Maciej W. Rozycki" <macro@linux-mips.org>
X-ReSent-From: "Maciej W. Rozycki" <macro@linux-mips.org>
X-ReSent-To: "Maciej W. Rozycki" <macro@wdc.com>
X-ReSent-Subject: Re: [PATCH 1/2 v3] alpha: add a delay to inb_p, inb_w and
 inb_l
X-ReSent-Message-ID: <alpine.LFD.2.21.2005132334551.1120869@eddie.linux-mips.org>
X-Return-Path: macro@linux-mips.org
X-MS-Exchange-Organization-ExpirationStartTime: 13 May 2020 22:35:10.6710
 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: 192518c2-dcbf-4121-86f4-08d7f78de55c
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:216.71.154.42;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:esa4.hgst.iphmx.com;PTR:esa4.hgst.iphmx.com;CAT:NONE;SFTY:;SFS:(4636009)(33430700002)(34756004)(8676002)(4326008)(33440700001)(54906003)(336012)(5660300002)(107886003)(42186006)(356005)(26005)(86362001)(7636003)(82310400002)(7596003)(6862004)(1096003)(6666004)(8936002)(1736002);DIR:INB;SFP:;
X-MS-PublicTrafficType: Email
X-MS-Exchange-Organization-AuthSource: CO1NAM04FT036.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-OriginatorOrg: sharedspace.onmicrosoft.com
X-MS-Office365-Filtering-Correlation-Id: 192518c2-dcbf-4121-86f4-08d7f78de55c
X-MS-TrafficTypeDiagnostic: MWHPR04MB0800:
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-Organization-SCL: 1
X-Microsoft-Antispam: BCL:0;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2020 22:35:10.5140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 192518c2-dcbf-4121-86f4-08d7f78de55c
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=b61c8803-16f3-4c35-9b17-6f65f441df86;Ip=[216.71.154.42];Helo=[esa4.hgst.iphmx.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0800
X-MS-Exchange-Transport-EndToEndLatency: 00:00:01.7062641
X-MS-Exchange-Processed-By-BccFoldering: 15.20.2979.027
X-Microsoft-Antispam-Mailbox-Delivery: ucf:1;jmr:0;auth:0;dest:C;OFR:CustomRules;ENG:(20160514016)(750127)(520002050)(944506383)(944626516);
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YQGiqfxAjndmWddVcyEUzjmieyrkEA8Zlf6+nAlyg+ehcRpjaqI1g7H2fLfR?=
 =?us-ascii?Q?yWfrwCLPPne6t8WJw5EDw7uANimYt2NHzY1ZVdLA/I9smWG3FRBKv+nxy02p?=
 =?us-ascii?Q?exFKSzQ2i+Fc+eioZQ/8M/5MlnMQprHJP9oGFnJYRkvcu9jPbDePUxBvKkjQ?=
 =?us-ascii?Q?8dqCaNkCnGGtGS1VLv+RmNZ+/exehaPQ4AW50/t5+KOPy9VjGFCfbdV9t/A9?=
 =?us-ascii?Q?GOdmRFVzOwWvsQRo8iOjjrLryMxDw30TaUjjvWyT4RSyUkXaC02yMpIYPEOL?=
 =?us-ascii?Q?D2b7U/KmHM3GoNKh13mioe3Xl7ZOhvMBz719iWas7/M+5rtV8oIvRWa9CKnw?=
 =?us-ascii?Q?aFzre0HuPeBhf1+oqYK8sc3rlC3LESFFq/wNCJaYONoE0crAf2Z7xdIRqAis?=
 =?us-ascii?Q?+GUuL9Kid8Lqthu86kxXtahZBohB0XXqsWaKcZS4YsaOhE5bhhgFxe69Bk5D?=
 =?us-ascii?Q?ztD/DSAqfjvn1ItcAbOVYigdTxYSQ4E0y1VPdcD5djO3HX+Ojy4j0/QjRZXr?=
 =?us-ascii?Q?Gxy7N+3TGZy25cChYsffggruZ4bz/ZRiq/dY5FD1mwGbg6mv+72+qpOiD5B7?=
 =?us-ascii?Q?yKI7/clwIRU0vFgaI0AMRyzj0tjOVC0AUgYutkt4381RUu8DV/cRFMtCkJp7?=
 =?us-ascii?Q?ynztUN2GGIRL21WshXus449yd4Re4qOFpf3mBDWdmGVNf3divYdThW8Et8ca?=
 =?us-ascii?Q?77yJ23Rm7IdujRS8292Sdkxtd4HpksHBpZjz65GSUm7Jiru2Nyzi2QNu9+gu?=
 =?us-ascii?Q?3IX5Tya6W6nA8o58rGX7sjFTySG5AutHtk7EEFKMJ0ZAZEeJKxRIhZOEFaL4?=
 =?us-ascii?Q?FTTUBCooSpTibHwZduuoEqJKSb61nwac9ZwdhuU/Mr+AQCTsziIq4RWGyQfr?=
 =?us-ascii?Q?N1gmC6Tt+zHDyC8hjgpenVRt2t05ffhuhhKZFZCtQjiFx+eXADlIsd1oOFKx?=
 =?us-ascii?Q?DA9c4CBN2id6Vq8gamLy+nZ0hwccsSiyCZwHyfe6FBJ76JGGdoimL+Xo6x3w?=
 =?us-ascii?Q?LmdeECBLI6bRhh5mSq4AUr4pMGVa3i7apOBNaz36redwBghMOB0F3bDdGS0n?=
 =?us-ascii?Q?Z5p+lY1O49TB2pzAtj1YOdfOLlRlT0ZRk+IGwlJTBVXiOmnA/FlHlxw9yZT5?=
 =?us-ascii?Q?uAmEVR5ABMm13Ouf1D224oOAHyX2NoVsJkmGQgrSnAAYF+Ox5vkfxT4C0Be4?=
 =?us-ascii?Q?b1GoIMcEK231/4bXe2l60+1GhC7JPbZKQh4JV0NpEdgDc0Uh1YARSKcfzji+?=
 =?us-ascii?Q?UqyxezWtSb9gFcalHYLrweQeg9yXY8fPGMawMqPfBlv9emaGsxk0LovOo9Lu?=
 =?us-ascii?Q?wiWO3ZLndH7aJPkKVvv0LzunkLgdK/JfyQuC3DYb/HgAg4bTYv6jQF9Dioic?=
 =?us-ascii?Q?HaltPaoxddVu08MjgyV1kw43xser?=
MIME-Version: 1.0
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 7 May 2020, Arnd Bergmann wrote:

> > Do you think that all the "in[bwl]" and "out[bwl]" macros on alpha should
> > be protected by two memory barriers, to emulate the x86 behavior?
> 
> That's what we do on some other architectures to emulate the non-posted
> behavior of out[bwl], as required by PCI. I can't think of any reasons to
> have a barrier before in[bwl], or after write[bwl], but we generally want
> one after out[bwl]

 Alpha is weakly ordered, also WRT MMIO.  The details are a bit obscure 
(and were discussed before in a previous iteration of these patches), but 
my understanding is multiple writes can be merged and writes can be 
reordered WRT reads, even on UP.  It's generally better for performance to 
have ordering barriers before MMIO operations rather than afterwards, 
unless a completion barrier is also required (e.g. for level-triggered 
interrupt acknowledgement).

 Currently we don't fully guarantee that `outX' won't be posted (from 
memory-barriers.txt):

" (*) inX(), outX():
[...]
        Device drivers may expect outX() to emit a non-posted write transaction
        that waits for a completion response from the I/O peripheral before
        returning. This is not guaranteed by all architectures and is therefore
        not part of the portable ordering semantics."

  Maciej


