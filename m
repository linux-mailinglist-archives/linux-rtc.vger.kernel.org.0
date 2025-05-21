Return-Path: <linux-rtc+bounces-4124-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1121ABEF19
	for <lists+linux-rtc@lfdr.de>; Wed, 21 May 2025 11:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A45614A659D
	for <lists+linux-rtc@lfdr.de>; Wed, 21 May 2025 09:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD3A238D3A;
	Wed, 21 May 2025 09:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="W8ren/zO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2045.outbound.protection.outlook.com [40.107.21.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9679C1514E4;
	Wed, 21 May 2025 09:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818394; cv=fail; b=RHdEzD5K1rRpVdeO/2T3yq/9FZ7oCMQD3EJQsW2IZbwzRHGN6nzfm3ScbmiemS5HVCh0BeQOPLsrjOY4yy3lGY8ZkYq/F3qmBomYUoJR+eUXLxumh2aS0bfbRGxlirb2hQ4AalrnKs/DOQqRRCml+pAZ1TZv52gDeHoxgkm5sxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818394; c=relaxed/simple;
	bh=24WSwZ9HziFncgfmEHdK+CJPI626z4TUWeFg7imzPpU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lYZm+mkDOe1RqmielfI+2xDyGVN0a3B3HpJ6jnjV0aMW1U3yK2acWO2XSPXEyl401elA5qN9Ud/L7iDyyt3c6DQgq4XQnlABHh9mY8epCMTyp1Gw8qUO2lFgnNxUkAFzMvOvGEhLPJdRHNWfWFNi8cpqeta0OecHNGY0vFgpQzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=W8ren/zO; arc=fail smtp.client-ip=40.107.21.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hsX+hFAfL8MymrvlyU/w5OxUB6ARLTsnrIwf4Kp9BqzysCm0EYH5UME1H8Hx9Z2RO43WlK6kqOxvpxYN7MxnvIsn1MFsjgW/YyMLUEV6vmCtX/GtEpmOfFXXRoGpE/eJdVvc0CQdCEy1P7tD9XIT7vLdF4xeJYiJdSHu3s2aSDT9SpCftXV0/3triSCRWHAODAKrFYF7gAHXO5N1oZlfcmDIQbY88xzol54Gs80In+ofYPeFBpYHJK7U4LPd8oyCkmmqewJJc7XwfBPtoY/fMCM/zlnlQYGZ4UIquO4lqB98P20nGS7f07VXo0wp6F4drkumIISreitL4UAlhJaDEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1STVCrl3CxR+qBC/GEUYJKf9+guog5hYar4kZSpzbI=;
 b=ssyxVJVFvNU1DHKCUOQ3YdOOY5cO8v5KHAXNfEpWGhRymMHUQ1YVKYps+TT2GkdeZfENRY+Zf4DvBXbqT/HTaFEOl/d6K5nn64aJRK2XOyI6sjYmb/IPviZpKnzlHR8pzPIbKzLT7GszV67TTx5cSq56UTprl4+WIemRti5blX6kxIxDqFo8grsFd9hGQttzJIqUjWo7QNvw8SZIZHq5xWkrC4vXdelI2xOUqohqLTfu5u7Eq0E6QjVHtxyOm26c3W/JfVCLDeKh8SeIIXeZKhVguNEwgAw5WttmkO7XaVQ7xyZPg0SaQ9js4Qi5hwRAIByRXl4cYpEwBS7Y+6Tqzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1STVCrl3CxR+qBC/GEUYJKf9+guog5hYar4kZSpzbI=;
 b=W8ren/zObw5PV48tZ77vh4nhQKGyKP9xPo5iHpYSH0q6dlWUqxC37LHkKOdVACd/5IxqYeNOgwYVL08+IEQKXED4y4w28AGUEXX7eD9ZAynPHVImn9NnFetIF0N97GP79Tj1myLOOVChV02Lw6vuu8MqC5ITDvlQHhhz2yefgxg9cXHZEJcFhF4v8C16nIlRvC+IhVXUYyJoQGxpffw1pV81TduvwOk7v/Isd11JVcq0sVCH0HTJY0PFUM7rRtpm6Jv6uCOq1mn79PbNTwIMu2hiKv5VbsTCFQxIvkrN5NkacV+iTZs58ZodCuK5foDGpazu3+GzyBfwDclUoTJ3EA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com (2603:10a6:6:36::19) by
 AS8PR03MB8088.eurprd03.prod.outlook.com (2603:10a6:20b:443::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.19; Wed, 21 May
 2025 09:06:29 +0000
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b]) by DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b%4]) with mapi id 15.20.8678.033; Wed, 21 May 2025
 09:06:29 +0000
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
Subject: [PATCH v4 2/7] rtc-rv8803: add new type for rv8901
Date: Wed, 21 May 2025 11:05:47 +0200
Message-Id: <20250521090552.3173-3-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250521090552.3173-1-markus.burri@mt.com>
References: <20250521090552.3173-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0073.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::6) To DB6PR03MB3062.eurprd03.prod.outlook.com
 (2603:10a6:6:36::19)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB6PR03MB3062:EE_|AS8PR03MB8088:EE_
