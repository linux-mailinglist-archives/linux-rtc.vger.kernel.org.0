Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5FD2DD83C
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Dec 2020 19:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730007AbgLQSYF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 17 Dec 2020 13:24:05 -0500
Received: from mail-eopbgr60130.outbound.protection.outlook.com ([40.107.6.130]:51523
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729602AbgLQSYF (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 17 Dec 2020 13:24:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CvsQ7+fkU3tPsGM8N2ght9by4AtoZ4a/jD0KU5NLo3tFjq/5GNDcnIAZ8Ov62h/Xx5wSCrH9sOTP5m2w4ROitKyom+JKREBtYP1RIhMBSVem8r68XaNnj/0ARrKBcpwabFGidJXp6bUa5owp7P+Pk04NuRHwN0g+0h+zx4vNhXbm4NBg06NNTRSaH9fmLCnDOyvk+wIserfoG8FysjEkaQTPm3XsUYd2rfGQxfl44inZbCzBaDmJZcupXMXPBrI0sjfrCjkjVJC6LyWX0XswCTGjxMx4gKZdzp6x4do4B3Xg2PhLUhbu9hA1LVmYYuVUCgciEP89YSaM/hKjCovvCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnwWRB7iQfyQHD4zn47t3ou6ziru4ZCqeSJU4Snd6uQ=;
 b=fVvAq8TJ3F6OJ5DZsM6tgYhuos63jHQPH5jVq3ikXJ9pAHVpQh3hAbuIVAEQqxsWXEk14bQWKgOygK79cziuz4MAdjim7e8ZJ5Z6mGd8soDMjm6PzxwF7aUHy/qcqie0hF5rQhgoqwGeWuSV9sEBZ+ZeyrDNMJ0yPHPxaxy4z6K3CxxHnzVOV4EAigLdS0mzK0IruscAjU3U40Fw2m5KuQYyAjyNNMbkQXIBa5ZbW3bxGBXZG96z9G6Hh8cj/XkgiPG2zzLzKaBSlKki8LNeWcn2cgbEz6m+mTlHCVV8vDrvX8/QsdxiXH22/Jd8rimEmQaZSG/Es0bQXLsGvs0JkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnwWRB7iQfyQHD4zn47t3ou6ziru4ZCqeSJU4Snd6uQ=;
 b=Psndl6Pn2rJpstW2ejkQoAmdrUfvU+tNOGQHQBiPDrPfSpTiw1gcNd/9WiwgGmgui5Vd1ME7eo6wOvXFuGJqcuVsQow+FkHDFA8JSR2tZdt5b+cYDahd+OUSkIt+G4iJfmyI3o+2bXSse2y1/tdxoRZNG03+f60YrjwIWne9LKw=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB2356.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e4::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.15; Thu, 17 Dec
 2020 18:23:16 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3%6]) with mapi id 15.20.3654.025; Thu, 17 Dec 2020
 18:23:16 +0000
Subject: Re: [PATCH v2 1/3] dt-bindings: rtc: add reset-source property
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Qiang Zhao <qiang.zhao@nxp.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>
References: <20201204092752.GE74177@piout.net>
 <20201211215611.24392-1-rasmus.villemoes@prevas.dk>
 <20201211215611.24392-2-rasmus.villemoes@prevas.dk>
 <CAL_JsqJ-5gwycTRQCdX=ZsefEJ=F1GyTjjDW6QB1PBynibFzLg@mail.gmail.com>
 <b3c05d29-3ed6-d5f5-d1dd-0ddec1f89276@prevas.dk>
 <CAL_Jsq+HeeFUR1Yv37X4OnkEPvSiAc2B86=Nshxz7tmvpKk+zw@mail.gmail.com>
 <20201217181209.sibyhlfvlpjaewrv@pengutronix.de>
