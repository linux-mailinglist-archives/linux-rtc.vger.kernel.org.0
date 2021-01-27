Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DFCC305C9B
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Jan 2021 14:12:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343707AbhA0NLZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 27 Jan 2021 08:11:25 -0500
Received: from mail-eopbgr60128.outbound.protection.outlook.com ([40.107.6.128]:27738
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238223AbhA0NIv (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 27 Jan 2021 08:08:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cySt3jaRSnpCwweBPlvV/jinA6XzPsqFw4W/xSlXa4/WQHAH+8wq/4a5iEj4F11M4RoOZMc5l0rYyyOOuOJfEIB51XKWECQ8OeykgDoSQkkBTKqI895tl64W1WzBWFxT0JEB4jZlUpYQb8WNvWbcnuD2Zd4xsx3AhNkvbQuIVfTDxQSPsuIowH1gVAFq6nTTp7z2TQMt4e9xD5aFobFzBJ1tHRi5Z95PYcG4FKUI7wLMRJiYy37WquY2qr2GIvvVR3TCRzbGAUvW9VwtOw7KV7bHBOrlIrBBW0H8NjB80gEK7owhyStBkn5v5bpnpYz3QevnUn5JkcFjf6lGBkaiCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQ+kjd//N3LSS2bTFUgA/B2HyqFLjJagOpoTvBoVJao=;
 b=AUvGztM02hAw6zkMN7iT1lOBKtS634/l3bv3BhWqFX+VgnkSVHGx6EPrPK8EZpdp4ludlFIimcwxJsEpdqk+he++R1mE2MqtZVXXJrbgCd+6nntfzb67kbQ5RT9HUa9G84rwRbk8q9UA2uoMp4Hu8XaThEM+o16IXrI73KPIjrIUTwjnFk2aQ3FzATu6ijGCSrVe+lCe0aKHswltfNFNCWfuwcYP1Aag1BqR0DuoqD/nKqYVm+df6j9LUDRWjJmJMmn0YLapCZOyVwI+FLqwW8Wqp7fFCYJAa2ILQnSIzER2w06CgmN7zHcd0XUeIE6w7YVcnHr98ic43nGZg9eA/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQ+kjd//N3LSS2bTFUgA/B2HyqFLjJagOpoTvBoVJao=;
 b=ftAiMAOhqp3KRuCe+RnxQhUBegM2/c4h/+YfFGu7VPc1uRw6KWNTrgIddjY5x3BxWTsrMU0V8mKLXR9zdXnJTAQfIGK4iy5TzOPEr/8V0QLHDh+9xUJd0MeCnt2U5w/sbC7WDJcb+EuPW8yaM4d/otupUV3Ycq4xLUKwAvSWEDM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB2276.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:dd::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 27 Jan
 2021 13:08:01 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::58b2:6a2a:b8f9:bc1a]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::58b2:6a2a:b8f9:bc1a%3]) with mapi id 15.20.3784.017; Wed, 27 Jan 2021
 13:08:01 +0000
Subject: Re: [PATCH] dt-bindings: rtc: pcf2127: update bindings
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201219013418.3474461-1-alexandre.belloni@bootlin.com>
 <c5290432-a6b0-2b96-585f-3abc2dcc56f6@prevas.dk>
 <20210126224835.GE1196852@piout.net>
