Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF4B2DE0C9
	for <lists+linux-rtc@lfdr.de>; Fri, 18 Dec 2020 11:14:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388929AbgLRKMY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 18 Dec 2020 05:12:24 -0500
Received: from mail-eopbgr70124.outbound.protection.outlook.com ([40.107.7.124]:52144
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732938AbgLRKMX (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 18 Dec 2020 05:12:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKgYE4AaxxbnXPG8A9ADVQmGQ99IKOkJumoptbVY5QdkX/NGRpSYLgWIHCEADXIKrDAtFOJ0ylySIaeZ9DlEBcF6DIoGz3P3wDRHU2hzdoLozBTVdsboCvT3AYu2SxIDigBJ1NkhiVT8RSd4Sjqoe33+dv9gVcbs4nnUxWUSm5/EUr3wVDB/wG11S98Tu0xgCd9l7jyAUXE44tcItqjSMNd/pPZOBRdx2xSM+bl5+EbLJ9W/Hx/CKU+P+op6UhjxTJK48WOHBoAOyBWCnTFuQzCgbwXnoQgA2Q2MZKLq1bE+M6s0qr26aFVn/LaiT+rDfodHTybAVU6gWxaw95dXxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66mXcxKXLpveR0yfpCGe+ojxzzaTuzgN5W2EFpvBKvg=;
 b=BLo4gS/lSJAYGwJjCwVl48Whk9sfKW/UeIP8kDNQaowTW4uwb7KayTwE5koy4tmwiECSrir6MLb3e9EYV+Zck/RB4vVNqEPbinhP5QrUlAi33ur9ecF8BF95Pb1e9Xl/nUB+EIYqEVWqjIRLX3yalhOpjk3Tak4uR+Ko7ZM+Iqs3YsLXvVNvuVLhQdLAke1vj+Vlr0CLz9BtQXPjYTI3Y4v6FB4b9iHyw9dvSYhk9PqreDi9qBwY6AQfAY/uGNzKCcnBwuQ3Fmo8qX9RYWJ/1LEt5YmLd6oNxwT4zVVkxFpOi0QHyHPxgkQXrv02E296lT4m64N9M2juVUyHeC/mxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66mXcxKXLpveR0yfpCGe+ojxzzaTuzgN5W2EFpvBKvg=;
 b=bJH1NV0qQSFJ1nmMDD8+x/Yfbql5jqJlelt4Bjdyxe+oiVBt1Jugw5WznnzPpMyXz8oW69jxRNBx8NxPH0DcjmK7y+oGeBRZNQsnAAWNGtWeHcPgGq00uwPgfn5HaO3alytQoeZekG4LWqNw3HBytvXbavixSduQPCES9n7aQ60=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM4PR1001MB1346.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:200:99::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Fri, 18 Dec
 2020 10:11:02 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3%6]) with mapi id 15.20.3654.025; Fri, 18 Dec 2020
 10:11:02 +0000
