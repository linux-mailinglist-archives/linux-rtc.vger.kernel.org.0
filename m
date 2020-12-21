Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B9A02E01F1
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Dec 2020 22:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbgLUVSs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Dec 2020 16:18:48 -0500
Received: from mail-eopbgr30090.outbound.protection.outlook.com ([40.107.3.90]:46378
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725820AbgLUVSr (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 21 Dec 2020 16:18:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EemHwqQ0tLzH7o2PYfIc4DwZfignc2W9E+uEpOi/7c4RM6C7ekIQESKcpzyuoxlzjJ36X0vbcnJgNTX2PBZHpKPftGSvUCGSuSkp4zFm9vuyOp/8RbWmL5mHw/4paOEnA2gnzsk+FgmAjUgBaDKkGzvkP1M6lJdzXxDYs9LLC4GbymO934QHOSvq0jGHtKOfcqDzHSG7EK8ceynGvodW0tU/Zw2rIVEdMRtZ1ErgxZM+CItRCcq5leVBZ7UXlX9wrG96mhLWJTxzrz0CnBxzyCrkL67OS6E2ETzXV32Jjfe1fUc/3gmrzi0XBg3kb6GUJxdLsTrmLSktrUJJUqlUHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CpiCvQGqXr5opLn4D2uyDnQSz1q3CzK7oLozJeoVzOU=;
 b=oN/4IbPvKhpOHcrDmyuevHlVJjO0VHQAGUgGJle2AIon1ipqJaQszQ2XLwsssIedB6FsdyIJQ8F4txTgkmiAqF/dYyN9XsKmd4fuDQ1Oc/fc8zEfa5XQ9sbNP26UeErL63aJ6bjVBfgkcr0hISFqFFJbTplHGMrRYqfl+y+BaUNkRV/wlrairQXJFrkUP8mofFNBQRaAG8KxL9k9YwQ7cQ35W+OyyOV7cAGS8ygM+rT7vYVac1gQPg4ZQsTnQLTgAtls6eya5hXhZWr4UBtRxh/8t+oPZAu96h7W+l2Le1UnU1WuKHXw3f3SLyt2G7akutwCyrGzk06w2kUBDl2OQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CpiCvQGqXr5opLn4D2uyDnQSz1q3CzK7oLozJeoVzOU=;
 b=A/HHdJyLmHQJyd0kG9C2lY9LCp8X3Od3mQ5ON7uZmEZD/lntVYqnWxHEyT4c00+PKj61RyWfSn9sDFGHcH9YGM3Ptk9dy9YfC5Gnuu8GIvorUXMiK/evcsz0Yeq7775j/VMekbB5U54tWRZI6ryM98dflF5j72z3uFUpAkbK5F4=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB2260.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Mon, 21 Dec
 2020 21:17:56 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3%6]) with mapi id 15.20.3676.033; Mon, 21 Dec 2020
 21:17:56 +0000
