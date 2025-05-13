Return-Path: <linux-rtc+bounces-4093-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19539AB59AF
	for <lists+linux-rtc@lfdr.de>; Tue, 13 May 2025 18:21:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43E5F7AD277
	for <lists+linux-rtc@lfdr.de>; Tue, 13 May 2025 16:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D56D2BF980;
	Tue, 13 May 2025 16:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="esmrRlkK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2043.outbound.protection.outlook.com [40.107.21.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421C32BF96B;
	Tue, 13 May 2025 16:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747153214; cv=fail; b=fa8jX8XMsNqwIdbixENYQ6/h9lOx2GBjZpwnnV8Xas+sRqCAEvuo4gN1z1/yzypuj33UuNJkll1VWmpGxrAPf25YcIMN9cGv3Y5TjX0jqwFy+gz4zL92j58tlCJFKeiDUISDV+BW1apafl1HXcZpvoIL5uZlx1ghN4w6i5YNIfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747153214; c=relaxed/simple;
	bh=MF7FFIm1Lbx0pc7Wct9jDbezLvjWhTAk8b+TL8tAnkw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D/UrciToJyB706xf3ZdTtWa7KjW8jTLeKWv7EDwrBLG0lCZYfBmBTZ32q0aqqfNbopMLjTMepBq/L+Vu5PznDtpKFplj3nO8qLJ1t3+iOkG8yv1DZ53980h+Ljw6ElXjK2GCCySHBtbXnan9CXyjIxhHl5NKrOWaEQ5A7BbZhFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=esmrRlkK; arc=fail smtp.client-ip=40.107.21.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qigDG7m4OBG7DbSv/yMSr0dvppsMS6UTo4KyrtuVTDbAxi06x1iFTWIPEFfeY/9+WZVqHx6F44sFbcka/HiSkrg1vMaFHcbF8aOwVjR7KCb+GvJjYortIxsgALow9lwCblZqIyG8oxoI1iOJg7zVxt//xIEpYHH6VPQpLdmFD/0jFTvuHyai43CX2/t8YhbncrqWkJcxtTjmbSadrDW0+fzBQK0v8Jn6HDf5y5M5E3kMEfA5Y6C2wqChi7L5y+D39Q58lr4WPqzwgvKI+t2YOgMGw4K8ps5ma6Rbb9EHz8h1cfN6hQdMIUruU2kd363iv2MSg9omN9TgZculcXjspw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+KJS/MInhvMq1OZEUCZ5P9nuG/g89xibJayd5dh3lrU=;
 b=y6pQ53mt8s98Myu+LthOP/0kh4jY8Sa3ou46scnVXYJchUK59ntLsNLrhg4ak1tJIXJaQhuylvPbQ6q37j7T64AZ5jCckBUqzJC2XFIffEKjcG2g5tiw/j1r127CpV55SbODP4VDb4E2FYyLhOmZWlqmPcf9LUqDedQ/xa6OgEiZibYD4PloSi0FAxMV7MU/BY4LMqJWxWNzqr+euiY8xGac9WVNSr0kFH3Yz1z7uyJY3f2dlNUi8Vs20+lFuWDItOksZdzaZSstl4hMoBsgYy+WcEOmkzTasIfcWdvQclanH4HUbMCebNEbfiowzkwVERm7BB0/aoqLKfT3RmL00w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KJS/MInhvMq1OZEUCZ5P9nuG/g89xibJayd5dh3lrU=;
 b=esmrRlkKLAFNgOxWKCkmLfaRmgmZcJKSzKe4daskvHrzaE+WOWg6EnVDpngb8s+m3ws6nbEkDtRYvegY2CRkKli0uVfURlpjynAjSE29uBH/kprgt+kFQFW0YJjB7Sg+SIV1LPRXqQzfhEEEHV2rizk7mDFfJIh2CuI2Rsod1JLz0+NzXnU2JE8yi0Dx9IfafI1gED1C6F6CzMZR9qzIO4+3AwWH6hYtBfVbfQuFjyz07zhEdXOujlvrnzd7jSk8mydOcp+2R24xCXPv2P2ojXJG7jqbtbDjFZAYOs9rYrXucOH8LYhxk+tpzysUs2UCBznHyHaAxz0E3J2zD1hKyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com (2603:10a6:6:36::19) by
 AM9PR03MB6724.eurprd03.prod.outlook.com (2603:10a6:20b:280::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 16:20:09 +0000
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b]) by DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b%4]) with mapi id 15.20.8678.033; Tue, 13 May 2025
 16:20:09 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manuel Traut <manuel.traut@mt.com>,
	Marek Vasut <marex@denx.de>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Markus Burri <markus.burri@bbv.ch>