From:   Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Message-ID: <519d8939-6d26-304b-7cd8-a5de6b6f168a@prevas.dk>
Date:   Thu, 17 Dec 2020 19:23:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201217181209.sibyhlfvlpjaewrv@pengutronix.de>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [5.186.115.188]
X-ClientProxiedBy: AM6P195CA0080.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::21) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (5.186.115.188) by AM6P195CA0080.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Thu, 17 Dec 2020 18:23:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72233001-1e70-4985-2e3e-08d8a2b8d269
X-MS-TrafficTypeDiagnostic: AM0PR10MB2356:
X-Microsoft-Antispam-PRVS: <AM0PR10MB2356072EA8DB0C4C09D8D33E93C40@AM0PR10MB2356.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hRJxJ4NYdCBdSMzQ59lzo55DvAv2HFx9KyPej9EWrw40ijAmDKVO/JhYkGFakD70+zQnfSisqWivYZ4uFr9bPL3F8xzqagwielQi9Kd6aYYl4icZBa6PNcKELWeWKuHTaTchdFRbWLGJmoXPb2S7SkqDXNFSALOUc3Ohp6jY+d5ov6SeTsfPp1DbNoS5maY3aXu3Ak2s4uK+WCQdxRs/C9sFxykxLJAfNpGduIknzD8kqRBcB1zrCUMNLDjMAs+0M1oBc6rUCYyfwmUtSzBn9TkhOh3Z2YUIy8TFzRbAe83pQNy/+Ix14XxNXSvVRxbbJsiPFiDg8pMUQ1dOL3bIVUFEUncWKOrAmHa5cOKF9HiKggw2DjEUCBYk7kPdxS9PxSJdxdoiKGE+5grLD6PElRZhZejIiRoAHMYGBct5ZoE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(39830400003)(376002)(346002)(366004)(136003)(396003)(31686004)(316002)(6486002)(83380400001)(66476007)(8936002)(44832011)(2906002)(86362001)(66946007)(956004)(4326008)(8976002)(5660300002)(16526019)(31696002)(16576012)(66556008)(478600001)(2616005)(66574015)(26005)(186003)(52116002)(8676002)(110136005)(53546011)(36756003)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?I4MESZKjXhiJwNeCuUqCRYsXlBfdE3BDstX1xTJOwDNS92RlUgL4H97N?=
 =?Windows-1252?Q?ptG1VNF//CBFyWPDpouC+WAgWp4VrLsmes564I+Afg59NgOGSKDQnBrP?=
 =?Windows-1252?Q?DKaDFbCDHxVOnz6BL+0gd4EMrgDAW66973g9EfxSw4EvyM4ANMkMa5Zp?=
 =?Windows-1252?Q?fBqnNoeKXadfiYpUmaHoBUJU3Apc/V1NNQNOY7X6xscQNp8H07UEX+3O?=
 =?Windows-1252?Q?0a9lV1i+CZ7fbrsD6DEf4RkSnKaBFsXTZOZKW89MKR39Y8MW9RIDB/lh?=
 =?Windows-1252?Q?u4Ut1mQZj7kCozCYfXIFmuTLH+iTzcwZd4yC+qVKsAYLNFTr6N6NfWeT?=
 =?Windows-1252?Q?+cetrRXXmt5LPGyj7/F9OIoBRKAmoC4Q855YgLxzabiFMj15medPVqsG?=
 =?Windows-1252?Q?El35IiS5ERMZHtscGav5wDSeDUYsJgXOOvVZzT7B2qEUmKFxttSQPWXI?=
 =?Windows-1252?Q?RRtXtoACC3uXXAd6ztgFF2tZBfFM+NfDN3ZCW3btMIYxDPTCvCd/C1Ae?=
 =?Windows-1252?Q?d3jQZKJ8dulBraYuwrXpHL5oLDrzgVmjPq3yqGH7CUPkSveCkqE6fZsW?=
 =?Windows-1252?Q?OaJb0VXQ24cdM8hPWQM1rFQluGVQejElH+ZSGDI0ff6EsiNz+Dgm9Out?=
 =?Windows-1252?Q?jn17GZ9V5zLPh82JHrVpW+3xeziC/agrthf1onIYU8cVycuA/vAzvr4r?=
 =?Windows-1252?Q?ojCi56imI3xUMi9GirVpgD4IbP2dhJeIIx7AdEPFRfS/eY8/+hvSBMae?=
 =?Windows-1252?Q?qtokrisJyr+4z+2lWnpAn/jG+0IvMw9SsSZbBOSDFJZh0r2zf7IwIbN3?=
 =?Windows-1252?Q?6tJ5vkwfBVz49X2x04BQf0vd53vX3G9fw0Mbl3XwwDA3pgbppfOGCnOL?=
 =?Windows-1252?Q?w9UaGPA8wxoMuAQ6o+LInxLDw9jgNdxsZU3ppwXNhwAASHolRyRkbxEe?=
 =?Windows-1252?Q?tetJi69aiuzOo1WC65qkqu4/YF7czta/95A/50q/nMhh/k9C/umnZk/1?=
 =?Windows-1252?Q?a5bJx1RE7y87OU8RV0Y62PCsiFrkw8gH89QIkXP/3HXPyG92nZavvnkG?=
 =?Windows-1252?Q?TZ5q5Z3HBF/3lZr6?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 18:23:15.9976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-Network-Message-Id: 72233001-1e70-4985-2e3e-08d8a2b8d269
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w6/EqqTVOqT1s1Uy5If28gFBNo3eMbvZ74vtmul78G49QCm+aksZvN57N5jdFK0/CbDJ/LTAojjlqruxirHrvr3U4yRiEUDVOmPda5cUPPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2356
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 17/12/2020 19.12, Uwe Kleine-König wrote:
> On Thu, Dec 17, 2020 at 10:51:08AM -0600, Rob Herring wrote:
>> On Fri, Dec 11, 2020 at 5:10 PM Rasmus Villemoes
>> <rasmus.villemoes@prevas.dk> wrote:

>> I'm wondering how you solve which wdog to ping when there are multiple
>> without relying on numbering. I guess 'reset-source' will solve that
>> even if that's not your current fix. So I guess I'm fine with this.
> 
> I guess you'd need some udev magic that ensures that the right watchdog
> always gets the same number.

The thing is, my board only has one watchdog, and my userspace opens
/dev/watchdog (aka /dev/watchdog0). But when a driver suddenly exposes
another watchdog device [which happens to be non-functional], and that
just happens (probe order, link order, whatever) to be the first one
defined, things break.

Yes, in the general case one would need some udev rules to create
appropriate symlinks. But when there's only one actual device, and I
know that, using /dev/watchdog or /dev/watchdog0 is fine.

I'll resend cc'ing the dt mailing list, and taking into account the
stuff already in -next.

Thanks,
Rasmus

