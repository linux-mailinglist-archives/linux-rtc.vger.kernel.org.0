Return-Path: <linux-rtc+bounces-1773-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C96CD964420
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 14:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEA4A1C23F8A
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 12:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 760EC1A0AFE;
	Thu, 29 Aug 2024 12:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="L8kV8NMs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010027.outbound.protection.outlook.com [52.101.128.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C27D1917CB;
	Thu, 29 Aug 2024 12:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724933726; cv=fail; b=bokXh7cVUlp/ER1gniRaOy7jyr4L+tUjPUddlxKAXjtK92RMENq1mX49zkxNw9MI+tDS9sYmggCJXW/r9sXk/q4YR3zM66TRCCcu3t21Ug3iWgm45cwph/VeGgjKjd6n9sI6P51/ABA7fSU1gb4Dwy0CZ5chPsENetV5k0N2U98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724933726; c=relaxed/simple;
	bh=cT6lZHUXAL3M5l4p5lfRnf3CleaDt4fo8YrTbkKBtlE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rf+5fR441lZ/XUYrG7Ql5VLBPb7XJKaqdTo2Cc9gSPoRbJIeRd/gbPcxIu81pEFUeQFBsfoq7NbZOGlwrc5t7lxCbiaD9CbY07A3fdYJ5jTHn93AvjLRgaT0ZHkazrA7M1OQ3m1acSenZJlT78XK1FQKAFJ3KVa8tJ1lR6uIlvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=L8kV8NMs; arc=fail smtp.client-ip=52.101.128.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XwYN31zF8cn3+Ym8y3vwYmzWFyxdNOTq5+zvqSG2cx/8sBG6vQFhtlfsYZo+ctvX6ghKUzmrP00aeUpjADqjfZ5umS95LbMRwmib3wqukheRejEn/qJY0tbgjJ5+3XxX/xY2NSh4r328uzBToktYWHW7uGeAgLk07mswIcLJ0277sIZqYJzdYCOObpfefLrf08aR52vz/twrvkqgd3QJU/dEzJ2vg38Qts1w+UJOHZpL/nkVkHT4+rEzAeKgKfYnbi9ak4y18tc+qezjYdYMBJqJLmtvilySMqT3kwYpyNTTLZwLy96Sn0Ex+8vFstT9QPc122Ef+sEES5CzEefZKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NymQfXAdRyVLPjxH+hsLKmNSFb8NpN7HWNp1EKUg3XQ=;
 b=WyXZR4JLybGgCC4AHRS5c7CsaoduqZ3TauxAIGIwUM04X9lPNMv6cQz1tL8eWb2DIdxHBCvj7WArngIXtIXTUN6S7JNJ/GWp3+w9Ix0zUFPe+pvKHb45uuxZMTj4W/0G8o5246lqPZtbA5rqFYXJv6ffDcE/gCJNJkS3EG/CW0uomb4of22xAG6uJrD+7EwPf+XgqDatFM3RVnjLuRybERJoVWS5FfW2/xcmq7YcmQ3JAV4ipqs6IOqzuR25SyBqmWtsqThL3+QVI+VBrL7HbTNeJQ3vs9rIFhQnMMbu7Vr+ijccU+aYZmH/gzPrdSD+jvKG5b5Qb5ueI8bQ2D9aTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NymQfXAdRyVLPjxH+hsLKmNSFb8NpN7HWNp1EKUg3XQ=;
 b=L8kV8NMsj6WU05gb6KsaNRgy3GfcrrFAWfZ+wSYDjjRkbRdUy5CTdTxG1hu4tC2aGZ1WIxyyVWYKAYb/7iS6XITe1sZsumN3Jpq1VHEAmDNnHFkV/c8k4WIqqDJdMW4Zp2NgAN3NnWtdIf0XIHfrVCZNpFJI3S8a+b9o1mxIznjY38AtPrbVxu2zEwmRli5sQECNfiRWcVDr1+N8jKhyhps+fbBcFIfc4Pm54flIymhNC3bSSLskLACIdb1S0uwtsyB5XTIBjCfNWYTbhm6CrEC9VyPPfQJSIEn7QWuNKHTZqMGhcImE7gOsMGDCT0b2EUVT1bG5qKqyzZamGVXD1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SEYPR06MB5376.apcprd06.prod.outlook.com (2603:1096:101:8f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Thu, 29 Aug
 2024 12:15:18 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 12:15:18 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH v3 3/7] rtc:rtc-mt7622:Use devm_clk_get_enabled() helpers
