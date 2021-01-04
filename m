Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4F612E9AED
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Jan 2021 17:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725840AbhADQUw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 4 Jan 2021 11:20:52 -0500
Received: from mail-vi1eur05on2064.outbound.protection.outlook.com ([40.107.21.64]:38657
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726098AbhADQUv (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 4 Jan 2021 11:20:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UtjnPnSy57SO49SY3Ksh6DqMflK9bE9nzrO4Edq4i5bV1OPQuD6YS+RoZgOoUzs3/v807h8yEqeArJF0db0kFZJ5UqV+dSKsz23R8FpBJIb4dTuS5GFZrYhf4nIL4JRVPKBTR/VwVeEUN5ZTA83/FXd9fi4PfEZ9hiRB8d5vb0h3a9uE6lPNfxThb5gGeLB1VQKc1ElvdV9qfKG/yUOEXVwHfcWtt5IBrU+B0yJFIao+ZmlzKgn5HbEZup+9byNlLfhHdfpgg+bgSb+N6vK5P+xZ6ya5NcMXtA2l5ChU8yY8NVdWuIvTsqeM40E97TI/iggC0Yh5QX/h2Og2GoP3aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9oKSplhw62JaAemgzdVcMRiXqtMLMVy9EgGQVhFpb2U=;
 b=e9rGAfxrojiLZeM4Zlln2dOzFnmnk6FuTZIiz/jAjl2zEfNKIVKzZrk7wDJnEWb3fKg4UErw0x0w+N9Y9TgS/gQt8HvTmb6HoJg40RvwIROotmP8wfngC+D5uvyEJUpztr54POf+7xPt73myRLcgViSl5Q9y8TRu2eUWtRyilMW3ZF92cKGNvqfG8Luol8to6B37jgaQlmGeM4F0ufM0m0c57DMxbt7lgsxr7qyuraT+hCaOfy97YuUEZcHEbp7Snhrjrra+5lCD72OH/5KnF0CLdoe17+1GStH0hsfCqHCnBhqLWppps+W+bVPriZ5xYESh+nU4774qALqTmQf7ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kunbusgmbh.onmicrosoft.com; s=selector2-kunbusgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9oKSplhw62JaAemgzdVcMRiXqtMLMVy9EgGQVhFpb2U=;
 b=fwsLVeWXl4qSOfL33xC1fjj/GtNadjv5KB59WkPs5yRic6WhIAMjwyKCcKyMgpPKA8MO+yqPljOKP/ecIDmVLvqBFOPEGjfR84BIlC2F5PIs3QSf3tdNVT05AgY0U0ErtXRJ2RWpz1u1prsrU2VuqwNvo+HL0p4Lrrh9LbUF5QI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=kunbus.com;
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1fd::8)
 by AM8P193MB1185.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:36a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Mon, 4 Jan
 2021 16:20:03 +0000
Received: from AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8]) by AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 ([fe80::70fd:5050:f682:bb8%7]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 16:20:03 +0000
From:   Philipp Rosenberger <p.rosenberger@kunbus.com>
To:     linux-rtc@vger.kernel.org
Cc:     p.rosenberger@kunbus.com, dan.carpenter@oracle.com,
        u.kleine-koenig@pengutronix.de, biwen.li@nxp.com, lvb@xiphos.com,
        bruno.thomsen@gmail.com, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] rtc: pcf2127: Disable Power-On Reset Override