From:   Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Message-ID: <0a8fd7f3-58c1-9e20-bcfa-9872b3dc3550@prevas.dk>
Date:   Wed, 27 Jan 2021 14:07:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210126224835.GE1196852@piout.net>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [5.186.115.188]
X-ClientProxiedBy: AM7PR02CA0011.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::21) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (5.186.115.188) by AM7PR02CA0011.eurprd02.prod.outlook.com (2603:10a6:20b:100::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend Transport; Wed, 27 Jan 2021 13:08:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0012e624-fb95-48b5-4f6b-08d8c2c492f5
X-MS-TrafficTypeDiagnostic: AM0PR10MB2276:
X-Microsoft-Antispam-PRVS: <AM0PR10MB2276B7AD92D11F03C3F53DAF93BB0@AM0PR10MB2276.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DzuIg4TsZNBXm6tnyZxlXWg7HpR2dGMd2kPhek7tE2pPus78ZXbD3yiUcGorfTk0u4fQBD4agNb3blufJo38mVRN/tNrhOmX0DnXoSQ93hq3AJeBHThb867YgKrZJ25CK60W0SzVSe5GAIkMZ5qmfY8/7LqsLGfJjE4PowjagvTo1jkC7PHcetdIfrNTGIDPBDa3q8m4vVX6aaAxUwolYSOwhWMWuxlapEaQT9bYTO6QNdeTtIkjKLJ6q3+uL0CFmcQLnmjIKzhHaibwtbM2ZRNy+1iW8kPCw2P4yR6PfHLfEMx+Fy+SagWcyHkhMThCvD+WooH+f4aSmScLbIjNzJHYQIULaF8x324WJsbE85OyFFXEqT6s1JpptapsAVA7CKl6nj41vUEH3NkaMaGDF4Ag+bDio37f9C3tb1q8JkXUD0pXym1zgNM/IyyINRdoKPTvek7ur1oWJvsGVqJbfOy2ebip/2Gj8/W0nzqk67E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(396003)(39850400004)(136003)(366004)(346002)(376002)(4326008)(26005)(16526019)(36756003)(316002)(186003)(16576012)(66556008)(956004)(2616005)(66946007)(8676002)(44832011)(31696002)(86362001)(478600001)(15650500001)(54906003)(83380400001)(66476007)(31686004)(4744005)(2906002)(5660300002)(8976002)(52116002)(8936002)(6486002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?IHujTTLjNyouOvF9PTtR9XPKgbDL9P5rkCm09chb2hBEM8WLMzfAyRUi?=
 =?Windows-1252?Q?3KFzihFC1DIadUIQ47JsLuk4j1LIuQslMFMCEoxJ+diB9HwR3Hq2+uP5?=
 =?Windows-1252?Q?jyeswPHr8qxqMzHg7M3Fum28bClyJUYVd2ATJQuk2S0H9AuMK8xl0Odk?=
 =?Windows-1252?Q?tZHZZmVnaQiQ880aTGvhG9++91h/sMI/4MaIVz1sZNz8W/PAjvumDnGq?=
 =?Windows-1252?Q?DINYv1fW9Bs+wQqSShX9PXtbSybg7yPlzrX+B3/Kqg6qbS3t/UNYjdXc?=
 =?Windows-1252?Q?JbPftDIET6AzQdnTEX4ia37actY0V68tm5Vt7r1sQzDYrQkAbII5UNsW?=
 =?Windows-1252?Q?obnnCgawgbOzynEpJpQJdM6ebTcgvTNWYgGQvxEzUozbGh6njx/Ugalg?=
 =?Windows-1252?Q?ArvIvkd6xg7Ssg5GJS1RpuguJfH8iit0IXLNonv3qlRx2R8/ApidaRNJ?=
 =?Windows-1252?Q?0NP1VDlG29EnI9wN8XQd2FROWOZkwkWnaPYlw1BCTTSEGNwcaWqoyJYO?=
 =?Windows-1252?Q?6x1MXqHJGFModrzFCmiRKHwMEHMM9QYzpm5HkkV8AfGrRr80y99KRfqb?=
 =?Windows-1252?Q?DfeabthPEQWQAy8u8On0t2bNmBIIlDOAGMb62lHjHBtR4M87J+m0CiBX?=
 =?Windows-1252?Q?QiKoZkJ2pXdn6CA0wrD3VkSVEhCi5+kDRvufjUrjGrvCo0UgrWnyUbQz?=
 =?Windows-1252?Q?+yw86z5Khd8jRE8LoViTtAE+oFkouIZE8uEScM9HWrzlbSpHDoqTP4b1?=
 =?Windows-1252?Q?Svgx7i8RaZmjx761hR6cLtwJ5FBX/Qjwf7U/MbIn95BYXJfsyi5Het6W?=
 =?Windows-1252?Q?tUHuhKDLBOx4vQy/gRjnUeGwpmowJQ6wmJUIAoiBH9fa4dZW5G9+m/Ou?=
 =?Windows-1252?Q?yIp+3uQOX3kJ2YELoVqTDEaoxHZYJHROtbLh2E10P0fcozeh4+ooE/Zl?=
 =?Windows-1252?Q?SXVI7uCsLcYIxSXU0fpsIRoGQxyPk+HW2efIkXAI56oHgIP3cOzaFBFW?=
 =?Windows-1252?Q?/p+KlZKu6D7clweJelQ+Q8U2pM0UTMnzdEGunVPR7H63D0D87F8Y47BC?=
 =?Windows-1252?Q?0exNR29g1LGm7hyZuI+7ZFspvVW9wXq+rhd0BDyLKBFIjR8zN9J4sKuV?=
 =?Windows-1252?Q?iPak00BHLWAx6Pb0BbLCNJAG?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 0012e624-fb95-48b5-4f6b-08d8c2c492f5
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 13:08:01.1002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A9slSqowaqu1wU9f5Vz1dZK/tWHtXlS5XMbyp8Jz7ws8hQtf+8NGY2zB0etNicX++XipgGUqTSz/bvxlQmrW6QYuod7qJn9hKi+Y9h1drM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2276
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 26/01/2021 23.48, Alexandre Belloni wrote:
> On 21/12/2020 22:17:54+0100, Rasmus Villemoes wrote:
>> On 19/12/2020 02.34, Alexandre Belloni wrote:
>>> pcf2127, pcf2129 and pca2129 support start-year and reset-source.
>>>
>>
>> No, the 2129 variant doesn't even have a reset output pin. Not sure if
>> there's any way to reflect that, and it probably doesn't matter, since
>> nobody's going to add the reset-source property to a 2129 node. But the
>> commit message is a bit misleading.
>>
> 
> Actually no, the INT pin can be used as a reset, the pcf/pca2129
> can be used as a watchdog and so it may need the reset-source property.

Unless I'm missing something, that would require some rather creative
extra circuitry: The interrupt pin is kept low until the appropriate bit
in the rtc is cleared, so if that is routed directly to a reset pin on
the SOC, the SOC would be kept in reset indefinitely.

Rasmus