Subject: Re: [PATCH] dt-bindings: rtc: pcf2127: update bindings
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201219013418.3474461-1-alexandre.belloni@bootlin.com>
From:   Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Message-ID: <c5290432-a6b0-2b96-585f-3abc2dcc56f6@prevas.dk>
Date:   Mon, 21 Dec 2020 22:17:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201219013418.3474461-1-alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [5.186.115.188]
X-ClientProxiedBy: AM6PR0502CA0064.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::41) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (5.186.115.188) by AM6PR0502CA0064.eurprd05.prod.outlook.com (2603:10a6:20b:56::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.30 via Frontend Transport; Mon, 21 Dec 2020 21:17:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4972ca45-0dfd-4038-af32-08d8a5f5e2d1
X-MS-TrafficTypeDiagnostic: AM0PR10MB2260:
X-Microsoft-Antispam-PRVS: <AM0PR10MB226078299B1CB357B405CDED93C00@AM0PR10MB2260.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rXghaKMadzN2ma4nZWCS7aWv3RxSiCyWYsCdNfwTsoBKtDHLb8eG1KhXnxc1Q7ME2spo76yLfZVsmeOi6pXd/phBWbfTVv8Y7xldJsCsC26oXNOEp8NDlJ8PWckfA7UEYeZ9BGaq6yZRBWwBvKW5yTgFE1yZsgoGI7fwdIzZtGjRSMi52DkNifoQ1Oug9tNFWR4PtbuqHrwS5+KrOTp/Va2e+3t7sS1dnTlw05Pz7D70Ihto4Kmi+c7V0w/fiMawHgr21uh/6WWC2P1mlaRYKYjRqUSy9UrVlv3Rh+F8O6hF9GqSI5vFy+LUzo18TudgH5o7C9AZtx2tw/CZ90htJm3GTYRpxExK/uxfHVcgGHGJvasvEZYKIhKT9O1cjX5ApPp0WCjqULLGOhT/LVXdHOkok7+rY2p9Lih/ioio1teH/zFRG+8LPxxq8+raFlaLUmYvSIbW+J4vzr1LzFbUqKcSutxPiFtk0JiL+22hV+Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(39840400004)(346002)(376002)(136003)(396003)(366004)(16526019)(15650500001)(956004)(110136005)(2906002)(66476007)(5660300002)(44832011)(26005)(8936002)(186003)(66946007)(4326008)(36756003)(16576012)(2616005)(31686004)(4744005)(316002)(8976002)(8676002)(66556008)(86362001)(31696002)(83380400001)(478600001)(52116002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?iUOkUQPAn0Q6U/XCy2aLGVvvInMEfzSFgvUD3MFMrdFTZsxEla999hEJ?=
 =?Windows-1252?Q?T1CqMEZw187oHIteCq+hitlSJ18IdPyq1n7sIq+uiFxMF0Z6iFf7I9a5?=
 =?Windows-1252?Q?0O2b+u08Dx4MTYW7eDZgy0Z8hycS7EKVTBBeXlCvcttNOg7i6Le4vD77?=
 =?Windows-1252?Q?omjhvzEdllvV+vTkQIjmBXdfM2E9q4scrXLUYqLZY2lSBwJc1VjObLdT?=
 =?Windows-1252?Q?QMi2DTggfGyF9VH1ZocTFPspFmNJ0DGAG4FhjQH/ndwm00dCJSy8NbfN?=
 =?Windows-1252?Q?FXmWzUwvRw0GnZ6H0uu9edLc5JfbPFk/khWUq0b4KC+Eu3Vdo6tBUnMr?=
 =?Windows-1252?Q?YyMLcGlt2XkPh8ajYbkCnWL9B+eCRAenJ0GOHH+YI1zJc+HM4g6rP6PZ?=
 =?Windows-1252?Q?iUVYR6xWThclH33v10K7cRFe4ltpjOriwduPXgp1bEZZYPjgtRWgO+C4?=
 =?Windows-1252?Q?fXHU3mFkLAPHSqoHKPfqPKYC6Q1ycl/zRpqY/cUTaFj6XacnpEDFsMDi?=
 =?Windows-1252?Q?AeXEkKVIRAgUJi58yJyGlhD8eIUs4yGcIlqNagTUIi2s3GiUynYDj9T5?=
 =?Windows-1252?Q?QY4wrj+IF4IzQryRzOfK94Wd52sOjDkoPb+udC1QzlnN+nfMuQ8j4Vjd?=
 =?Windows-1252?Q?SGTZ0IyoKyJwKaFaE5JJ4deePyPxQ74eoetso8GDk/R3dg6UWuX5AbJd?=
 =?Windows-1252?Q?vQkfdOYxE6ytNAuneJroAiYmFhJwaTvkkIptzHXn1XcDqkM7K2NzKTCZ?=
 =?Windows-1252?Q?djlY1uw0dFdU20yjWRoF6wlk2y3mchWXhMzE10YZfA7LhP08K8QEc/PI?=
 =?Windows-1252?Q?+GLAUXLb8XfEIyqkyGgBBo4z8rWEgJ6YxnnEstJpUseDvIKkvf6QdPyp?=
 =?Windows-1252?Q?HgaoUNtdIAPFJHbU6/XUMg/ZNZizh0m8GautUoOHsoothfduMSSwrC4u?=
 =?Windows-1252?Q?sabWL9zygXx2xyzWnMpdhMJ3JzuiY/zVhITRFn52/GEMZ2c7/p06ND1F?=
 =?Windows-1252?Q?rapyu3DX1Um+YlJY8ipyyjoqMzyZg3Lbtq9TwSFk7D5OO1KUfNwRocRW?=
 =?Windows-1252?Q?NBrDgHptIlZ2AaeX?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 21:17:56.2689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-Network-Message-Id: 4972ca45-0dfd-4038-af32-08d8a5f5e2d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: huvw2gJ1jHbDXtGs7gEVFgeFxXdhNSP7EgNIdeve13fGeohV2iuLJcfYP/GpNGEH0X16TB2WOQLJinvETha0yjPdgbXKmvFBBQWi+GLDvSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2260
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 19/12/2020 02.34, Alexandre Belloni wrote:
> pcf2127, pcf2129 and pca2129 support start-year and reset-source.
> 

No, the 2129 variant doesn't even have a reset output pin. Not sure if
there's any way to reflect that, and it probably doesn't matter, since
nobody's going to add the reset-source property to a 2129 node. But the
commit message is a bit misleading.

Rasmus