From:   Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To:     linux-rtc@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Qiang Zhao <qiang.zhao@nxp.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH v3 0/2] add reset-source RTC binding, update pcf2127 driver
Date:   Fri, 18 Dec 2020 11:10:52 +0100
Message-Id: <20201218101054.25416-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201211215611.24392-1-rasmus.villemoes@prevas.dk>
References: <20201211215611.24392-1-rasmus.villemoes@prevas.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [5.186.115.188]
X-ClientProxiedBy: AM6PR02CA0007.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::20) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prevas-ravi.prevas.se (5.186.115.188) by AM6PR02CA0007.eurprd02.prod.outlook.com (2603:10a6:20b:6e::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.28 via Frontend Transport; Fri, 18 Dec 2020 10:11:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04820316-e231-4c6a-7da5-08d8a33d3964
X-MS-TrafficTypeDiagnostic: AM4PR1001MB1346:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM4PR1001MB1346F4A4BCEC608957B9D8FA93C30@AM4PR1001MB1346.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7hV1c7peXpxLVd3uEhhKPQd09oIgUPnG074P2wHh66g0+IbMKzH5Gmxvray4xKbqacJwNe+763MEexszNu+DfVPuXhEkG62q4yAMfwHwNhEJm81mZ2QCYWh10SHg7B1V0wb9tC6cDbkU8ngYAaT5hksP6/zOGsUiyGayP0HK8EB21jchY3/JeI8FQd8GUyOPjRNUa7to6KkDikcr20EEQPg9JS6PT1qnAD9Ko2yQyqkEsrS8hCoYiqI4w9WAmdpWeLtLQhNlrLTYSAHKIA5x817HJhUjgaNWD9om2+zLcKkFPryGrMJyS8XDk7//HW811tC8YQ8dS86kvb4/s0CSbps/AfGVbN45byfc08rYeEiZjBlKq8+VeNMX2ehztKBBhVnWy0RExOMiF6aube/6pw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(136003)(39840400004)(396003)(366004)(346002)(376002)(5660300002)(4744005)(1076003)(956004)(86362001)(44832011)(2616005)(6506007)(8936002)(478600001)(16526019)(66556008)(66946007)(52116002)(6666004)(107886003)(4326008)(6916009)(6486002)(186003)(26005)(36756003)(66476007)(6512007)(83380400001)(66574015)(54906003)(8676002)(2906002)(8976002)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bVBCcFhwZ0tsVFdwSVc4cWpoTUZzK3d4YzJkaURFZm9ET2NDcnZkdDFOZG5Z?=
 =?utf-8?B?R2VVWXBmOTNzT29Lb1BvVGg1MWNKRWVHUStPM0lnekt5NURRdkdaRUNyMmZn?=
 =?utf-8?B?QjVLVzZFRWg0QXFzU0htWHhlcjZhMjRoRFhDc09uNXUrdUNNRGxXdkVSQk9Q?=
 =?utf-8?B?VmdNS2JtSUZsekVUbmJaWWlvKzV3M1N1ZmRNU01Hbi9LRndzQWtmWk9mcS9C?=
 =?utf-8?B?UWU3Qzh6V2pFdmxNWnQ5QTBSYWx4RTJWOVlwUkRYczB5MWFvQUVPTEtEZTcr?=
 =?utf-8?B?Wmc4WXVRMDEyWGFFMGZDVjlRdGlLSTB5WWM1SDl6SzJBdzFudGpER3hNSkdR?=
 =?utf-8?B?UXdkSnN1UGFBTWVNUnk3SGZsZ2ZJMUc4Q2RTdndBNkpjenZFTzJBT2hIZ05D?=
 =?utf-8?B?Z05yQ0ZNQUltQ2k4dkNieGdWOGxTUVpuV01nM1BuSDJqOU55Ly8wVExnY1RY?=
 =?utf-8?B?U2pTR2ZwNlUvY3JiaWhqQ2JvM3JmbjVQRVBWaE1oVnFla0I4aUZDR2owTkRT?=
 =?utf-8?B?RDc1RjRSM0tCblljc0dWWGZLZDdmTGZhdnJrNlRnNmg3OHMyMWw3azJ2UGd3?=
 =?utf-8?B?ZmlFNzQ2dmcxTmRNZktib0xyKzVNTGpxdFEvQ2pTV2dpb1JZY3B6V1gxSUpC?=
 =?utf-8?B?dGY4YXFUN2lhYU9HQlNUdU56RmxPckdMbkErdVlGM2NOQU5ENzVoQkdJdnU5?=
 =?utf-8?B?YjBwaFFzWC9uMjdIMDJxMG9IRWtlQnZTTi81cVVXTktLdWs2ck01QTlEV2NJ?=
 =?utf-8?B?YktjUkZVUVhuUzh4M1B3UnN2TXdaSWRQWGhSMXUxYlAxSE5JTysxOEF0RG5T?=
 =?utf-8?B?RmFTUDIzckZmSWZVZDR6QkJIeWVrSmZjQUJ0MWUvUXdDWXNaLzV0NStSQ2lZ?=
 =?utf-8?B?T2VRTkFiZHJyVVBWRkRYWkFIZGtFWjhDN1pTYkZBSnU3RFV2NW9hRmhtVWhE?=
 =?utf-8?B?QURMTmQrTlhvT25yenJnVzd5NGFyd0g0aVlPaWkramZ4SWxXTVcreUJxeDFa?=
 =?utf-8?B?YXMzUHF5RGNnSUZWbytvTnNKQVdYYU9MZE9aL0RrVXZ1ZFdPdVZSU002NUdm?=
 =?utf-8?B?NTFERVArQlJWdi84UnZseXNJd0ErYjh3YS94L0VXQlhIWnBZUzFPcmNNdmNt?=
 =?utf-8?B?WENWb2k5cnMvUmJmSVVzK0hUbDIvdm92c1BKTDFVa1liK3cwR0FIa0svRDI3?=
 =?utf-8?B?RXVOQ0p1Ri96S0c0VmcwWkRFRWJpVlRxM3pKdmVqWnNaK2hIOWViMjNDMjNq?=
 =?utf-8?B?dFVjWWhGd1RINklseDJMeTdFWlZMVHBHZlh3ZWE3RGk4VGZ4d256LzVzZnU1?=
 =?utf-8?Q?nT5xgS1qwj167mQLCHZhvX6bls006rhZf0?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2020 10:11:02.3475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-Network-Message-Id: 04820316-e231-4c6a-7da5-08d8a33d3964
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gpBOuBh3XOyXdhZkos3tuxfnQzwjC/oHnyDqzCOk+ZhrjR7qFJw7RG/DegQcs1qSNOmBjvYzNaOUzENYCYNToXP/sB2WnLjUDBQB/6bjwTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR1001MB1346
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This adds a reset-source RTC DT binding, as suggested by Alexandre,
and resends Uwe's patch making use of that property in pcf2127 driver
to avoid the driver exposing a watchdog that doesn't work (and
potentially shuffling the enumeration of the existing devices that do
work).

v3: elide the refactoring patch already in -next (5d78533a0c53 - rtc:
pcf2127: move watchdog initialisation to a separate function), make
sure to cc the DT binding list.

Applies on top of next-20201218.

Rasmus Villemoes (1):
  dt-bindings: rtc: add reset-source property

Uwe Kleine-König (1):
  rtc: pcf2127: only use watchdog when explicitly available

 Documentation/devicetree/bindings/rtc/rtc.yaml | 5 +++++
 drivers/rtc/rtc-pcf2127.c                      | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.23.0

