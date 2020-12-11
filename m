Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9490F2D8164
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Dec 2020 22:58:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390999AbgLKV5g (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 11 Dec 2020 16:57:36 -0500
Received: from mail-am6eur05on2117.outbound.protection.outlook.com ([40.107.22.117]:12449
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390485AbgLKV5J (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 11 Dec 2020 16:57:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQ3CI+YNN+t9mDvs4iTX+W/7NsGoSMx3Gn5W+EUSo+SywqWHEWmrV+KTkaYgRAtmf8I7fRTbWlOsNbyT7I3FV8iJKaW1rVdiIhODNnDXbnm5wQumHqrih+h4XXBw5E0IYTkxzwIZ17Avq+9ieXLckl2MRgKWNZS+RM5+yYpu//qjng2ZZWZaJ5XOcjuMbUmecaMHhdhOIRM2TMa47pqm+A2txhBAT/h4cNU8xUV1xwT4Mb0bQ4QuuTMAjpk0VXd7IA0i5WtUO55NbxdGlsh1sZAnSLGTqbqxLow1MYSFaCKUpUIE7Ubn6FBixfQ9eMmKC5Md5AIQe3ikZA7nwp7HxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWXEPWZAKBTBsFsDi583sb5okJops5VMJ2QVwvpfrEc=;
 b=EsG4RtNPi90SITJUO3u2Bp0YfQZHLdRFnQ/xDlmNFTGvicFufyEbub9uVBKXB7tdfa0Xi03fDyk2NhWOd77hui3vj/v1PbnjHsImBn/dC5bJQs0vss84xrrCHDMSbavBizyzBzNkvFMrIAampLs4MJL5HmxY6/mrp1v4FkfFQ3YMhQNViYTghDrxr6GQSVFMjb6npdbVXsq7FJHZSdFl0OHUsQDMKoHcXUQi124DxA+cxzWQ+Hg6qa/bXRNOCqmKypyNt0pQC5jGnfSNpYGcWrF/EsMxI8PxpKBbFfR8uxRhujgEDNixFMTgv9+7WzBj4UX77bux3e51BE4sJQNkyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWXEPWZAKBTBsFsDi583sb5okJops5VMJ2QVwvpfrEc=;
 b=YcJPM4RtIuO1WL18Ygm6kT2i5NXEl9ScTJH9RzXUeE/HKOgljEEo7/a1zIUuBtRjuMliP51XoZJXmp1LVr4J9vp86WxApUBUCJ4HgKJHYJzVC8sLma8OiBk02DVCXvOTcRsoCu9Tm5hv1OVlrX381caAbhK+p1imcUoiOp1ebYo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB2867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.22; Fri, 11 Dec
 2020 21:56:20 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3%6]) with mapi id 15.20.3632.026; Fri, 11 Dec 2020
 21:56:20 +0000
From:   Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To:     linux-rtc@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Qiang Zhao <qiang.zhao@nxp.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH v2 0/3] add reset-source RTC binding, update pcf2127 driver
Date:   Fri, 11 Dec 2020 22:56:08 +0100
Message-Id: <20201211215611.24392-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201204092752.GE74177@piout.net>
References: <20201204092752.GE74177@piout.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [5.186.115.188]
X-ClientProxiedBy: AM6P192CA0068.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::45) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prevas-ravi.prevas.se (5.186.115.188) by AM6P192CA0068.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 21:56:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdea7115-e9c7-40b1-a06e-08d89e1f9821
X-MS-TrafficTypeDiagnostic: AM0PR10MB2867:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR10MB2867CE5B27A840B5F1F2409993CA0@AM0PR10MB2867.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I9WXhOdG2GWsP6XRjJUk/kfvmensCsPKyS6ftTIdViixCMtTNJBgwhvZyOldObSFUQZxrtM0e0ARO9zcPptEMxbzfvuCSfeafPh+esCU1HKQai8WszS375wl25wtNS40hJD+9+Yk9sfoiRGN/Ff8D2pOa2rMdZfHiJ6w8mQnsL+MPBpAvOBTOsxuJ/3h/Hji8POUrGx6uUO+FWz8MKnNwL6bVoHRFsnD+FJsVoLjepS77qt9sDhQ9326zMBrCZ+Cx9V8it/QV5CGtnW6nxMfjnU7lmuuxQDWHw1A9wp1s0gtPCpl/fywAFJPCAQV45gS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(396003)(366004)(346002)(136003)(376002)(39840400004)(6666004)(83380400001)(8976002)(66556008)(6916009)(2616005)(4326008)(186003)(107886003)(8936002)(52116002)(66476007)(36756003)(6506007)(54906003)(16526019)(66574015)(8676002)(478600001)(5660300002)(86362001)(66946007)(44832011)(2906002)(6486002)(6512007)(26005)(956004)(1076003)(316002)(4744005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T3dtV1BIQ3gxNGJyZXBuOGtSWlcybXd2NEVDemNYWC81WVE2OHYvZ1RWYkJU?=
 =?utf-8?B?VkVPZ0JpcmhwMVBXTlhNbUN1TGt2K28vZmoxWGdtK2k3SnBRRXFzRmxqSHk4?=
 =?utf-8?B?VEVmQ3RDMzFKdm5UZ3F0VkRQWjZXaUVuS3ZjcjhLTzl6UmpLUGtvOTZYeHI2?=
 =?utf-8?B?UmMreWd4UnJuYnNEelgyZXpxWVpIVEphN2x3bXNqSGdJU0Z0RHRoRzZFaUw2?=
 =?utf-8?B?b2lDcFcxSjJOK05ROURMMUFoeThXcVo3Qnc5OHJmWWd1ZzNlUlprYXo0bHZi?=
 =?utf-8?B?WmJhVitPbi9DVGlOOTkzd1BQRHNFR3hDMVVQWGo3eDFJRTYxVEdKUmVQOTJv?=
 =?utf-8?B?NkNjUC9hUE03Q2VVUzRRLzBZVEpEWWg0UGNDV0pCNkR0ZzFYRTF4L3dRZHlK?=
 =?utf-8?B?ZVJCVmlzZ0pwQ1dXZE01WFRhU0h2UFNPOWpXYW92OUp2TTVHQXBOVmZtYkI5?=
 =?utf-8?B?N3RPYWNpRkxkYUR0UG96T0UvV3dlZEdzb0dGWi9pdm00RFVEeWk3UEszSnI1?=
 =?utf-8?B?ZUw4dnR4bjkrRkxGU0lPazVTZkUxczdFZGpaZC9hK0tqS1R5TGFQc1ZUQUVk?=
 =?utf-8?B?VGtZMW5XNVBvY21qdytOUzZLRGhmKzRXa3pGMGF0VmVDdFc2ZXB3QnhuQVlm?=
 =?utf-8?B?aVlxaE1Ia0ZWOFlMeUY4NTg3cUlnb0NTSFg2cWE4b3J6dFZPYnNUcW9taHE0?=
 =?utf-8?B?Zko1MXE2QmRvZEtuRnRtT3FLR1pHS3VmRkFlMjFlM0R3U1Ewd1Q5ZzMwN09O?=
 =?utf-8?B?eWNFVUJtWldvYkF0S0lpZjhCRTRrTHJZUjlEdXNWeDliT1JIRjZkR0VEamtu?=
 =?utf-8?B?aG1TNi9Ob3ZwZEJxTTI5Sk1MaGZkaXFmeXF3OGFCUENRVGQvaDlmQkZ3L1NU?=
 =?utf-8?B?ekFOTldQVHdDM2lTbHM1TkxlYlBYTHF0TWFoRUlMODBldzdORTZ6djg4OGIw?=
 =?utf-8?B?TWFpUlFMMmIrRXR6YkdpVlJhM01SbDBzb1EzSXh3Y3A1YmpjanFwU3pHKy9t?=
 =?utf-8?B?Qzc1ZlZJNFFRMWQxLzRyTzhNNzl4bGxOVFY5SnBBZ0dwc3RtaVRod2VrcVND?=
 =?utf-8?B?dTRncEFQQTZ6OGQwWUN1QWRNbUl5YURpQlBkYUk1Z3JNOVVkaTA0dFk1TE55?=
 =?utf-8?B?dnBoTFBPMkYxa2JuVDZ1ZFlhUVBscllKK3UzbmdoZS9XQ3VZR3BaYjVhS1Jh?=
 =?utf-8?B?RmpmeVZaOXBHL2pJcU5SR3paOG52RllrdkNQQXNJWm9ONEI2RU0vdTZwWktJ?=
 =?utf-8?B?M1p2ak5SQVpOQ1Vua3RWeHB3WmRDWElHMU0wb1lzUkM3MXRtOFJBWmVZaFdi?=
 =?utf-8?Q?1DnGaOVFaf6XHUgdtgiQd0u+jF2ZhvPxBP?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 21:56:20.5511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-Network-Message-Id: cdea7115-e9c7-40b1-a06e-08d89e1f9821
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oqFzbW3iK9kTGyJdUZzP2tNroh+CoEQlhMdZ2pRr/YCwOqYufGOsm/vS1GkTxeQR/YMGdJmBrqu1prIPWmRXy02hd4x9MeLX+bmEJqsIGjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2867
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This is a resend of Uwe's pcf2127 patches, prepended by a dt-binding
patch adding a reset-source property, as suggested by Alexandre.

Rasmus Villemoes (1):
  dt-bindings: rtc: add reset-source property

Uwe Kleine-König (2):
  rtc: pcf2127: move watchdog initialisation to a separate function
  rtc: pcf2127: only use watchdog when explicitly available

 .../devicetree/bindings/rtc/rtc.yaml          |  5 ++
 drivers/rtc/rtc-pcf2127.c                     | 55 +++++++++++--------
 2 files changed, 37 insertions(+), 23 deletions(-)

-- 
2.23.0