X-MS-Office365-Filtering-Correlation-Id: 183ff08c-9d8c-442a-302e-08dd9846c61b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BzMiGE1pZPwEvCxcLC4ZF6qYAWUjW3qdXmC6YZlVDruWZgWIiXybNFXBOY4z?=
 =?us-ascii?Q?vPeT0bECCc6Ay1inxqfs0q3n147S6T4v5GwS/y3Zm8rTY9HcsjqVxBviDXjh?=
 =?us-ascii?Q?B/XpcxixDh5ibetRJ/9G16pPkZHmV59GxRfFSPNTrgqPvvKFllKOfPr6l5/5?=
 =?us-ascii?Q?0HFeaiWfnE6gw6RGpcf6CIb1l8AGAihsvbmwgeZddgsDDgJOhWcCoPYTB9Ki?=
 =?us-ascii?Q?dZU/wahETomdAkOsJ9KbDBHK4XK7DmHCTWAR/pKbX05yzW6lQ/mKyATm92N3?=
 =?us-ascii?Q?slRenhvBetlAzJkmFLamp3dmswJsc2SSTcxPH76XPR9nA/3+7rmAQnpGsOh6?=
 =?us-ascii?Q?mQc0d4Z88G5mMO6eIBit8MNXifMBJYB81zzMFZkZ6bnNkWwFVLqu1CETmDpc?=
 =?us-ascii?Q?7M68o9amQGmZ6pRcQTbyOdXzL1q332nOSaMZ3XUw5h+KflLPZ6wKNEeP4y+4?=
 =?us-ascii?Q?EQ5OlRwq+wQ5XQGWbBtF/Kv22D6aHtCFhmv3PTmZdyYYQZomx8My3NmWkzsb?=
 =?us-ascii?Q?ljN4XqwAaYHousOjQ4C34IlW1Ypto5TUSh+UBkK/7ZIvHh0VDyoqEXubseWi?=
 =?us-ascii?Q?KQGfz8YVS5HxLkZEpJNPxYpsde8peKC4y4IRnC5XQTNZIyFBRGD+tsYutWyb?=
 =?us-ascii?Q?aT26ZnprIqKLGUk1ckVB7l0+IoJNvyt/Vm88fTysqud/Mwd3nnwgUAr4vGo7?=
 =?us-ascii?Q?M/eh7FDVVuEgYm4nPJGsVbOAr8RsWDJckQ1CK7KeV8vQJqPaUtPv/k4fH0S8?=
 =?us-ascii?Q?asOd9VH/YAggrzpsybMUtsLwlqaa6/wQd/D93nO3A433f333PT1Taoz9Ads5?=
 =?us-ascii?Q?CZoLks6DwixAAJTaGUOozCvzxOOvueobpkNMPbt9dGk9jBrnxIZjobet0LJn?=
 =?us-ascii?Q?SdbO7Km01FDyHwEPE70rgak+jprpvpJ3h21Cxk4fzLqc1FNQZaqUWRr5FCy9?=
 =?us-ascii?Q?cLhnC3QAB7c2zMZW7yMJMuuG4PqryMLLt6DFwn6T+dTVusKbTZX7MFaDSkQC?=
 =?us-ascii?Q?1Z8UFVrlk8yGDWp6AfS7A3QdwAxCnsff/t2G1UOOtDcZUQZb+YG5+5WjxxQk?=
 =?us-ascii?Q?hlf5mwQl8HUe3eeE77C1Fj6tHuNmpm1aZvlZRKG2I0ejequ/yJ0/7v1DJM2w?=
 =?us-ascii?Q?N9z28+Jsfi8id0MgiR0kLOv/Hub6MTw8oWTUyMKMmJFqM2TUtMei46+G/Qdg?=
 =?us-ascii?Q?9JujUENoOshgHn09pJKt5VaDHWYQX1ft3BQMeM+5DmlmQc70AQw7qjJfV0tA?=
 =?us-ascii?Q?aBIOXE67ZVFbp5Z9+8lENlOfbya5Xcir9SC9JVjK0rz59riZ6sWt1uHHjjKx?=
 =?us-ascii?Q?rrUWA4cMTC7Dd63pBgQII5tvXzCmIWrQ8GDtmN6UDjTonrdvVXFZwKrPB0jN?=
 =?us-ascii?Q?3/wasl9VfOmUaG9QqfenqICnAmT6J4gvDSU1yiBOXE1NrK5ENtCziB+aoheo?=
 =?us-ascii?Q?oC/9/l+oLIYC49vNFjlgDYa2ldOnLLxCENAEN/UCTUY/mMv6gWqq/w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3062.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q+3R0hexV/yQfChC4My6k48zQrQ8wAI+rMu9bIFBgkAbBs4PLtKmjABbs8a6?=
 =?us-ascii?Q?EFgDiOPvbcgL1P/4j7OugbPTj5WVysQvAW7gMocIJPdSFP8pbwJqSxsAxgoI?=
 =?us-ascii?Q?4dveBlISjViHATewqKc5lENNEElLVQFTox7g4OOWJNwrtu/2ha7vqs6w/5lc?=
 =?us-ascii?Q?fDIw7zmO6Dx6Tv7mWEAPiJJOQ0KRJ9YyzahZ77twLH/llBvgWcMWUD0Ppk6p?=
 =?us-ascii?Q?ADwp+KxY41joWVi0WLwSf4dnWAfSfPhr3/x3gQctIDw+DKaVcH2dChtyHBsA?=
 =?us-ascii?Q?JOnj+rwGSQOWyFlXSJe9pjv8OBBtvBNeUrUBUoBGdrr1zAS26vsDOmapz/rd?=
 =?us-ascii?Q?o+jqg7zPQmH3BZ0u0B+ssuORRukymJunUuu6e8Jdiq8HUCKA8O/LUSpRWaSI?=
 =?us-ascii?Q?6fjTpf0W0MbNESGSBUawcDviM3FixOiieYnewp054efiPy7BggsvPpoZGY7O?=
 =?us-ascii?Q?h6quKhPgv1t/iSEgk3IJXBP0LFbUs5gPqS4pB/drzmOUYLEjWlQTDaVq9Lvk?=
 =?us-ascii?Q?sU6We0d3htxqnh+Ni9otZYyQq8IDRcgz62cHbJSjMtUt3l0/XV/nwUl0CmY2?=
 =?us-ascii?Q?QPp4ZXN/yiuPs3nMWrdA5AC3m+XGPsdmvdEaoSJSVmMDZXLaDBXw89AFiP66?=
 =?us-ascii?Q?A12+e+XBsFuGCrw1UXRk/T62HAb2mR98MnlGRNT5YrpfwVDswPGi/FcgyIiB?=
 =?us-ascii?Q?FhcjdAlQtmaljTdQ8q9XyZVxLVxxaTkmbeAUzkZpvfbR0sAmnKndycLT+9UM?=
 =?us-ascii?Q?LU5280rC73kIVcx9wWpbgLrFhddY36cQS6bb5Ulr4gkcYEnnz8NoRZgej8fM?=
 =?us-ascii?Q?Umnp6UTmf4spr9mmtj7thAkb+6xoSkz6Zt6hofcJz8K4yK+/Af4pPVrhx12O?=
 =?us-ascii?Q?gfCfNl6rlv2WlaPyBUzeUg/J8KhvHnSg29Ol0vILWqR2XPKsO2xlbu8TW4VU?=
 =?us-ascii?Q?VhlL5z0cmJRyzKtBNzfJbsM5UDYDZHpsbmRLS0ozECpe5zzgmTkm/2sxFIXZ?=
 =?us-ascii?Q?JPvgrj+LR08DQYZ2rTtIrt8ooJlfVhURdPKVw/kpFePkB2wqqPY4U1Y8ep1T?=
 =?us-ascii?Q?f3Bp8YP9N8adBbgVr3TlGtyyeQc/QFKbkYEB6XvJvCGCyw+ghtTXuASh+w/8?=
 =?us-ascii?Q?NehodLNkjeWuhBXaueljjmVnQO/sF7pSmMC2i0pdcVWVbtzRuTHE5gz/BWHK?=
 =?us-ascii?Q?64Kzeb5WM5gYXljOpChD7Rh1ZEU636W1HAKkEDnA2CecNWVZSWYuoFrbZ0Y3?=
 =?us-ascii?Q?YbrZUr1iNJVVw4lcK5NUsvIaZYbHIBLfT6O+kC1BDuIfEiHxo8whsSxcmZ5e?=
 =?us-ascii?Q?p0N4uWtF9lgBl39u32FWGRQzSPrEQBB3xW2ZnJUvo+YtCzHzJtXQ6AUWgFhn?=
 =?us-ascii?Q?fozU95sVG8F/NEWQ8aOGmqG45Bh773imhbmJBWCOutz3I7K7kfZzF2xXXg6D?=
 =?us-ascii?Q?Beq6/OXu04+qfRZB+8XPKyw9qOwRXCTpro77vgZgKas1+JrWP2vDynk4GIQR?=
 =?us-ascii?Q?SBRMjGEZVxJxEK8T7AgVBSix3ZrJle/hW+q69KtP7WyhKWn7guslH87CL7yT?=
 =?us-ascii?Q?k/VUFsmf0FayiyJHMDMqjdDI7s5laJgl2RxD50HK?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 183ff08c-9d8c-442a-302e-08dd9846c61b
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3062.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 09:06:29.6458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1GXjxtl1qx1kxEdeXiW8rTZCE5cFmZC0+3UUGcaTum11PoPogEqm4lX2SXeHfB3dgqsJp3WmKTvaIba5cuyFnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8088