Subject: [PATCH v3 4/7] rtc-rv8803: extend sysfs to trigger internal ts-event
Date: Tue, 13 May 2025 18:19:19 +0200
Message-Id: <20250513161922.4064-5-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250513161922.4064-1-markus.burri@mt.com>
References: <20250513161922.4064-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI0P293CA0005.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::19) To DB6PR03MB3062.eurprd03.prod.outlook.com
 (2603:10a6:6:36::19)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB6PR03MB3062:EE_|AM9PR03MB6724:EE_
X-MS-Office365-Filtering-Correlation-Id: 0afa3faf-c1f4-4f6c-3e85-08dd923a078b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tB4vESeziYA/noPsW6LbR1qnV1H6MiJbraz3MrebXiEryB2c9p6Z+KB57pMk?=
 =?us-ascii?Q?rppoihOSOcPZIxgJxfFkzb/0DiKHUvUvyD4jAwqAaeqiqYuT3efu4FxiFfxM?=
 =?us-ascii?Q?+15/OcLW+oeAo8LEaz5oaNJd+47gjUnufCpNV3NMkcRgZ1R2npv2rZikBwAv?=
 =?us-ascii?Q?USECzMJgSUUt2WUWV2xqt1Bh4BOw9SK3o0ZltIbV+8O1Lw2/5oj/Zbb3IDiB?=
 =?us-ascii?Q?K0Wkud8TrLEpmQmnVkLnoNAFqeECgcE5kob2bomaIHpx3BRJsxPb6wEieKsm?=
 =?us-ascii?Q?k6ryENDmixGbc7xCC90OfidZZkeJeeNDI5ZQk+BA/glZ68/AGBy9bBVXNPRJ?=
 =?us-ascii?Q?e3OVh+FXQyUOoQC64t3k5igAJpGi+8r1yBOQdrQr0pJRk9GjnMgJGEDHPzRv?=
 =?us-ascii?Q?ejulmEhzZkacdyZR4Osj12g0ysSMCn0zA62HO7B1NMOCtYC0NmygosxS50kE?=
 =?us-ascii?Q?gChe+Jx3dYkqjXUtf/zLInE+c6fA31L4e7KbtDFC3RgUNghvNG24rCjy44h/?=
 =?us-ascii?Q?AOE2i4PSSfbTF+3RpoTZew/wJYXrtL331VbAny2AoANZ4fbVDvY86G7pAkSe?=
 =?us-ascii?Q?SXR7Mz59gKZQ/hgsnlddyyYNS3th2e5+2ezj9w8SC2ULpD2D63Ay02hhoRz7?=
 =?us-ascii?Q?q7xb+wOrnLl50SguqWhBPQNN+jJzHgpgNO7Zx+zziGfBJzd7g+5c79/xsKYZ?=
 =?us-ascii?Q?GvT6hAFxssKFoAzFJ+SpRRJ3MUB7erkz7YSqhr4b1yJ2AYNV2KHLOKRyaGUJ?=
 =?us-ascii?Q?s/QT8uoNgiomQZYSNHLR7lsmK+uGaPQ9x4IcyYTc4/TNmNFed2DVLZtfko3I?=
 =?us-ascii?Q?Yg7ITaVOVZjtoBoOTxR61tRmcH5d12XS9K7EcPq/fS/B/zKZw1NcEaQre0Op?=
 =?us-ascii?Q?F3x9jNTekmCN8Yl4N9ONYxNG7i8mbrUI6ztDxlOHY6PQ9ZPUe8FdH6SmPsyz?=
 =?us-ascii?Q?t2g+EQ8d8qs8Gchq6aoip152pbS/soFVb3+c2OWkwlvjF6h8f9JRNE2LFVPO?=
 =?us-ascii?Q?PwOZcNmh+EGDLsoNKUgWcHq3KDQZod1tzZ1iVpHv+635pLlOf8ZlT6AIoLvI?=
 =?us-ascii?Q?T/k3RBzRUvoH0OhfwPxiLWyDnUTYsf4eJf1/N0ycVI7exfoTVYsRToB6TIpC?=
 =?us-ascii?Q?RYqh06DjqRpZV5mKrp1KtRrlyFmqCXghC7NUMqm/ezrKhHAcHzt0WhtebEz6?=
 =?us-ascii?Q?aBjlavs0H/ml7NxjlO9kjXyK4fPgN4AkojFYVDwKt6bEoSbaQqB8LDWRfAso?=
 =?us-ascii?Q?vQHihtqTVz9rOWezBLCawwaXLh/ER6GGw86G6arOVIG/rsXqvoqrcml/9R9w?=
 =?us-ascii?Q?SEzL3zGzs3k/2yk98fltcgrtkESaKtMOHLU4I7+zYc5pAmPQRTOwcVSBIvNu?=
 =?us-ascii?Q?D4DdRyjbDOAZjcXpFCfyhHbRBJ5F9F07C5vGaWh0LYVcRS3YspS4Js5yMXXB?=
 =?us-ascii?Q?FIHRBEXY3QDxfx7P8AAxygDM6O+IF7xC2tQskwR9Bd/NPtlZF/4AMw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3062.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lM+EKZDKm9AIazhQwk0pkgCp1oDGTWG5vYF++C0wN4y3OmyzMD3XPRXpprl2?=
 =?us-ascii?Q?5VSWY2picQeJgYep2i+6nxryxiEbIfpx7ZAdjGiUPEs2Im+7I5qx22+zjKkD?=
 =?us-ascii?Q?8kdM+VoJZOfLNgHTsqy+4Cy0aTfRiM+xRQ4ZrK/IfMpWbmbUgl6PdGR8Iawj?=
 =?us-ascii?Q?dF3Z42Y0gXPyjhYA04FB+csOW76oWrADX/5BCEKN+k0/DRuodTSEl8AEE4a0?=
 =?us-ascii?Q?d/2jhxse4rKoKyORYkj75rQKx6sTO8GECvjXATsUs9HI5gdG2eBJE8qGA9DA?=
 =?us-ascii?Q?WO8tuQloL/lTIpwk1RB94QupkM3vIJRYAkM3+WjRaE8fs67pAVQDBywcFIRw?=
 =?us-ascii?Q?3EesguIR1pDu9Oj6MUJVCvMwcemXgNGEVdycQ0y4foxHNjgSawdBQPfQxt/T?=
 =?us-ascii?Q?YsIDbRASfW2NxxrEuUH8WQB8QeGtMpLDwqQ/AmQbKG2gTHrYIVggy9LW3oIW?=
 =?us-ascii?Q?/Mu6sxfcqhXVRdC8rK52aNgtt79db+4nvzWZnuQTJv6nWe93np4G6WGvBGvT?=
 =?us-ascii?Q?Y98fO24DgHQ5BkRdAiRxMPRG0NihbAEAT45+UwhtyZ8DB9Kjxi9w3LdpWzmL?=
 =?us-ascii?Q?0S+EqdwhVCdYZiDhPI0OJ5QAemlyxF5VVNtt4f2k/unUj4NYD3kqBBDOydhf?=
 =?us-ascii?Q?bJArJ4Pi9DtRZoHWWLaY/QzI7hOkS8KCpjHLr6zNEgw0yPnyjWbjZyizON4F?=
 =?us-ascii?Q?ifPAoi7mmbvQAWq7ETjP7AMUJ4GiuxwteGuv1AvUmIIVVuCKZxYB/q1VK2U6?=
 =?us-ascii?Q?7YBL/fEwcHNB2fbxvG+WEfPEPfZ8nG4lXP7Yegcxi8Wi3HfJQPREN814Nx3q?=
 =?us-ascii?Q?3XETfRLhh8sx8S+lK6XArgCEbDFnqHwc4r5wNN3eavJauryU9np+b1/aKIFk?=
 =?us-ascii?Q?1qWFYGBfN+FzQMwUZzN5jYFqTiu55iP4iQvKv2P/Sw9tbBN8ApbjHhSVzPsk?=
 =?us-ascii?Q?df/OMYS6NLW7XXmTHstU0JWwiZbnlAXztZ8t7CLVEIr2YZ6MK9TGDwhyK9Fa?=
 =?us-ascii?Q?xbdK5JhQ143swDNkErPW8iC32POMTaEZC20LlKT5ZVkpRM/K2yIVKKVasfpo?=
 =?us-ascii?Q?PPg1+dCZBqVTpdPgfvDgFDO9s0ON4ZdDfE2YEms4OMRb0b+wcaRW9Akl3ij5?=
 =?us-ascii?Q?S24pkGtMUc3tBM0fY/OtK5jAIMOmNoTcUsOUnXemUkeDIVJ2cZXThgUIKmQn?=
 =?us-ascii?Q?UD1rL83u6G9nDSW3fIhJmsnj5xbRG6TWaCRRZqe2rg4Nc7V3NTpW58xhJrIF?=
 =?us-ascii?Q?VM8xsxwLoMQ/yPf8w7P67c8BjfzH461rEnWhTssB/VlJvTXHdvarCWc1I61b?=
 =?us-ascii?Q?p2jBOJUETD61CSDpKj7XjgzNiUMk3dnkSBS1Dc5/s3mdO3tN+nYLmhwrTbDB?=
 =?us-ascii?Q?EgVfWpl7K9j9XeVhRa0h1VgP3oF6V60byOKk6WyY6CfGam/N6Ecc7znZmPIO?=
 =?us-ascii?Q?5Iu1e08r/AHZ/WmwxVWGMM3fg27GvIb/KmxuWF68MCf0FN3RIJZDRNKlc6gs?=
 =?us-ascii?Q?gWCrye2sTFjogNaA3F9VX7D6EA8GudBjrFGJIm8Adu2CEivW8MfpiOE0yJE6?=
 =?us-ascii?Q?GdrhA5U++5hQMf6GXsJCU/1Uom6QdlFRuv0cNj+K?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0afa3faf-c1f4-4f6c-3e85-08dd923a078b
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3062.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 16:20:08.9941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6gVvGkNDMiKYycIZFDjHNvFO3fsT3zJuUaqLxzBSZEFdsWzbOJLCnr3A6v+wjYsYRetY0sRsyAVzgn4M567qaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6724