Date:   Mon,  4 Jan 2021 17:19:09 +0100
Message-Id: <20210104161910.9144-2-p.rosenberger@kunbus.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210104161910.9144-1-p.rosenberger@kunbus.com>
References: <20210104161910.9144-1-p.rosenberger@kunbus.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [87.130.101.138]
X-ClientProxiedBy: AM4PR0101CA0078.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::46) To AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fd::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kun-nb-112.kunbus.com (87.130.101.138) by AM4PR0101CA0078.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19 via Frontend Transport; Mon, 4 Jan 2021 16:20:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6364896b-c24e-4a2f-ae12-08d8b0cc9761
X-MS-TrafficTypeDiagnostic: AM8P193MB1185:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM8P193MB1185CC4E177195E87187D7519FD20@AM8P193MB1185.EURP193.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zDIeJJPF7dAreYcd+qchayXvamcYYCv+LfuiDkEF8Uf8FsTP3S9wIZJZbEvg6A0bWevRxPch4RBOAPcxZ8f/t8ytqKneOx6FyWJ7EBCMIXl+/PQ6UtjBpFBIkiJ12bzgRFs5Y4324WOH0+1Gd1ufsWpNcPhfa3iGNOY/MuyzOh2PSyAerQYsi+ejcUhXjcWW+FjJ5UkgR6SqKnQ79MpEIEX3RQq/27hb9IkE6sSsWs4/7+nisKJnZpByARqCPUYWsXBwmXO7nY0i/fPfCBaek/tWAIIXWgCEUH/anREnSGIBftIEaZmd9F1C0FCXJdBXuVieJ6yNMEsYnbTAT4/Ct9l0HD6iHjjCt6phT3uNkH6ajWaWie0davmlcOaVGsbtyazDlcDwKEoqskzZnthRFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P193MB0968.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(366004)(396003)(136003)(376002)(346002)(956004)(2616005)(54906003)(66556008)(66476007)(26005)(316002)(16526019)(478600001)(6916009)(6486002)(8676002)(4326008)(186003)(8936002)(1076003)(5660300002)(7696005)(2906002)(83380400001)(66946007)(52116002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?IzMTXnR429LkC5qYffxcHuUUORsj3+foTnhgSzBf5WE+d4DZsnzmRpdaMZkL?=
 =?us-ascii?Q?KK4Krqq5lfGcAwT1fHU76GwtTNIgTjCqKLk48facunqW8ID3WRB2PMIdnMyI?=
 =?us-ascii?Q?pqR/C4Y2MjaKPfYvM6fnBVqGc5JYdoqhgCN0whmk1yxdVTh8ioUZC5VTymsf?=
 =?us-ascii?Q?vFOT8+0ELz3OHI51gYQRviK7e/AvG6kYUe4myL+Y9NVoEQ1rQ/8odtNtDNrs?=
 =?us-ascii?Q?VoZjHLg0WFQ/qlenim0aDd4S622ZK4LBBZDBwhhYUN1lrGx1lI8d5BQM0vwu?=
 =?us-ascii?Q?0+ih4Y63UCc+l2W6twUAlzXjuF4zth5dYm4VOTpH5kTnX9F1RRJhx6w/Defr?=
 =?us-ascii?Q?3D141BMMhGxtdDESLQPqf6xUpnUzd+VFXZPlobRy7k/j8wKYn1jd66UJ+RJk?=
 =?us-ascii?Q?gNaSAIUaK3mP4xXWRp9c43KrtDBuoEj0zDjHA7v2UPRV1/U2y3i44svAPHTQ?=
 =?us-ascii?Q?vQ5Ac5pdhdL08gKlJQN3nbOSlfHU8bgYPBcpG3u3sPrelbH3py7sofxni/Ni?=
 =?us-ascii?Q?bsiezCBDZmdEjwee0VjE4HYqCx+OFtEzFTvR19wOhmJSk3XYlwfjfvduy7AD?=
 =?us-ascii?Q?/LlErNMoi4QOeTjpCV8alU+6MtRoBhREtBwgfX65Qar0iIPAG+OEo+W1Fs0X?=
 =?us-ascii?Q?tz2CZQsufbYChZHfvBZdBeQ1ls7HZu0gvIo5hI3kvmQp97bGkfCAfMb/Fb3D?=
 =?us-ascii?Q?ArcskXvHEY7Mi7+/kihNq0MzjGR3YtVmPVin1h+LBuejzs/bRsT4Kr7+kLxD?=
 =?us-ascii?Q?0alHftuJx3+qW2QimIjZGqVZ3DZs0QnSOuApnz9g54FLhkUsFAaJIwwLFMZ5?=
 =?us-ascii?Q?qIaAUE0pByPEOXTk4EnN7bufBin+w0y6ZmrzKNhzoTWD9f9QjT9DSQkQq+H9?=
 =?us-ascii?Q?HKe6Ubc3/Ss2i3bfhKPWH1ri4ubKM05y4XbsQfzDFxEz20dh7dfsBTyrQpjr?=
 =?us-ascii?Q?znuMLvGRBNYYzs1TS6v45wSni1hWOmDtvLa/DSJio1Vg4oIGk1NrH53aHjXq?=
 =?us-ascii?Q?ifdy?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB0968.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 16:20:03.1796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-Network-Message-Id: 6364896b-c24e-4a2f-ae12-08d8b0cc9761
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aqzTq8iCde5ipQ0FkqAulFqh9NVmG/RWasB+VGDJI3vvXoIGzYWKDuO2vGZB/4m3Vlj3/gJqXyPKq3m2HBD08n0JXYrpUkaaWgd/Bl0YOBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P193MB1185
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

If the PCF2127/2129 has lost all power and is then powered again it goes
into "Power-On Reset Override" mode. In this mode the RTC seems to work
fine. Also the watchdog can be configured. The watchdog timer counts as
expected and the WDTF (watchdog timer flag) gets set. But no interrupt
is generated on the INT pin. The same applies to the alarm function.

The POR_OVRD bit on the Control_1 register must be cleared first. In
some cases the bootloader or firmware might have done this already. But
we clear the bit nevertheless to guarantee correct behavior the
watchdog and alarm function.

Signed-off-by: Philipp Rosenberger <p.rosenberger@kunbus.com>
---
 drivers/rtc/rtc-pcf2127.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 39a7b5116aa4..39c28bac4d1a 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -612,6 +612,19 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 		ret = devm_rtc_nvmem_register(pcf2127->rtc, &nvmem_cfg);
 	}
 
+	/*
+	 * Disable the Power-On Reset Override facility to start normal
+	 * operation. If the operation should fail, just move on. The RTC should
+	 * work fine, but functions like watchdog and alarm interrupts might
+	 * not work.
+	 */
+	ret = regmap_clear_bits(pcf2127->regmap, PCF2127_REG_CTRL1,
+				PCF2127_BIT_CTRL1_POR_OVRD);
+	if (ret) {
+		dev_err(dev, "%s: can't disable PORO (ctrl1).\n", __func__);
+		dev_warn(dev, "Watchdog and alarm functions might not work properly\n");
+	}
+
 	/*
 	 * Watchdog timer enabled and reset pin /RST activated when timed out.
 	 * Select 1Hz clock source for watchdog timer.
-- 
2.29.2

