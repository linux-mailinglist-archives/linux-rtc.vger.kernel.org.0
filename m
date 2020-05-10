Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77E331D224C
	for <lists+linux-rtc@lfdr.de>; Thu, 14 May 2020 00:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730087AbgEMWrN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 13 May 2020 18:47:13 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:35616 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbgEMWrM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 13 May 2020 18:47:12 -0400
IronPort-SDR: xzDx2mnQ3Lb5XDWxPwAqBcw/x2JwklOxRCKk6SmaO7KKxLdWfWxLT8m50CrUNrCSgRQNZINnjR
 UDAPW+RFVQyabztmPx5NDf8jV6OI3sX83BHodjtJV/h+36tcRXXyhF7hZ2PR/YYEsc5nAciBgo
 tAnfujjr0VbAzCEObYheNoZoJvySvHWIjAVXgmrP/Fepkz9vnFN/H0RByhivvMSkg1SdIx1tx3
 NjiB4ot/Iktw8N+cHHH5hmGysp26fqedSsZpYBKkSOu7/QcDOt3wDkrd+v59tutNgFHdNmGS2t
 lts=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; 
   d="scan'208";a="246571698"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 14 May 2020 06:47:12 +0800
IronPort-SDR: HNs7NjzQBIuw+YYgFoi6R0ggEUKz9GTD7J/evQFOyUyZIS7YwfouyHg5LWZaOXKbYbLRMUfjb1
 UzivT4L8cLAMsZxJ9yDZkChUvpUlYHS1E=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 15:37:25 -0700
IronPort-SDR: 52VWrw1eBOsCC7ePvjpHqYkFlNt/sfv2x6NWwdTDCuHK5mBUIOIfmKnIZYZeb+3KUA0gq8TRWJ
 Ap+XUwrfv3WA==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 15:47:11 -0700
X-Received: from MWHPR04MB0545.namprd04.prod.outlook.com (2603:10b6:a03:e0::43)
 by BYAPR04MB5176.namprd04.prod.outlook.com with HTTPS via
 BYAPR05CA0102.NAMPRD05.PROD.OUTLOOK.COM; Wed, 13 May 2020 22:35:14 +0000