The rtc-rv8901 has additional functionality (tamper detection).
To support this additional functionality the type must be extended.

Signed-off-by: Markus Burri <markus.burri@mt.com>
Reviewed-by: Manuel Traut <manuel.traut@mt.com>
---
 drivers/rtc/rtc-rv8803.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 1327251e527c..50fbae931cb2 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -62,7 +62,8 @@ enum rv8803_type {
 	rv_8803,
 	rx_8803,
 	rx_8804,
-	rx_8900
+	rx_8900,
+	rx_8901,
 };
 
 struct rv8803_data {
@@ -173,7 +174,8 @@ static int rv8803_regs_reset(struct rv8803_data *rv8803, bool full)
 	 * The RV-8803 resets all registers to POR defaults after voltage-loss,
 	 * the Epson RTCs don't, so we manually reset the remainder here.
 	 */
-	if (full || rv8803->type == rx_8803 || rv8803->type == rx_8900) {
+	if (full || rv8803->type == rx_8803 || rv8803->type == rx_8900 ||
+	    rv8803->type == rx_8901) {
 		int ret = rv8803_regs_init(rv8803);
 		if (ret)
 			return ret;
@@ -635,6 +637,7 @@ static const struct i2c_device_id rv8803_id[] = {
 	{ "rv8804", rx_8804 },
 	{ "rx8803", rx_8803 },
 	{ "rx8900", rx_8900 },
+	{ "rx8901", rx_8901 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rv8803_id);
@@ -760,6 +763,10 @@ static const __maybe_unused struct of_device_id rv8803_of_match[] = {
 		.compatible = "epson,rx8900",
 		.data = (void *)rx_8900
 	},
+	{
+		.compatible = "epson,rx8901",
+		.data = (void *)rx_8901
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rv8803_of_match);
-- 
2.39.5


