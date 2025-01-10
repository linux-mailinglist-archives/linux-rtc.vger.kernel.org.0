Return-Path: <linux-rtc+bounces-2867-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B356BA0883D
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jan 2025 07:18:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C2713AB210
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jan 2025 06:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1AC209F26;
	Fri, 10 Jan 2025 06:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="FKC2rPmH"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2076.outbound.protection.outlook.com [40.107.105.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B641209679;
	Fri, 10 Jan 2025 06:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736489729; cv=fail; b=hHnzRkcaGqCucuVowuJ3OGTdRsepw1tFb3G9kux36zbf2Ej9tNOkeZ602G02EJX4pYeOp9AuB7IoDyMBtrpDVaFRUGfoEQPIR79hUaIwI3Gz8WwF0eOMPrKBISgBHX4/rmW8LPMg3k6RuqEfyG/Lw7CPV0ZHlEvwjNFCnvrCm7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736489729; c=relaxed/simple;
	bh=4YppXkRpntjW4JMKuXrhjQZu2fW+g0VoGsw1fmzaiNk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CDS40F1Ve5BQtL+LNl+cq4wPSU97pIU4o71R9Jww36fT4LZEdeA2SXWEPIO5cvx5iaLABFx9kx/NPdP0RwzeuahvGFIc0hmj3Sdsd4fxK8r0MfPcavCMUzcKRXW/VjDS5YXhCLZFO3BFU1ujvGlbb4qHkM9dgcdv/N9Ko6p799o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=FKC2rPmH; arc=fail smtp.client-ip=40.107.105.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nL7a/a6JTbu5g3hRFD8UP/jVSREj2BpUUWmJ0xdZmemAHcGPLJq2pvKrbS9DEO25mPqbOpIxJCif94EnnzpdwEF9JmsKItOnHzvEWopFJLQM7A5NEn7ZB4SY95i6PN6Jorxn2S8ZeMxXFobb9M2B5q1nU1WrfOqkugOlzZgGvzlYt9QRKyi6LS9GZJoQNEL2otsfCq/7AY+KrWilkzWw+LC9j80mFtXuq5BjhYKPWxpdZe4INkpisEBBHpOTmTdQSFPznOvaLl4x/5NNNSHHhVw53rZBqG8IuKNUVmodbFeDBV9Ie6YG5FRK26CvdAAGD16SKMZ99XEerjb022gRgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QtPRXhrh9ZkdqmHGA9gf8siy0eikgrGnI2MefmBXuhs=;
 b=j/tJAiMDb4LX0e+f3fcEARoZ+6N3aSlRb1djZNl5V8E20sISRx2PsZaAaOTqXuLouomE3/CESi3Pi/FzFg5Sm82CFjmPQVXMIVGEhikwvvNYYXR5FEacgwmzHFIW03EwrcBug6XnLIwkMl5jwuYUNdKzwY7PpL7NGTShiUSEL6zKiOUAg8flabp5twBXEIQHWy3seek2XRIf/S+ON27ecjCVia/d0koDTcWMI/1m5VU5VjSCRL6B4M94d/mnPcQ2DqShbuIIxgSdgHIFA4a3Emvu2PXC9S+HR60/b2mxN27AsjjIIkHqm5zVnr+MM3zUl8i3siYRgZQ6pfn9VzJg9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QtPRXhrh9ZkdqmHGA9gf8siy0eikgrGnI2MefmBXuhs=;
 b=FKC2rPmHCYPEJEBLfBFG0DjeMtmPuduQDTn4xOW/wdky8g6Jan4tZttODvDp+uuBlvxyVV105N2CKnREhRzvh07bSV+liu7lzgY3vQX4TrUKbjjcPJw0UcgoIG8SMEVGfyzqzxua7BAX5BV/ZulsA4T9CVQDYda7c7ETcTN8eUNitMw7y3RSXbGOQr5morXfW3+Gg9zZrHmI2jnYibfaCVFn1tE4d7alMAmvUsGI5NmUWa5l60kbXA5K9fesK+trocPAhGIJsoZ/19VmkL+Ed12+oyVDD7ASr/Y4Vbos3VnPzkaZz2NlJjYPlyGVNydz+At8JjhVUtdHXckNgJay+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by AS8PR03MB6776.eurprd03.prod.outlook.com (2603:10a6:20b:29c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 06:15:25 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 06:15:25 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Manuel Traut <manuel.traut@mt.com>
Subject: [PATCH v1 7/7] rtc-rv8803: extend sysfs to read ts-event and buffer status
Date: Fri, 10 Jan 2025 07:14:01 +0100
Message-Id: <20250110061401.358371-8-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250110061401.358371-1-markus.burri@mt.com>
References: <20250110061401.358371-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0211.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:6a::24) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|AS8PR03MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: cc9078ba-0e65-4a3b-4ef7-08dd313e2bf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h8owUpSy8xI8uDrxIOYS9ne0jkj9/Jfm6eWlzuqPVXmM6DAL+Gls7c47jLgf?=
 =?us-ascii?Q?Zsf7zbYewsiA0iOA5/1I80t/R/Zgf0xCiFtSb9k+GS62jd+4AVwGtE+Po9Ks?=
 =?us-ascii?Q?RYWpqMfmea6eatNUVMHIxC57mqP0cweJpGi3f/J6cHcGE+sZN4Tkf7rnwc2x?=
 =?us-ascii?Q?5c/WQvrRB9zZ9ZRRfbZouMMMZLN9RzmEcQDDzMdFhV6xWVJgmOs5um2GF7w6?=
 =?us-ascii?Q?PM1+MzJ7fjP23gZvhISOKvmbG4sLmD7U2D+KqOghXMgn999y1+oEIzTMqaFA?=
 =?us-ascii?Q?5szrdbT7HCzVXrzmemEJnAvWP19aVehu4S6riD53VDsUp1bd/IYzQCcO5xaM?=
 =?us-ascii?Q?zn9X9MtNmj09OHNDZbSDRdM8AINlB5aiqcGIEIALThZeu6/KImpgHpkHHr0j?=
 =?us-ascii?Q?r8UQFZw9Rqfmj2ciq/uzMR1CWqwFyhgT9mX/GYG7Ghc5j9zXTMk7S50ptqQJ?=
 =?us-ascii?Q?soDb5/EtcEM9kIn21iU8aresiT0iEmKXd/Rvs9z6X/2XLzh3KSDpGWiBB5BM?=
 =?us-ascii?Q?tY+DjygZW5+1Q2p2OlBl0K2jxpJTeB7R28Gz4Ixgj09xOPMMjioyXG6IPHgq?=
 =?us-ascii?Q?nvYp50KopwEUa2E8iRHPsiIKXym16ihP2SJXNvcfsTTi/RxtYMr7TmpURtDk?=
 =?us-ascii?Q?rOrFZpwz3Jhtu7Z1FkjkGER9eNkIo2e9lFJcECR8EMXTp/y2s3ZevoLUQOEb?=
 =?us-ascii?Q?U1+T4ImCM6n3MGumitS4F8rgjItM/+2QJOUMOkKzW1DmzUddNDyXChSnqdkM?=
 =?us-ascii?Q?BmEqHZWcJTiFgW3//pfki99cEeA597Y7xXAdBSAc81BnlC5dbLkXOqJAZFGy?=
 =?us-ascii?Q?5u7Iby74dJIr54yDcW/ibpPUFl3dj5Hb8XJMvCpN8Tztb1V9mQ4lZXR/L8tz?=
 =?us-ascii?Q?WD/p3z6XE8BnXgF+fDHRU63HHmEu6sjG5uj3AcWd9Spd4IOHlxGQFeV8LFhl?=
 =?us-ascii?Q?JRoYwgI4Me7GKk/xR9pASc/6uN+e3zWNA/zR6DlGkfBfjOwFTFCif/LY3lq4?=
 =?us-ascii?Q?QtV5QUHetaEFtYGN0J9/iT3wxCzmOosbWMtqNX5WEp9hcYXSTbZQmKeMEr33?=
 =?us-ascii?Q?qJLMHvieQKcW+/kEbd62wZctJTZbgcAxVgRiho2K6T6RwYAziDuqYXdCj1iP?=
 =?us-ascii?Q?jN7syMfh9yZ+JYy+xwDbeC+B1yUrZGcxQqzMLL4K6bWZAvT2ektui83Yupgi?=
 =?us-ascii?Q?dvHl2lwcAEVDztQO/kFsKDVisXhg1vzmUHA2u3ohf2wbMnpfNXj2rhyhLiwt?=
 =?us-ascii?Q?KOoVvM95PFNNRxNWI8UqO9gPcCsc7TtC+hatW6Pmb1LBd9FapMUVzkQFSrRr?=
 =?us-ascii?Q?Mv/SxRO9X/emozyeVOoY486PKvs/kOjFmdfKQeKJ2NtdEHD0ojsuC5qAEdyp?=
 =?us-ascii?Q?rLDZjduq3JihuvdthGca0DfgYvGcUjmWWBXT/2cr6WawoxKhW3kUq2WG1y64?=
 =?us-ascii?Q?Eku/A+S/c7h8T008Z6NLZzb2c/wc1BgW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tg4gRHa/ykxOohn94Qcq1n0PgaWQDktyJfcCEDefHYEnaN3Lbs/3heyQ1z67?=
 =?us-ascii?Q?jt6CuMMAbAVGPgLdkISRaMCq5zqUrPsH49CkTag4fC3NnmwU1fWseGfyIGkf?=
 =?us-ascii?Q?ol1JgIIOpIdFKjql2X+6oo9xg8bAI8h4vCzhv1e/Kbb6PY+VymwZfcBNt6ZK?=
 =?us-ascii?Q?USpG3ZOnW17pl2VYySuGGo9wjeE96fk+Ihp90McYqsxAFTjbxDr0Z/Ve7n5S?=
 =?us-ascii?Q?eehE1sb3SjF6x1BHHk1fNBn0U3cpp7B2ALRNvUM1tX1nFK2Snu84mnnCQJiH?=
 =?us-ascii?Q?i9VRj5T+7BjVSlg2e4WnFc56aTfBGwPn+OOWZKwA/nPE6ttet2VneLZXCCOy?=
 =?us-ascii?Q?sGdlawf6DqMs3DWCCDzyOpaJTkTiAHW1AzmraL6EdkpuFYqiTCu1J3YZoYee?=
 =?us-ascii?Q?NOgf7GVlur/vNxlLJ3f2rEfil9lWGe7cKy4fW8vnGLrNIQZEWCSfcGXbBhov?=
 =?us-ascii?Q?NdVXv0Ax0p6Edp2NBX50ZpqaA2e1nnGFByHIVpZVbP4qHwzvehC0zg45drrq?=
 =?us-ascii?Q?BSeyStfXCAaSvj2pogX7T5dM01OE2XvqW1D7DA+Nn5r+FPnQUPRJ7ICCsiCm?=
 =?us-ascii?Q?QakoM4yizcST+nn1svWHXBV/4XOVt3WNa5JS5/EcJR+47bjiMtCcdSUixeyf?=
 =?us-ascii?Q?ZgBrVZZACX3b/VbGeZ+OphBa2tGs3tCtnqvXnJS+gVZpHEiybEZrX5bHHoyb?=
 =?us-ascii?Q?kTAv7Gcs0tkzs2jWytExMevhSnAghWUrqGlF0F2YCI3DatDRG0k97tsKTXCN?=
 =?us-ascii?Q?yhpfcgxUxewhZxjppy8+Yq01Jve+1SYsd7Bk7YBqf6pxVnaTAP06B2I/elOB?=
 =?us-ascii?Q?sThDKMFzCD68OcardseHtSvjgMraJxerN5FQdHmmdutZsXf5K/RU9nKwnQY5?=
 =?us-ascii?Q?m8haO8alLenoatRgkJpXFE5uWGJir+M/7882zrw2hyTQUrvZERotrQbNteyt?=
 =?us-ascii?Q?sSSQGAaXYH/U09RrndKF23UPzXtxNqgmYPtUB1PXxFwxlNgUOQtsk/bwfHMP?=
 =?us-ascii?Q?ssdonTPyQUrwNH0GkGKgULt1jOeRWHJoMhFmfVK8kRe2hCfzn+HUwRR2f0VR?=
 =?us-ascii?Q?UnzZRUcJGVSlEYgOaBePXrnua2c3UmCNV10aXGwItOYKMT8eefCWPF0ekyUG?=
 =?us-ascii?Q?0Ls+p8DJucN9uBSrxwGEF8VtC7raBbpKBtpJGzQvyeZ5hjjQJbIQVHh/TSGp?=
 =?us-ascii?Q?tgR7QOuvA10cO73v8WqPwJvSgrDRBztYekhpOIIn3zp5FW9AA1SDfS0EpxaR?=
 =?us-ascii?Q?z0rM/81oJ52R8a+B4EbxdbOnjI8b5A+cFuDpX+iCQsnaTGaSMUrXol+QCSO8?=
 =?us-ascii?Q?TkmeUDyndt5WxqZ1DpKr94qJrUWCWKPtmJ1+IuEJnG7rDJKk+Py2Fvz94SCn?=
 =?us-ascii?Q?Qa/TyoifojNoR6jgy94xu4/137GoNUI2gR7kN8rDbCVRmDaZpFnG5bPX9Lqc?=
 =?us-ascii?Q?RXklqCZ+prcsV8bt2Wy3TLfozP3HxHXmv2v23Y1jrdCKh1QIG7/YvI0+D9Mh?=
 =?us-ascii?Q?0o80ZSVc1p/hE7KZh1HBcxkJ38IdKIdSrpPnddNR4XQdBbB7lqj0Xry4TTmw?=
 =?us-ascii?Q?H587rMKvdH49tJO/YkM0Qs0Wz7hrTWi/11g9NpU/?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc9078ba-0e65-4a3b-4ef7-08dd313e2bf6
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 06:15:25.2761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phwvWUedK/rdh0TBs8l+tvXldyRxoGe2qgXQ3W3I5d1jfF4LznEpxI8qwSAPubo0pbhiccMK1ouvoCdA0wHncg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6776

Add sysfs functionality to read the status and configuration.
The functions provide the number of stored timestamp events, the current
EVIN pin configuration and the enabled/disabled status.

Signed-off-by: Markus Burri <markus.burri@mt.com>

---
 drivers/rtc/rtc-rv8803.c | 73 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index cc8aa53..5d31604 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -1218,6 +1218,77 @@ static ssize_t cfg_buf_store(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
+static ssize_t status_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
+{
+	int evin_en, evin_cfg, evin_flt, buf1_cfg, buf1_stat, buf_ovwf;
+	int i;
+	int offset = 0;
+	u8 ev_pullupdown[NO_OF_EVIN];
+	u8 ev_trigger[NO_OF_EVIN];
+	int ev_filter[NO_OF_EVIN];
+
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	struct rv8803_data *rv8803 = dev_get_drvdata(dev->parent);
+
+	guard(mutex)(&rv8803->flags_lock);
+
+	evin_en = rv8803_read_reg(client, RX8901_EVIN_EN);
+	if (evin_en < 0)
+		return evin_en;
+
+	for (i = 0; i < NO_OF_EVIN; ++i) {
+		evin_cfg = rv8803_read_reg(client, evin_cfg_reg[i]);
+		evin_flt = rv8803_read_reg(client, evin_flt_reg[i]);
+		if (evin_cfg < 0 || evin_flt < 0)
+			return -EIO;
+
+		ev_pullupdown[i] = FIELD_GET(RX8901_EVENTx_CFG_PUPD, evin_cfg);
+		ev_trigger[i] = FIELD_GET(RX8901_EVENTx_CFG_POL, evin_cfg);
+		ev_filter[i] = EVIN_FILTER_FACTOR * evin_flt;
+	}
+
+	offset += sprintf(buf + offset, "Mode: %s\n\n",
+			  FIELD_GET(BIT(6), evin_en) ? "direct" : "fifo");
+	offset += sprintf(buf + offset, "Event config:\n");
+	offset += sprintf(buf + offset, "  %-13s  %-7s %-7s %-7s\n", "", "EVIN1", "EVIN2", "EVIN3");
+	offset += sprintf(buf + offset, "  %-13s  %-7ld %-7ld %-7ld\n", "Enable",
+			  FIELD_GET(BIT(0), evin_en), FIELD_GET(BIT(1), evin_en),
+			  FIELD_GET(BIT(2), evin_en));
+	offset += sprintf(buf + offset, "  %-13s  %-7ld %-7ld %-7ld\n", "Capture",
+			  FIELD_GET(BIT(3), evin_en), FIELD_GET(BIT(4), evin_en),
+			  FIELD_GET(BIT(5), evin_en));
+
+	offset += sprintf(buf + offset, "  %-13s  %-7s %-7s %-7s\n", "Pull-resistor",
+			  cfg2txt(pull_resistor_txt, ev_pullupdown[0]),
+			  cfg2txt(pull_resistor_txt, ev_pullupdown[1]),
+			  cfg2txt(pull_resistor_txt, ev_pullupdown[2]));
+	offset += sprintf(buf + offset, "  %-13s  %-7s %-7s %-7s\n", "Edge",
+			  cfg2txt(trigger_txt, ev_trigger[0]),
+			  cfg2txt(trigger_txt, ev_trigger[1]),
+			  cfg2txt(trigger_txt, ev_trigger[2]));
+	offset += sprintf(buf + offset, "  %-13s  %-7d %-7d %-7d\n\n", "Filter [ms]",
+			  ev_filter[0], ev_filter[1], ev_filter[2]);
+
+	buf1_cfg = rv8803_read_reg(client, RX8901_BUF1_CFG1);
+	buf1_stat = rv8803_read_reg(client, RX8901_BUF1_STAT);
+	buf_ovwf = rv8803_read_reg(client, RX8901_BUF_OVWF);
+	if (buf1_stat < 0 || buf1_stat < 0 || buf_ovwf < 0)
+		return -EIO;
+
+	offset += sprintf(buf + offset, "Buffer config:\n");
+	offset += sprintf(buf + offset, "  %-13s  %-10s\n", "Mode",
+			  (FIELD_GET(BIT(6), buf1_cfg) ? "overwrite" : "inhibit"));
+	offset += sprintf(buf + offset, "  %-13s  %-10s\n", "Status",
+			  (FIELD_GET(BIT(7), buf1_stat) ? "full" : "free"));
+	offset += sprintf(buf + offset,  "  %-13s  %-10ld\n", "Overrun",
+			  (FIELD_GET(BIT(4), buf_ovwf)));
+	offset += sprintf(buf + offset,  "  %-13s  %-10ld\n", "No of data",
+			  (FIELD_GET(GENMASK(5, 0), buf1_stat)));
+
+	return offset;
+}
+
 static DEVICE_ATTR_WO(enable);
 static DEVICE_ATTR_RO(read);
 static DEVICE_ATTR_WO(trigger);
@@ -1227,6 +1298,7 @@ static DEVICE_ATTR_RW(cfg_evin1);
 static DEVICE_ATTR_RW(cfg_evin2);
 static DEVICE_ATTR_RW(cfg_evin3);
 static DEVICE_ATTR_RW(cfg_buf);
+static DEVICE_ATTR_RO(status);
 
 static struct attribute *rv8803_rtc_event_attrs[] = {
 	&dev_attr_enable.attr,
@@ -1238,6 +1310,7 @@ static struct attribute *rv8803_rtc_event_attrs[] = {
 	&dev_attr_cfg_evin2.attr,
 	&dev_attr_cfg_evin3.attr,
 	&dev_attr_cfg_buf.attr,
+	&dev_attr_status.attr,
 	NULL
 };
 
-- 
2.39.5


