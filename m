Return-Path: <linux-rtc+bounces-2566-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFC89CF53D
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Nov 2024 20:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2493E281081
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Nov 2024 19:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567461E103B;
	Fri, 15 Nov 2024 19:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TJ3HwOcK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2051.outbound.protection.outlook.com [40.107.20.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E7B1E0B72;
	Fri, 15 Nov 2024 19:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731700156; cv=fail; b=iGb9HXczgYeh5q0438g0rP3Rf2rAUvG+/58EXjcrzql611A9aHNGyMxJ75AZ2W1D82nB9aqz8G0BYJMg8wyaYkOtHo+o9u9NRvthW+GDkzaObjawMVLrURVLCCMQd4603wjhQVARCYtEML4Fb17tpqIALuWuHST5lIHmotUHfUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731700156; c=relaxed/simple;
	bh=yqs+oudmGuWlQexjl09Fog3qLnLFXDDEfs4QbONp8F0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=FpFJUqzUBOKelE2LdlJ2wjeiSOZcnCu0mU/Y1hG6pW8ZkHlOD0AGjKTkk/hz+33WbOuMlOdRnFbI/jCLEZEVoLdcxTOeWyUnR8nWJpfe4TDXn+jDXiY9QHfsBHEJK21xvuQExew8h+nW0JXSd2Ojeqy1nYmbZ2z3nR+nEhaLDvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TJ3HwOcK; arc=fail smtp.client-ip=40.107.20.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QbMzSS3F0t2BoMiRvc18v8aKFo8Vn09DrWLSRHsu4EM5HSmQoj/2rkEiBNZ8LvgOyryEsKXeLixoVUX91Bpp9B3tmYqeeoI/FQNwE+X7gCTZYgaXxXS84DdU/v3ydf2fEK/GkD8U3NtadVGhmk9zlf+Hx7eGGznuTDFE0bQRWhWdiPQx3AkwwAQQuUOqgjM4IiQtSzFH1z20ZR20y+cgnRjcGTZn0W89vz+O+T7ekI2YFSB9rSkeHwc2MG5u+CrL76dgcSsLWr3blsrU90tEbqLrjHd1EJ9omSXY7yyXcLzF0Zs3fQNxg9vVLBorfcoJIpJ6nDRSQ0UXneNu33eRjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auwFZpQsNNoQO+vCF2H7rQbzX5hdOtn6sUbpRPqiGT8=;
 b=A1xbQSg4iVcFUWIkqlh0SOGth6AVD1stlXJ4ZU7tCYVmtPBkyowNb6TOTCeqdsEuE0mcFHRBWUpG/gCCwrvsY9muCid/qwdQMglGajHxA9zSxWWAPG6h1ke54uVFPFr1vbYS27GYgtlpHUj/mTEapfsx2P5msCgDeXgXeO6QksmETljp3AJSn85VyJGZFPV+mPafah70/5KMeeocC8pIFPipcqa2SwH9tw/JPjA17I/pIW/8hf3unLY7itf5fzZPDJeDUZ1tqVEeU46NfoolPc5ZGP1PQKXqSbGb0u2qVc4W8dzSGfK2R11xVT/2ip+iWWbg2+ImU0OY+i2qSNE66Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=auwFZpQsNNoQO+vCF2H7rQbzX5hdOtn6sUbpRPqiGT8=;
 b=TJ3HwOcKQZwBzfPf+4KiLqgpzgPbYXnBgh5lFWLjDYrovozZXXlocx+fuBowRt20UF1jJ9QKqJu+yI7BtPAyeflYj78/2ZSyY8obPC9NRKgqbA3hJyc4YrK+fVXJ9UmfR/bubUJBXWzZS4h546h60hq8Pse0gm6ZgsC9bpjC2PgW8A3xPte+YpjhJ+ZERQq6ro9DxsvfCcvDnjfGi2NWRAvgDs+/XcYFL1j36BuPzZNDF4ICN/q8b8krw7khQYNPsNeeLGrp/RpCI3SfP+Fm4uHXRqKtsxWo/7+lRFrMsAkXUxyBywOMKhhLnOIduRjYKlylr60IMKMSZK3bEbToCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB6976.eurprd04.prod.outlook.com (2603:10a6:803:130::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Fri, 15 Nov
 2024 19:49:10 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 19:49:10 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-rtc@vger.kernel.org (open list:REAL TIME CLOCK (RTC) SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] rtc: bbnsm: Enable RTC by default to fix time read failure
Date: Fri, 15 Nov 2024 14:48:58 -0500
Message-Id: <20241115194858.3837298-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0124.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::9) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB6976:EE_
X-MS-Office365-Filtering-Correlation-Id: 5504ddec-51e0-4382-be56-08dd05ae9274
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZeIkWEVJnJORjspKiFOY5+leT/SDtJG+l8wQiIfN+YPH6oY+HN+/WiO6Nz/V?=
 =?us-ascii?Q?bMpxxYDzJ4k+pgKKvZJJxvJ0DQPJY8G5HsxijmBFkjlGmJENwqw5D8oG/Ksu?=
 =?us-ascii?Q?FhJyeh2Fymq+P0t0NcBgTLA311OOt8sDMwm2vM1p78uFFcEZKYG72VOXMRpT?=
 =?us-ascii?Q?5/ZqO8axz3dI+Dh/fpSNXDiox/iOqRgOS7cTKXGdKDBgC5clO2RZz2zh91fW?=
 =?us-ascii?Q?YpMvfOZ7urKjDF3pssKpf5Sk9ueEnijB1XHar+W1+2TlKfF2Svh2LpyDG2xe?=
 =?us-ascii?Q?qynxpQeZTzsuLlGKtUXGQ+ilZNYsWWKbOT87xXOJSXUen9W6ojms8Dyi+nZh?=
 =?us-ascii?Q?/queGcpgUToffzUI9l/72rHdpdjhBm5iTBdUrT+KSEUWNsBeod6PfhC7g2w4?=
 =?us-ascii?Q?hXMTp+d2DHZgFzt/alJkSgZMkh/t9ohGSSOvSQec+oo5++HkCoVXMGa2jog8?=
 =?us-ascii?Q?KuAHptNg7gcAAQXzOBzXRDABOh7vwziqiYmhRHU/UA+VROYIf3L0EiPKn608?=
 =?us-ascii?Q?/6IBp9DQjD93igI2pYHZ4SJCA7HTG61DDvEJ/aXTfjNgtVm0NOvByODSehM6?=
 =?us-ascii?Q?Rk5WdnRfI/PWjaLs+hd+at/+brZVp0SgHdYAwNkpYnhPrxdn77l7r9bf64C/?=
 =?us-ascii?Q?1BU8w9uG/yFEWo/yl+Is1xDM56pENzz731nQsQev5DXpe2o+CSHCN4D8gRd9?=
 =?us-ascii?Q?Kc1d6Tq2HLXwWBXtUNfKwx16VERzrOmtfwx0pgeZYndFtoU/QeP7AsB9NZuV?=
 =?us-ascii?Q?6qPeFOvFybZZnP8KJeWR69KV8+goKn11codivW8qq0k8Lp7EGM9fH6Epvk9L?=
 =?us-ascii?Q?Q/6CtudMAyGP2nsVLrXu9wYtHiuA1un1RUhxsmkzin7TtBsGbQVnNkuEeGVH?=
 =?us-ascii?Q?eS/jgeDn60W39HWRGfQ4Q78rqdOzeW/cHLRvAyjInXbLZ4Sh64hH1ULrMB+m?=
 =?us-ascii?Q?pjTyTp5EygSDku98+nbD5JnJPMzMlsF9ECmqjAdcma8o6/IIbF+T7yx4f52l?=
 =?us-ascii?Q?QRNr+eW8c+nsJ3kbR15rpbdpKvtO6fIMWuvRtXy8izF/bcw9uevmDrlvnYIG?=
 =?us-ascii?Q?jzYYFiIRq0EbQREcqjnZh84WdKugd+Ig4lRtJz28SPEoAYkVVmNkNaDw8UyW?=
 =?us-ascii?Q?719kjlvynNqZlF0CdLHVJ3ZMtnGW/v5iiB0RjnO/bdF590RlyX7+xMNdIADH?=
 =?us-ascii?Q?Ivhs/o16LrwKk7IuPKe9LrOh6LrLb2lw12ACTjJ+nwpFxvdmcLtkZWJDVhQr?=
 =?us-ascii?Q?4lABfqb1gu4czZ+XROp8hgCZ+2CmLDGXlBPw6IW/gBQuEjxrO+lGwqkPMvaU?=
 =?us-ascii?Q?LljZjOSpzYLTHbO8EW51XeTcDKpaE7iwfao1bu1HMK5dQ0I1Ua0bEVvwBN8a?=
 =?us-ascii?Q?51k3FwU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wcqFFLUTiKSvTMU7YWS5gpxpuSNOhgQXBziKZHOlXHpT7GOuCbg4oKtSozK4?=
 =?us-ascii?Q?BCXYUbotqRqm9jjn/w9CNzCVISqi/ShRUAkvSR2HzwSU3Q5/7l+DyHqjK8YX?=
 =?us-ascii?Q?Q0gfmRpmXThR939NJKaeM4+ZV9loU2bWQEun28NHYLEKmJ4jx6p/DAGwGily?=
 =?us-ascii?Q?skiHt2dqFxg2pHPewOx21LnrAEmkVmOdNN/MDhm6IG1eZvdGPT+a3mooPqwt?=
 =?us-ascii?Q?Mr6QAD7TI6OdfsXoLYjGz1Ro4OBamTaKH4PtpZzzQ3x66ogyMq28+Ml4nZ4q?=
 =?us-ascii?Q?t2dBHwSwvfXGbBVYm4Qizj/qg25uNXOlyAyDreRP5my+l+kp/jiO6PJ0XSKy?=
 =?us-ascii?Q?/uK1l8aIGK1ZlQAYWBUO2lzPw0Uc0Tq3zIQ/0/eCXhmr3mYUYASuWpR4VjQt?=
 =?us-ascii?Q?L71jxZrMLGA5/JWsgYNM1Cl8pJawa++35pRMYM1Thbtp0y1L8YC4cVuGhOsS?=
 =?us-ascii?Q?WxmjFQG24HEPk/XLEqyPodci27Q3eX3po9Z+1N+Bw8x0oa2NRBj56ujfyCv7?=
 =?us-ascii?Q?zJMjuZX2DZrIQrew4/LluHQBECS0MlXdO1Lv1cqih37PjtZjE0hhE5YY6R7M?=
 =?us-ascii?Q?ioUwaOgo5YmnghNY4M/lxVo+fmWVFsCvXx/gyReEETJneUdwWwg+atGK8Ud+?=
 =?us-ascii?Q?ezKjPXtHeac16IKMkD24Xs8/+nGXs3ByaaClnin708zebDjONSgJLzItsfJq?=
 =?us-ascii?Q?3uyYKHPL1SpGb9zZ1yLNfyXXhBU1vAbG897uI9Ex5bu9JW2YsKMDSaBSsH+Y?=
 =?us-ascii?Q?Megl8brc8PaX+MXwtWXbhSYFOtVz9AxfWDt/z+dU9DAL5XZ8M3HPdDDGx+6m?=
 =?us-ascii?Q?oW/b8plZ5vZPR0FfnCfREeazeIgpSBvFxSXQBC148p7BZc71GfVUL7ZJlNt3?=
 =?us-ascii?Q?ruUcPMZoS8H5r2wfR82wgYIF77cLIbrSwi84lnL/4JtSIGY+nrTG7MtXLx+9?=
 =?us-ascii?Q?MIXKEMq7ZvleWAQBkuc4XOODnwM3j4R293RF6yaH7aNuSQh4nx0dzbIl8C6m?=
 =?us-ascii?Q?7fN1F0fWPilKkcWiaKD985vDMe0aVRNFIN5taK0wXgbz6RjEgfJTgNrevYMO?=
 =?us-ascii?Q?fCYEewvSM6mJxfHk1DE/F4di7IdB2N+8Mcxpv0xZKSY20VZ/6ZpBWSQmuexB?=
 =?us-ascii?Q?N3QmsA8c7+/79B1D8i4+DBs07zdHc8uHLvpF6FKHuF4phwkXIDCSzMpYQWXU?=
 =?us-ascii?Q?r71BA5UUxuFpTNxnCkU+TyMwUeP7aEvxOoSUQqBCI593x8t5n6kJkBB6u7w5?=
 =?us-ascii?Q?guDDOH3f0slArxXcOgIs7kOFQYyoiMc5Zd2rsMAfPd0OmvRYK+36S/QsXpmx?=
 =?us-ascii?Q?nVishp5TC60fpRWX0ar6B9WEWXbTGXRew7yKv/DXMVITqJHwbfGY6RojwEdN?=
 =?us-ascii?Q?O4W/I9qd9SgsVjcgtOfvS89WehmB/NS/iN54czvjq3EjPTbaQ0gBScev18Zq?=
 =?us-ascii?Q?KjxnJulXHN0oX/QDLVQRfu+g+rkO/E6DPv24wpQdKSgOuGSlaw4kLP/EODsd?=
 =?us-ascii?Q?YIG/xbfuvzEKhXEkmww+4la16mPX1CJwntuwBCLwi3ZbPCWeux9fMZ8Yj4au?=
 =?us-ascii?Q?RTQWb2f5rif0R2lBv9PkYje8KParywec5MPXmFND?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5504ddec-51e0-4382-be56-08dd05ae9274
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 19:49:09.9254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sbRyUo6Dw9fd+W/IzlIwqtWIKEYsxlWHwZRtlFTqLt0GhFPK0hAqHIrAtstiaDj/XyuZYT8CEvFyZW28R+fr0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6976

From: Jacky Bai <ping.bai@nxp.com>

Enable the RTC by default even when no valid time is set to ensure the
RTC's time read and alarm functions work properly. Without this, running
hwclock results in the following error:

hwclock: ioctl(RTC_RD_TIME) to /dev/rtc0 to read the time failed: Invalid argument

Fixes: eb7b85853c38 ("rtc: bbnsm: Add the bbnsm rtc support")
Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/rtc/rtc-nxp-bbnsm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/rtc/rtc-nxp-bbnsm.c b/drivers/rtc/rtc-nxp-bbnsm.c
index fa3b0328c7a25..6610db2f75125 100644
--- a/drivers/rtc/rtc-nxp-bbnsm.c
+++ b/drivers/rtc/rtc-nxp-bbnsm.c
@@ -189,6 +189,9 @@ static int bbnsm_rtc_probe(struct platform_device *pdev)
 	/* clear all the pending events */
 	regmap_write(bbnsm->regmap, BBNSM_EVENTS, 0x7A);
 
+	/* Enable the Real-Time counter */
+	regmap_update_bits(bbnsm->regmap, BBNSM_CTRL, RTC_EN_MSK, RTC_EN);
+
 	device_init_wakeup(&pdev->dev, true);
 	dev_pm_set_wake_irq(&pdev->dev, bbnsm->irq);
 
-- 
2.34.1