Extend sysfs to trigger an internal time-stamp event.

The trigger function can be used from an application to trigger an
internal time-stamp event.

Signed-off-by: Markus Burri <markus.burri@mt.com>
Reviewed-by: Manuel Traut <manuel.traut@mt.com>
---
 .../ABI/testing/sysfs-class-rtc-tamper        |  7 ++++
 drivers/rtc/rtc-rv8803.c                      | 33 +++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-rtc-tamper b/Documentation/ABI/testing/sysfs-class-rtc-tamper
index f035d0fa5fde..2fd6578a6bd9 100644
--- a/Documentation/ABI/testing/sysfs-class-rtc-tamper
+++ b/Documentation/ABI/testing/sysfs-class-rtc-tamper
@@ -18,4 +18,11 @@ Description:	(RO) Attribute to read the stored timestamps form buffer FIFO.
 		- "1234.567 EVIN1=1" for a trigger from EVIN1 changed from low to high
 		- "1234.567 EVIN1=0 EVIN2=1 for a simultaneous trigger of EVIN1 changed to low and
 		  EVIN2 changed to high.
+		- "1234.567 CMD=0" for a internal trigger
 
+What:		/sys/class/rtc/rtcX/tamper/trigger
+Date:		January 2025
+KernelVersion:	6.13
+Contact:	Markus Burri <markus.burri@mt.com>
+Description:	(WO) Attribute to trigger an internal timestamp event
+		Write a '1' to trigger an internal event and store a timestamp.
diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index ef2231e5abc9..8f9bcce6351c 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -904,12 +904,45 @@ static ssize_t read_show(struct device *dev, struct device_attribute *attr, char
 	return offset;
 }
 