Date: Thu, 29 Aug 2024 20:14:51 +0800
Message-Id: <20240829121455.16854-4-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240829121455.16854-1-liaoyuanhong@vivo.com>
References: <20240829121455.16854-1-liaoyuanhong@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0156.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::24) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SEYPR06MB5376:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e6e6866-4e68-4a28-8ca0-08dcc8243f50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZApJmtk4rGFCGpJUGIhNtoS5K0IL+IJVaRyFYv8LRbU0ooOz+i/6SXPqPW42?=
 =?us-ascii?Q?VZuPeQSSP9rp5+AEYpXFEsxNFUT7Xldhwm+HsHZed3Z185CfKje1Vj6nWoGz?=
 =?us-ascii?Q?gjGZ+2jVzZtewKWfIceUT+0XROUwDXa5MUCPkM6LCgMMjGPCozOgp6aqtmHD?=
 =?us-ascii?Q?ut6UkrGoDRrrY+g3+W3CTkLVe4ekAl15GLWg65vrcPc0VqraSq+dx0DjiZG4?=
 =?us-ascii?Q?Np9QA7RcnSwjQ59ygXFrVb2oZ5JQ35y7ciayvHH1wWZUZ+Iq31PVvWYS9gdk?=
 =?us-ascii?Q?KhxfgBrIn16abH3e9xsnANHt+j/3xdYsMGLK06OlAF5e5Hdc3Z0/mnBfReb9?=
 =?us-ascii?Q?bPymPpe7aPvgW9XqkWxVS4g2Ls8RNPqNWfiCSMVEezGHmDSTksPnm4jsmRQK?=
 =?us-ascii?Q?8Ml0OiyxjLdt8eGqv1zkdW1BReCgqWwwh/5bN9htgi+5bSBEXsFvFSK5X1VJ?=
 =?us-ascii?Q?pqWqCmErVHlC838sgjgbi4qeGg75uRxqBlFd5KpVma8cVC57SmnFcV6gUdjf?=
 =?us-ascii?Q?d0WZESrM+bi4TO/Uw8g0DrYHdJobvvxvwKFBfG5gXcC9A9UcGINdYiRWJwMF?=
 =?us-ascii?Q?uRpWU1wGTR7EnxU8NMkkxMA7VouC0cbXS6N0/MpJ5HwSz8xWq0b5VvdoecAW?=
 =?us-ascii?Q?yVLqoE4LRLBlE0qcGhvlzfTzjSOh9xYnYXWd2/rP6LiA45WS/zwhp7A4m84o?=
 =?us-ascii?Q?2BnK745OWdV62JuOgUGfpWQ+2yStz/jXndhpzhLrD2/AMMytmZSZLF0xuZxF?=
 =?us-ascii?Q?u1c7/pPaG/ALvUl9rDmuUyD+PC9lii6lwk9kBXndtvnN/Hepo5v4uJl2IK6A?=
 =?us-ascii?Q?7z66r98+r74B4vhn4vOscNCdj6CCo6/P82vZ6xe3jo7M+FRH3vTnypBBvuZJ?=
 =?us-ascii?Q?PGk2aomCO9rw2IL0fnTP9bLAHZp6WItjlkXpAIdYic595uhggJoY5BTlpwsT?=
 =?us-ascii?Q?8jRB3kCscRFHVfZhSG8Q97uCnyt+PGT7Nomm6yFNC++SU0grEuhIcyFnEHeE?=
 =?us-ascii?Q?xR0IcJOaaprAGwo67DdGfval9aLW5j2vZAeH+w4O3P9Jj0t/MehY164G7rkj?=
 =?us-ascii?Q?ryKbfDnSawqiHhlArf6q2QziuOXm2yNst4iU60ZwwnXhAtTAyR3Hhao8U8Kf?=
 =?us-ascii?Q?PVTZQ4IU+YjRRhRzozdD8FGZJ1GLYFoQ3T1lLcuT2sloLSbC0ID2yx1bVnSt?=
 =?us-ascii?Q?B4b0VfIV0MecdJlQNVJISMHYo6udQcpXU2EJ7DoqJxEj3G4pxVfXacHG3xrh?=
 =?us-ascii?Q?cEZs+YZGT45Evp5mxxBC7HhQbpzmPbUTS4UETmVsV0bybaAC2rnDPrTLZ7/Y?=
 =?us-ascii?Q?bfQ3QuAqb6kPC9qrcrizZvd+TV4UB/QFVcM9d5DpyR3nPruPVIndHThZamqz?=
 =?us-ascii?Q?u0V5khOPCMYF4GQKjkGx+yrEvsmgqDv+Gv/DqiIxQ58CfRt1eg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R+MqVEoztnGSEzwvxDXJ5A6PMSMRoDnMNuqgDmFHYN0SP3JiaZ6BFYDJUA8N?=
 =?us-ascii?Q?6fQln0IiUVZgIk+c9OmHt1pRCPzr1gKBsNPUhga/T/zjp6SfoDFpuwocOQwc?=
 =?us-ascii?Q?ZRxSdt0xXVUyq6H8jORyAIIDcuJpA6bmKG4b8hoCj+6sFZ1CSdzIsOQubRVF?=
 =?us-ascii?Q?Hx+A+jeMCzdFmVdFjVqCgSZq6M4phV8MThfB2FmjgL1S/R32OmwgKh1I2Izk?=
 =?us-ascii?Q?nTgsgqR8cJlDQ0hdEB6F3AWqj1HoYvsVKuaM/VFJ8YKrsbzBQ1R18CWV9FuY?=
 =?us-ascii?Q?OhG79afC8yEE5k6ol23rl4D3IxbMQI6I+6Bauc1S41rHYpezfLRMdgFn5cpT?=
 =?us-ascii?Q?z78Tco62F8f7lpO3TpNeHJvNvti38mFhsJleiYrWb8ixcAT6FX8xPV2mGN0n?=
 =?us-ascii?Q?4a+xHTpxEX1Ow3RULLxgdUHFz17/kiHQMG0BCCDm/woc5dYX4pd2/K9zqU+U?=
 =?us-ascii?Q?mZ/l9sHgwcm6SfvQfFTVI4o4KnTmEIL4p2zfWI+4ojGUr2mIGqCRU0sHSORu?=
 =?us-ascii?Q?YRoJsJ6+qDsb59L7KiStAUBu33T18tVXW//ZLKQjpkbWL6p7kl9AGN0hAzXE?=
 =?us-ascii?Q?nQ/1q/pJS5UqvQwVEQDuBLHV60Oy05+hamvd4sHgkRK3VQi3TBWNdpGu2Bc9?=
 =?us-ascii?Q?zuZdYvtwXqNN2/06ou/5lLWvulcIPmPYZ7HpcElKsN802i/VRLgtYKfdHl20?=
 =?us-ascii?Q?OPcNHLSE8FEdowySsHJ/wdaik3EklWoFgkqpTpw02PcO195TAZNRJMsLisRB?=
 =?us-ascii?Q?AbIoD9/Byd3d0QP9Y1hYvdBCFqZoOHYH526SHl3BcrzfY4zTtDDy+RYSeJGw?=
 =?us-ascii?Q?NmMKp0w4nBuPTAGGmVvDvNq0h3qaPKB0i60Fpcg+BIOKSXPrRNTonGBqqUV7?=
 =?us-ascii?Q?dM9gDriP1WpKh7+S8g3a71JdkRQQ++0hxkjdihHVevHLWEO20Vt21dpDlfw+?=
 =?us-ascii?Q?E1DM/ZBg41CwJ0TcasFw+rGblKdFexBGVdIaChB0rHcI8Tj9XLJcYyDJa0JZ?=
 =?us-ascii?Q?/wsR1d+RQpOhOYXItmtyeyY/mdI75kZbPGzX+2o9rpskLQthhHLJ5iz+s1Y+?=
 =?us-ascii?Q?mCe0VjZW1PTq2akwWPuI35yTeIWjiv1Ze2T85so1RwmqboPDzQkPLdD0axRz?=
 =?us-ascii?Q?NC2ynMFZcDVxtIS+5cpgUAKfBAPOcVUHuwtXCJqoL3F0bl//Ebv7DhKXKkzu?=
 =?us-ascii?Q?YkXjIvNxeKOO3JdLQQLP06TUA8WKlY4xPgAchJzbokTg8UlhxXEcG4DMUzvJ?=
 =?us-ascii?Q?QHmj6NIXkLmgKTIbybFG7h7C5rZJbBbDQyudxlXeCEEVZAF/IIKeN4Xhuibg?=
 =?us-ascii?Q?426CcXZkeNuq7vv9KkJRVrxaDxYqM4lPXHI9Av2qE4mB7w24QD0zsLy3JOqc?=
 =?us-ascii?Q?w/eXCNF0bT+fVwHiJvNIK4L0D68zJsuP0UD7z2kuN6KoOzAK+TCj60fbMRnZ?=
 =?us-ascii?Q?w0opWffE/G8CzUjdp2+ZzHNIrDk5lTvYOMzJ9JjsXcA1K4P4idhFdp2MnVQ1?=
 =?us-ascii?Q?1Z1SAZowyT5hIcvM/a3Ub9HX3r/kwDUWhvd5BQKbyBQd6kmQxql8JpvslxUr?=
 =?us-ascii?Q?gSRk2jj8kt/SUbBEGC4DzSd4KXnk0wNF2cAAZNkf?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e6e6866-4e68-4a28-8ca0-08dcc8243f50
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 12:15:18.8089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NNDnNWnq6525kSUfpsbjfQhqKmtpfpm9vL5JhZSMx+2QP3zvBdBgu8rp37EfVbLQezTo5+r0m6RUjHdzrNyiRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5376