X-Received: from BN4PR11CA0024.namprd11.prod.outlook.com (2603:10b6:403:1::34)
 by MWHPR04MB0545.namprd04.prod.outlook.com (2603:10b6:300:72::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Wed, 13 May
 2020 22:35:13 +0000
X-Received: from BN3NAM04FT016.eop-NAM04.prod.protection.outlook.com
 (2603:10b6:403:1:cafe::b2) by BN4PR11CA0024.outlook.office365.com
 (2603:10b6:403:1::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Wed, 13 May 2020 22:35:13 +0000
Authentication-Results: spf=none (sender IP is 216.71.154.42)
 smtp.mailfrom=linux-mips.org; wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=none action=none header.from=linux-mips.org;
X-Received: from esa4.hgst.iphmx.com (216.71.154.42) by
 BN3NAM04FT016.mail.protection.outlook.com (10.152.92.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Wed, 13 May 2020 22:35:12 +0000
Authentication-Results-Original: esa4.hgst.iphmx.com; dkim=none (message not
 signed) header.i=none; spf=None smtp.mailfrom=macro@linux-mips.org; spf=None
 smtp.helo=postmaster@cvs.linux-mips.org
X-Ironport-Dmarc-Check-Result: validskip
IronPort-SDR: 3R7gmEnokUQK3KtGxLuA4lWT/N38yvd7LMiGCtytn4IqJNF3KRueyZxJifyDSLnl92QGWPy1rH
 B5unlZicvZ4OAz+mGkef5f0L/WXm38OO8TSGTiEfKpLs6GQTCR1/sV94YMS5AsPbIiWv0pvFhY
 sBP4nC42doIvh/+xDL6ruk7JapmEDsVhPi42iHCNU9qSLcPT/RWDChi2Thmb5FMXI62VlDJIK5
 5NVwlcOsjXTiO/yoiNDgSWaLGEwG+DiOX14UFYjUYI69LVzG4EMIPpV4ZwoXnm1/JP2U7e5B+u
 u4MhP+xi9lbxTzLr3PfW1aXd
IronPort-PHdr: =?us-ascii?q?9a23=3A91TuahZviQr+D25hVQlHQG//LSx+4OfEezUN45?=
 =?us-ascii?q?9isYplN5qZr8W6bnLW6fgltlLVR4KTs6sC17OL9fG9EjRRqb+681k6OKRWUB?=
 =?us-ascii?q?EEjchE1ycBO+WiTXPBEfjxciYhF95DXlI2t1uyMExSBdqsLwaK+i764jEdAA?=
 =?us-ascii?q?jwOhRoLerpBIHSk9631+ev8JHPfglEnjWwba5yIRmsqQjctsYajZdmJ60s1h?=
 =?us-ascii?q?bHv3xEdvhMy2h1P1yThRH85smx/J5n7Stdvu8q+tBDX6vnYak2VKRUAzs6PW?=
 =?us-ascii?q?874s3rrgTDQhCU5nQASGUWkwFHDBbD4RrnQ5r+qCr6tu562CmHIc37SK0/VD?=
 =?us-ascii?q?q+46t3ThLjlTwKPCAl/m7JlsNwjbpboBO/qBx5347Ue5yeOP5ncq/AYd8WWW?=
 =?us-ascii?q?9NU8BMXCJDH4y8dZMCAeQBM+hGsofypVgArRWxCgawH+7v1iNEimPq0aEmz+?=
 =?us-ascii?q?gtDwfL1xEgEdIUt3TUqc34OKkVX++v0KbIzCvMb/FL0jj98oTDbwwvofaNXL?=
 =?us-ascii?q?NwbcXRykgvGw3YhViXrIzqJS+a1v4Ks2WA6+pgVOSvi3Moqg1opzivx98sip?=
 =?us-ascii?q?LTioIS0FDE+jx0zYAoLtK3VEB1e8SrEIdMty6ELYt2RNsvTW9mtis61rALvY?=
 =?us-ascii?q?C2cTQJxZk5yBPTduKLf5WU7x/hWuifLzl1iW9qdb6hmhu/81asx+3hW8S01F?=
 =?us-ascii?q?tHqipIn9bMuH0Lyhfd5M+HSv5n8Ueg3zaCzwXT5ftCIUE7jKbUNpkhzaIrlp?=
 =?us-ascii?q?YJtkTDBCD2lUPrh6GVbkUp4vWk5uvkb7n8uJORN5J4hhv6P6kugMCzHOo1Pw?=
 =?us-ascii?q?sIUmOG4+qzzqfj8lf8QLhSjv05jK3ZsJfCKMsHuK65GBVZ0oIi6xa5Ejen38?=
 =?us-ascii?q?0UnXwGLFJdYxKLlY/pO0vBIPzgDPe/hUqjkCtzyvzbMbDsAY/BImbDnbv8Z7?=
 =?us-ascii?q?pw705RxBAuwd1R5J9YErQBL+jyWk/1utzYFBg5MwmszubiEtpyypkeWWWUD6?=
 =?us-ascii?q?+dMaPSt0KI5+02L+mJZY8VoC39J+Ii5/70gn81gUUdcrWx3ZsLdHC4GexrI0?=
 =?us-ascii?q?CDbnXwmNcBFnwHvwQjQ+P2klGNTTlTZ3PhF547sxQ6C5+iBJyLfomxh7eC1W?=
 =?us-ascii?q?/vG4VfemdNCVmkC3rkd4yYHfwLbXTBDNVml2lOcLGqSoIjnS7o/DX92atsLe?=
 =?us-ascii?q?uesnkdvJn50/Bx5uvOhVQ39CRvScOH3DfeHClPgmoUSmpuj+hEqktnxwLGiP?=
 =?us-ascii?q?Ag2aYKPMFP5/5PTgYxPILdyOo/Md3pRwbdZY7XEASrWdz6RzE+Vc53wscOZl?=
 =?us-ascii?q?Y7ENKn3VjP3CuvVrkSkbHDRJk56bnV0HW5IcFhg23H268sgxhuQsZGOWC8wK?=
 =?us-ascii?q?8q8Q/VCt2BiF2XwoCtc6lUxyvR7CGGxGuKsltfVVt1WK7fWlgbZ03LvZH851?=
 =?us-ascii?q?vZCbi0BudvKRNPnOiFLKYCcdj1lRNGSfPkbczZeH60knysCAygza2XKo7rfX?=
 =?us-ascii?q?gNmSDcEFNClBocpCzUDwU1Cya/rm6bNwRATwO1MWXr9+Q26H6gRxNyzw6Rcw?=
 =?us-ascii?q?tgz7qw6lgegvnOA/UUlqkJvisssX19AUq90tTKCtGBuxsEHu0UYNUz501C3H?=
 =?us-ascii?q?7YsAo1N4KpLqRrjFoTOwptuEam2xJyA4RG2c8k5HYjxxB1AaaZ1k5RMjaZxY?=
 =?us-ascii?q?u2PafYawyQtFiuZ6PQxlDCwYOT86YL5u4/rgartwWoG0w+tnR/hoAJgz3Gu8?=
 =?us-ascii?q?yMXVdUCMmhASNVv1BgqrrXYzcw/dbZznQwd6m7qSOE2sopAftjwRGlLLI9eO?=
 =?us-ascii?q?uJEhH/F8oCCo2gMusvzhKsZxkeO8hW9agpL4ajduOdnqmxM6wz+VDuxXQC+4?=
 =?us-ascii?q?173k+WomB5Q+XS2L4BwveFzk6CVi/nylC7vYqk0ZABbjYUEG2lzCHiD4MEfb?=
 =?us-ascii?q?V8SoENDXb3eZ+Ny95zhoDgVztjzHD4XwJU/sivdFLSYkf0gUtQ2l8L532/mS?=
 =?us-ascii?q?6oiTdzlmNhqK3XxyHIz+n4PBMaJm5GQnVjhlbwMO3Wx5gbWkavdQ0giBqi4w?=
 =?us-ascii?q?7z2aFaoK11K2SbT11PemD6KGRrU634sbTnAYYH8JQzrSBeS/ixe3iRVKW7px?=
 =?us-ascii?q?oczjOmGmpG33Y8bT7r8pT1khpmiX6MeXZ+qH2KHKM4jRzb5dHaWbtQxm9fGH?=
 =?us-ascii?q?k+02SOQAnheYDyrYbcjZrIv+GgWnj0W4ZaLW/rwpic8iqj5Wh6Rxa4mqPW+J?=
 =?us-ascii?q?WvHA4k3Cv8z9QvWz/PqUO2Z4DgzaOSNeNhY1ktAV7k8Ix9AI40we5SzNkAnG?=
 =?us-ascii?q?MXgJmY5y9NiWDoLdBSwr7zdlIGWyVNx9/T/Rig3Ux7NTSO3Y2zBRD/ioNxIt?=
 =?us-ascii?q?K9ZG0RwCc06ctHXbyM4otDmy9k+wfqnUfqefF42wwl574u5Xod2blbsxQ2iC?=
 =?us-ascii?q?GcBK0CWExZJTeqkA6HvYjn/fdnIV23eL3173JQ2NWoDbWMuAZZASirfpYkAD?=
 =?us-ascii?q?8168RnKxTLynKhsow=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0FlBAC0dbxefYpf+5RcCh4BAQsSDEC?=
 =?us-ascii?q?DbHZ1AwQLLIduhTiHYCWbYA8BLwwEAQGBBINAAoIrBjoTAgMBAQEDAgUBAQE?=
 =?us-ascii?q?EAQEBAgEBAQMCAQEBAQIQAQEWOjRgU4FHgUEsCQYDAS8MgjspAYFsgTNDAQE?=
 =?us-ascii?q?BAQEBEig/EAsOOFcGLgeDBYJXBSAPpBcBgSg+AiMBPwEMgQWIPBk1dIE0hAI?=
 =?us-ascii?q?4AYYxBoE4jFYGgUE/gREzA4Fcfj6CZwNhAVWGIQSOSDeCGgGhZAcDgk2IHZA?=
 =?us-ascii?q?XHYJdjW6MfpoLjyWGRSGBWH0IgyRNAQIBAgEMAQICAQEBAgEBCAEBAQGQSRe?=
 =?us-ascii?q?IY4VDQzA3AgYIAQEDCY5lXwEB?=
X-IPAS-Result: =?us-ascii?q?A0FlBAC0dbxefYpf+5RcCh4BAQsSDECDbHZ1AwQLLIduh?=
 =?us-ascii?q?TiHYCWbYA8BLwwEAQGBBINAAoIrBjoTAgMBAQEDAgUBAQEEAQEBAgEBAQMCA?=
 =?us-ascii?q?QEBAQIQAQEWOjRgU4FHgUEsCQYDAS8MgjspAYFsgTNDAQEBAQEBEig/EAsOO?=
 =?us-ascii?q?FcGLgeDBYJXBSAPpBcBgSg+AiMBPwEMgQWIPBk1dIE0hAI4AYYxBoE4jFYGg?=
 =?us-ascii?q?UE/gREzA4Fcfj6CZwNhAVWGIQSOSDeCGgGhZAcDgk2IHZAXHYJdjW6MfpoLj?=
 =?us-ascii?q?yWGRSGBWH0IgyRNAQIBAgEMAQICAQEBAgEBCAEBAQGQSReIY4VDQzA3AgYIA?=
 =?us-ascii?q?QEDCY5lXwEB?=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; 
   d="scan'208";a="137621454"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-Received: from eddie.linux-mips.org (HELO cvs.linux-mips.org) ([148.251.95.138])
  by esa4.hgst.iphmx.com with ESMTP; 14 May 2020 06:34:58 +0800
X-Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23994953AbgEMWezHpX08 (ORCPT <rfc822;macro@wdc.com>);
        Thu, 14 May 2020 00:34:55 +0200
Date:   Sun, 10 May 2020 01:13:43 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Mikulas Patocka <mpatocka@redhat.com>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, linux-serial@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH 2/2 v4] alpha: add a delay before serial port read
In-Reply-To: <alpine.LRH.2.02.2005070407010.5006@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LFD.2.21.2005100020530.487915@eddie.linux-mips.org>
References: <alpine.LRH.2.02.2005060721450.25338@file01.intranet.prod.int.rdu2.redhat.com> <20200506114711.GB3024358@kroah.com> <alpine.LRH.2.02.2005061122440.16395@file01.intranet.prod.int.rdu2.redhat.com> <20200506154938.GA3537174@kroah.com>
 <alpine.LRH.2.02.2005061152300.16395@file01.intranet.prod.int.rdu2.redhat.com> <20200506160823.GA3559699@kroah.com> <alpine.LRH.2.02.2005061245500.18599@file01.intranet.prod.int.rdu2.redhat.com> <20200506174528.GB3711921@kroah.com>
 <alpine.LRH.2.02.2005070407010.5006@file01.intranet.prod.int.rdu2.redhat.com>
Content-Type: text/plain; charset=US-ASCII
X-ReSent-Date: Wed, 13 May 2020 23:34:55 +0100 (BST)
X-Resent-Sender: "Maciej W. Rozycki" <macro@linux-mips.org>
X-ReSent-From: "Maciej W. Rozycki" <macro@linux-mips.org>
X-ReSent-To: "Maciej W. Rozycki" <macro@wdc.com>
X-ReSent-Subject: Re: [PATCH 2/2 v4] alpha: add a delay before serial port
 read
X-ReSent-Message-ID: <alpine.LFD.2.21.2005132334550.1120869@eddie.linux-mips.org>
X-Return-Path: macro@linux-mips.org
X-MS-Exchange-Organization-ExpirationStartTime: 13 May 2020 22:35:12.5748
 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: 10a032b3-ef12-4d4a-080c-08d7f78de67f
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:216.71.154.42;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:esa4.hgst.iphmx.com;PTR:esa4.hgst.iphmx.com;CAT:NONE;SFTY:;SFS:(4636009)(33430700002)(4326008)(107886003)(5660300002)(86362001)(6666004)(42186006)(82310400002)(6862004)(336012)(26005)(8936002)(356005)(1096003)(7636003)(8676002)(7596003)(54906003)(33440700001)(34756004)(1736002);DIR:INB;SFP:;
X-MS-PublicTrafficType: Email
X-MS-Exchange-Organization-AuthSource: BN3NAM04FT016.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-OriginatorOrg: sharedspace.onmicrosoft.com
X-MS-Office365-Filtering-Correlation-Id: 10a032b3-ef12-4d4a-080c-08d7f78de67f
X-MS-TrafficTypeDiagnostic: MWHPR04MB0545:
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-Organization-SCL: 1
X-Microsoft-Antispam: BCL:0;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2020 22:35:12.2890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a032b3-ef12-4d4a-080c-08d7f78de67f
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=b61c8803-16f3-4c35-9b17-6f65f441df86;Ip=[216.71.154.42];Helo=[esa4.hgst.iphmx.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0545
X-MS-Exchange-Transport-EndToEndLatency: 00:00:01.9520855
X-MS-Exchange-Processed-By-BccFoldering: 15.20.2979.027
X-Microsoft-Antispam-Mailbox-Delivery: ucf:1;jmr:0;auth:0;dest:C;OFR:CustomRules;ENG:(20160514016)(750127)(520002050)(944506383)(944626516);
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GMwzOavDzojTgLwA50Ysm/iBpIvh5SPmlW4ReQemyp83RQtj//BaKo1Cikyv?=
 =?us-ascii?Q?LcroNGqEaLUqRtlihuVMWBHpE2Ufgp/OBwuKFbh+FYGgBvZOBnQ3BOi+fsKi?=
 =?us-ascii?Q?9OGHRVI8oIB46bCX+VBGynHCB7YveOkPO9MWHsL+XJvaZMtxZPAAWE+sXAz1?=
 =?us-ascii?Q?PGQ44IAafuVtSbPzxQxLjnEFdIPQhfC76zRmupTpX1DbBdmD0EZwpfWPzeym?=
 =?us-ascii?Q?IEDyE9TyFXUg58cQZRmgHyxI+0o/bANtGx5uqR8L5EoR48ugEXjgO7YjLPGU?=
 =?us-ascii?Q?51m2JdPfpuPX6T8RsoFBwUFEex0JU6zGwQl8I7GRPOG6ZkyT9POfm4012IFE?=
 =?us-ascii?Q?YBLkgQe07KoIZ5MFe/LxsnBBis92z9tw2Yjf3gs8JXj0g3RXvG5uIYM/qFI+?=
 =?us-ascii?Q?LzzB8lrvlCsfHfzz2quSFZGrILey3EnhJn56Ty8j7NXs9t325tsM7obDQkHw?=
 =?us-ascii?Q?XZoMw460I3e/YW5qAMx3W2qkHZPK+K3W9lTUuxTdzyofEdDzrcICbnXS3sML?=
 =?us-ascii?Q?7SVPn6hapRmOSZqv8ZU8E4fr7G0y9OUpiPzh61ddScM1DEblCWesPQopEME+?=
 =?us-ascii?Q?udg7vGm5LnPJn2dR7JXgNZB603fZCPNfojUZc+rLCr0bBb7RrIuADeuQI4PF?=
 =?us-ascii?Q?ERwtzuvNhwYaPlZvqbbsI2UKzkvbuPv/IyFMlTZQ4PYS2xqDdcd/sXq1+a8W?=
 =?us-ascii?Q?uFgx05wY4aP+l5j845I3q7hhX8xBcEIGUAHLovRR6MWf+2uTaJFv0TkD9OrH?=
 =?us-ascii?Q?2Rw5LWVKpEXDjnCybw8v4cyrC5ekum625apMxx9zvugpcZDznQoOBg2Pykn3?=
 =?us-ascii?Q?qCzKXyYdJH/wG+iXLJ6Ypxjj1I2Yh3LOYcajN+TnH6n6676sh/S9yEdXiva8?=
 =?us-ascii?Q?O7TBhBhJH/k6WfvGo/9SLc/D9J4/eN1VO6kca7Q5/31Pqv54ImSRC9sRfNlU?=
 =?us-ascii?Q?vsCZERd3RaRigo3ObzsnZJIPD9XEISVX4/fNdvnVfApWz/8HS5zFPBQZLzWl?=
 =?us-ascii?Q?fQSFThNS7u9SohEutJQNcQxWN9AGaSQkcpNgBlYSIQMfg/3B4oJu7IU2+9DI?=
 =?us-ascii?Q?TLsocKO4FBwxgEEfnIwvu5MxBPbe/4a+W9H89JcMfCf7NqQduS6WaaKsLVyf?=
 =?us-ascii?Q?hDjp6kb+/xPnTiEt0b2BqeFBTEQnZ6Xsgm/Tc62N0wc5dj41STUpZJ2LZDgX?=
 =?us-ascii?Q?s8A1V6vLVc+GEA5IhdrUwoebdUs6AiZTzRdwWbzRGSO6HwW7JeF7C/sRmz0h?=
 =?us-ascii?Q?jBh6+A10u9zkTixaQUukfUd19laHFXk7/uZKNXDmfSu2Iux7tPYU5Vg0CrMr?=
 =?us-ascii?Q?5zcW3dYxunGYTIvDlKVQFXKmzgljwgmQgVm+jI6EaLb8PFGLXQbOYWN/8WLX?=
 =?us-ascii?Q?o6ZwWGlco4N7pxqiG620+oKCvsSehlJzqXqUmumbMNhtpVPSDwUc2rTFFWWf?=
 =?us-ascii?Q?PkoUKRakFxD8CxJvEheQx4pvb/vCmOsW?=
MIME-Version: 1.0
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 7 May 2020, Mikulas Patocka wrote:

> > > I've created this patch that adds a global macro/variable 
> > > serial_port_needs_delay. I've also deleted UPQ_DELAY_BEFORE_READ and test 
> > > serial_port_needs_delay directly in io_serial_in, so that the compiler 
> > > will optimize it out on non-alpha architectures.
> > 
> > That's not good, what about systems with hundreds of serial ports?
> 
> I doubt that someone will conect hundreds of serial ports to such an old 
> alpha machine :)

 It would be good if PCI serial ports (on add-on cards) were unaffected.

> > > > But, there is no other way to detect this based on hardware
> > > > signatures/types instead?  That is usually the best way to do it, right?
> > > 
> > > It's hard to detect Alpha without using '#ifdef CONFIG_ALPHA' :) The ISA 
> > > serial port hardware is simple, so I think that you can't distinguish it 
> > > just based on its behavior.
> > 
> > The ISA serial port hardware does not have a unique vendor/product id
> > somewhere?  Some other sort of definition that we can use to determine
> > exactly what type of system we are running on?
> 
> AFAIK it doesn't. You can only distinguish 8250, 16550 and 16550A - but 
> not the vendor.

 You might be able to handle it as a platform device.  It's an onboard 
peripheral after all and wired permanently subject to further run-time 
configuration.

 Otherwise it's a generic off-the-shelf pre-LPC-bus PC Super I/O chip.  
Even if we can detect it it'll be there on some x86 machine.  And the 
issue is a problem that may well be anywhere between the CPU, the 
northbridge, the southbridge and the Super I/O, and the weak MMIO ordering 
of the Alpha CPU does not help narrowing it down.

 Let me see...  It's an NS PC87332 piece.  For Avanti technical spec see: 
<https://manx-docs.org/collections/mds-199909/cd1/alpha/pcdsatia.pdf> and 
for the National Semiconductor piece search for "PC87332.pdf" (no direct 
link, but you can download it indirectly):

2.5.8 SuperI/O Identification Register
(SID, Index = 08h)
The SID Register is accessed, like the other configuration
registers, through the Index Register.  This read-only register
is used to identify the PC87332 device.
  7    6    5    4    3    2    1    0
  0    0    0    1    X    X    X    X    Super I/O Identification
                                                      Reg. (SID)
                                                    Index = 08h

I'm not sure how reliable the uniqueness of the four bits in the SID 
register is across various PC Super I/O chips.  I doubt that the chip has 
any observable issues with our serial driver on x86 systems though.

 I'm not sure if the situation is fully understood here, but we have a 
regression and a working solution now is better than a perfect one in the
unspecified future.  We can always improve once we get to the bottom of 
the issue.

 I'm in lockdown away from my Alpha machine, but I can try verifying the 
solution, also with PCI/e serial ports once I am out of lockdown and back 
the right home sometime.

  Maciej


