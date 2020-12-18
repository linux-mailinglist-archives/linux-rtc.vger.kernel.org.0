Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 673C42DE0C1
	for <lists+linux-rtc@lfdr.de>; Fri, 18 Dec 2020 11:12:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732951AbgLRKLx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 18 Dec 2020 05:11:53 -0500
Received: from mail-vi1eur05on2127.outbound.protection.outlook.com ([40.107.21.127]:55858
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726798AbgLRKLw (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 18 Dec 2020 05:11:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IerM9axUCvUevXbtYYPWSb6+GLKPXjJVABzKDQg2BnpU8JRUz5YALUvYnZTuvOLow74O2SK1iyWUCgta4tUexI7+nzUEDICqUl+20+eksbyuSoQ1eDoVDcuK4AdYGk951AIrNh8HUBF3vK9GqzbVzKmSc94FofWKQCAFO9YgR4pbXDfD/cYywGWgH/rm+nxT7oSZKuDTcddtkTkljRzErMMVTOSRXDXnDQFzlYVBtJHvpoZ4TmR5ry4FPBGwQ1bajPprXoGRScWTrrNKLU+Ws9DXHehW3RMyw6vTyMfmUnUjwP2uV9QB+gB0gSX6mdFUmf6Wjjd8Yleu2ix733ykBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgEOJG5SCzA8zVaaRe2Fkjm5PIdVV07oafGjgsiuvNQ=;
 b=ahXofLpyI0zJgmj+4zRaatePp8lw3OGz9XZ/K+n0Butv9A5cQcdtjKIo/DYfKhLXqKENq0t6tmABz3d1rIKCyScbGVHdHXcsdpVdp9PAiKnz8VTnyb6hrDJ+uV7hRbT/8sku2NDUID4atf+PX02Ho8aworxp3yJgjny9fAmmGntkntS9vCH/RAh5NerkSbKt9p/GvLj10SI8GrGZjompps459P7rbORavOr6VBX728wfrbCwVVTq2oMkJQ3HQQsMUzQM2Ozx18Uh8CsvRqbI+tAlBiffo6BrYuPWm0z8k6licu32C2GGBsiQhNQM2bHoFtnH8p0HZv4iLbcPsV2uIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgEOJG5SCzA8zVaaRe2Fkjm5PIdVV07oafGjgsiuvNQ=;
 b=jJfka1gSmSHKXVdc4wfvTr1Buv06BI5FwQWQlSkpZTy0FJQ1+1+5BbpAh3Oyvt3sjYGQ6AG+w9SzqV8K7xQtBmEx4tnFilIG9w9htQGLJ/lGJ9+nwkc4kOBQyEr+JTx8+8AP0eNr1vn3PZxP+Fjbny3+g7X4rOJ24XtV2H8AArk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM4PR1001MB1346.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:200:99::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Fri, 18 Dec
 2020 10:11:03 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3%6]) with mapi id 15.20.3654.025; Fri, 18 Dec 2020
 10:11:03 +0000
From:   Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To:     linux-rtc@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Qiang Zhao <qiang.zhao@nxp.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH v3 1/2] dt-bindings: rtc: add reset-source property
Date:   Fri, 18 Dec 2020 11:10:53 +0100
Message-Id: <20201218101054.25416-2-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201218101054.25416-1-rasmus.villemoes@prevas.dk>
References: <20201211215611.24392-1-rasmus.villemoes@prevas.dk>
 <20201218101054.25416-1-rasmus.villemoes@prevas.dk>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [5.186.115.188]