Use devm_clk_get_enabled() instead of clk functions in rtc-mt7622.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
v2:remove the clk field in struct mtk_rtc.
---
 drivers/rtc/rtc-mt7622.c | 30 +++++++-----------------------
 1 file changed, 7 insertions(+), 23 deletions(-)

diff --git a/drivers/rtc/rtc-mt7622.c b/drivers/rtc/rtc-mt7622.c
index 094c649fc137..0a54e9844840 100644
--- a/drivers/rtc/rtc-mt7622.c
+++ b/drivers/rtc/rtc-mt7622.c
@@ -102,7 +102,6 @@ struct mtk_rtc {
 	struct rtc_device *rtc;
 	void __iomem *base;
 	int irq;
-	struct clk *clk;
 };
 
 static void mtk_w32(struct mtk_rtc *rtc, u32 reg, u32 val)
@@ -304,6 +303,7 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 {
 	struct mtk_rtc *hw;
 	int ret;
+	struct clk *clk;
 
 	hw = devm_kzalloc(&pdev->dev, sizeof(*hw), GFP_KERNEL);
 	if (!hw)
@@ -315,27 +315,23 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(hw->base))
 		return PTR_ERR(hw->base);
 
-	hw->clk = devm_clk_get(&pdev->dev, "rtc");
-	if (IS_ERR(hw->clk)) {
+	clk = devm_clk_get_enabled(&pdev->dev, "rtc");
+	if (IS_ERR(clk)) {
 		dev_err(&pdev->dev, "No clock\n");
-		return PTR_ERR(hw->clk);
+		return PTR_ERR(clk);
 	}
 
-	ret = clk_prepare_enable(hw->clk);
-	if (ret)
-		return ret;
-
 	hw->irq = platform_get_irq(pdev, 0);
 	if (hw->irq < 0) {
 		ret = hw->irq;
-		goto err;
+		return ret;
 	}
 
 	ret = devm_request_irq(&pdev->dev, hw->irq, mtk_rtc_alarmirq,
 			       0, dev_name(&pdev->dev), hw);
 	if (ret) {
 		dev_err(&pdev->dev, "Can't request IRQ\n");
-		goto err;
+		return ret;
 	}
 
 	mtk_rtc_hw_init(hw);
@@ -347,21 +343,10 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(hw->rtc)) {
 		ret = PTR_ERR(hw->rtc);
 		dev_err(&pdev->dev, "Unable to register device\n");
-		goto err;
+		return ret;
 	}
 
 	return 0;
-err:
-	clk_disable_unprepare(hw->clk);
-
-	return ret;
-}
-
-static void mtk_rtc_remove(struct platform_device *pdev)
-{
-	struct mtk_rtc *hw = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(hw->clk);
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -394,7 +379,6 @@ static SIMPLE_DEV_PM_OPS(mtk_rtc_pm_ops, mtk_rtc_suspend, mtk_rtc_resume);
 
 static struct platform_driver mtk_rtc_driver = {
 	.probe	= mtk_rtc_probe,
-	.remove_new = mtk_rtc_remove,
 	.driver = {
 		.name = MTK_RTC_DEV,
 		.of_match_table = mtk_rtc_match,
-- 
2.25.1