+static ssize_t trigger_store(struct device *dev, struct device_attribute *attr, const char *buf,
+			     size_t count)
+{
+	struct rv8803_data *rv8803 = dev_get_drvdata(dev->parent);
+	struct i2c_client *client = rv8803->client;
+	int ret;
+	unsigned long tmo;
+
+	guard(mutex)(&rv8803->flags_lock);
+
+	/* CMDTRGEN */
+	ret = rv8803_write_reg(client, RX8901_WRCMD_CFG, BIT(0));
+	if (ret < 0)
+		return ret;
+	ret = rv8803_write_reg(client, RX8901_WRCMD_TRG, 0xFF);
+	if (ret < 0)
+		return ret;
+
+	tmo = jiffies + msecs_to_jiffies(100); /* timeout 100ms */
+	do {
+		usleep_range(10, 2000);
+		ret = rv8803_read_reg(client, RX8901_WRCMD_TRG);
+		if (ret < 0)
+			return ret;
+		if (time_after(jiffies, tmo))
+			return -EBUSY;
+	} while (ret);
+
+	return count;
+}
+
 static DEVICE_ATTR_WO(enable);
 static DEVICE_ATTR_ADMIN_RO(read);
+static DEVICE_ATTR_WO(trigger);
 
 static struct attribute *rv8803_rtc_event_attrs[] = {
 	&dev_attr_enable.attr,
 	&dev_attr_read.attr,
+	&dev_attr_trigger.attr,
 	NULL
 };
 
-- 
2.39.5