X-ClientProxiedBy: AM6PR02CA0007.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::20) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prevas-ravi.prevas.se (5.186.115.188) by AM6PR02CA0007.eurprd02.prod.outlook.com (2603:10a6:20b:6e::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.28 via Frontend Transport; Fri, 18 Dec 2020 10:11:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcbe1c04-10d0-495e-2d36-08d8a33d39c5
X-MS-TrafficTypeDiagnostic: AM4PR1001MB1346:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM4PR1001MB1346FCE95C9C9B8CFFAF583693C30@AM4PR1001MB1346.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rd+MWdAtS5Y0m0k29AdcuH/YJHxQekfK+Bq9AUx0cIHKVx0ncTfY2+5wxVQ3LX0Qu4m4M1SpxfNJa/F2QXofV4SMpU8G6Y/v1KHRXoLyQsYTViteNY0u08sUJNZIlFbdQ7hdRUjfxDe0mKhMH3sAE7/lSxsa9M4ea3c1ESORe52K7zK4pGXqNX/1vLmuNjPS3dMd6+uFh7vzc9lZsBYG40Puo9fpzWlzhbARWm17eC89amg9gBWp9iFiAd2ICkhOr+cVAMJ16lw7cLD1FnPw+syyMZ/nxH8r5vZoTV1U2yW/3J+WgwVXw3VJDX2h2D8+sLnW2ltxyLZO/OYY2GePTdKUU2aKK6/qKBML6UVn5da5NZ1RUJp+ecbw1t3TCkyabBUFnycQ0QgrFCneswimGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(136003)(39840400004)(396003)(366004)(346002)(376002)(5660300002)(1076003)(956004)(86362001)(44832011)(2616005)(6506007)(8936002)(478600001)(16526019)(66556008)(66946007)(52116002)(6666004)(107886003)(4326008)(6916009)(6486002)(186003)(26005)(36756003)(66476007)(6512007)(54906003)(8676002)(2906002)(8976002)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?NhCe8hGfHKJmGEHWRij43/bwJb0cH/IBWUy30wAiG6A69PB6wY05kIP3tXVu?=
 =?us-ascii?Q?pK58ZUqRy+Hcz0DLHSxIIgnW/EA9gd+MyZq8YKN+a1PbYbtEwT79LqLNS3GA?=
 =?us-ascii?Q?qxH42ng7IVzbJ9daSxgPphKJGrMWkiDApl47nmvMljYohjPo2ntSKVXp3ss3?=
 =?us-ascii?Q?r+1TkvBd4CZHW+7ZdSkcP33JxSSWR0l5zzTbKOcXELvZQPU0l6UDBCAOOSTR?=
 =?us-ascii?Q?I8DEU8XtEoGSy0vEUwNsVPNOywv3wPQ4WMQw0THSu/oK5BQbgCIrsDdkCXGz?=
 =?us-ascii?Q?XYaVi3v+XzML5e7LLjVAyN+6ZfHe2HOZ4g/YYixjRk7XkxSm3cMxSv9ke/Xz?=
 =?us-ascii?Q?rHz+dWbRS3hsCYtGNMRe9vzJDlUcXmhjv8kva6bcQZfFy4P1i6MsXgRA0wrR?=
 =?us-ascii?Q?GiRxU07YH7tjj/BgaG267Ro2j2KWah5Y8taK1YoOdW2w9CqWzQl0KJVrK8Y3?=
 =?us-ascii?Q?YgECx+QTtvO/jjyQSG1jrCZAc2h6tqpx8tQIpJEeR6koP1ruhsciEsDeMfXx?=
 =?us-ascii?Q?cg7PkBkkoeodP6P5DsBRfh4I8u4TkN+QXQ/J5EDP5rvyiPCjJc2cbDwD709g?=
 =?us-ascii?Q?nGWGbFdMRNtCu+doVLAwUmS9QSGhP+qWml6lCuJ3pOdvftjEkQXOtDWjkkYx?=
 =?us-ascii?Q?Nt9ha22w6izT8zoNpVW7p7ja55BdemNWUkEt/fn3wymjpHXhjwcY86e6vrUo?=
 =?us-ascii?Q?tePFrpFLc21+XLcqY3dVSvp1dSRRQMNxGvnyQUnJy+E4FG6NtK5Z7F9NzKGf?=
 =?us-ascii?Q?78UULgadc8TNmb/QjHqnpadxgIbkFs8t0Fe3ISJbt3EwKzzy7eMbL7v4eJXX?=
 =?us-ascii?Q?523tnNTZ7DIUJpr6S1b8lgrxJmgHPcTf6oWZaAYklReJld+z9MlIHtZSiWW1?=
 =?us-ascii?Q?xiIboyMVUmGaFxISexwSI4fGjfakm8Pe98P+X7biyKUBsHYx0T0C9xv2OHpY?=
 =?us-ascii?Q?LTvbuqmEnG8sd3X4qPtMuEfztieb+bXUerEzNL0sqn0PxjbKS5CxytnQWfLY?=
 =?us-ascii?Q?0cxx?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2020 10:11:02.9741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-Network-Message-Id: bcbe1c04-10d0-495e-2d36-08d8a33d39c5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AmnCeMHyCdeJbyZ/Unh8/q+WcoLx6d9JD6hI9x95D7IuSClaqsVHE1pIHYz0d6LzxYbDc8iwr9iVc8+hBObxX/BsMd2EE15oBm+vj5f/ciA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR1001MB1346
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Some RTCs, e.g. the pcf2127, can be used as a hardware watchdog. But
if the reset pin is not actually wired up, the driver exposes a
watchdog device that doesn't actually work.

Provide a standard binding that can be used to indicate that a given
RTC can perform a reset of the machine, similar to wakeup-source.

Suggested-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 Documentation/devicetree/bindings/rtc/rtc.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/rtc.yaml b/Documentation/devicetree/bindings/rtc/rtc.yaml
index 8acd2de3de3a..d30dc045aac6 100644
--- a/Documentation/devicetree/bindings/rtc/rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/rtc.yaml
@@ -63,6 +63,11 @@ properties:
     description:
       Enables wake up of host system on alarm.
 
+  reset-source:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The RTC is able to reset the machine.
+
 additionalProperties: true
 
 ...
-- 
2.23.0

