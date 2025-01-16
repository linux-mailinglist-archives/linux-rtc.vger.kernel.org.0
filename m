Return-Path: <linux-rtc+bounces-2934-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C354A13AAD
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Jan 2025 14:16:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3181188A341
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Jan 2025 13:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EC49225773;
	Thu, 16 Jan 2025 13:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="XGmYYlsN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2059.outbound.protection.outlook.com [40.107.21.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4DD22541B;
	Thu, 16 Jan 2025 13:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737033386; cv=fail; b=VQj/Ni2Q+cBCCfZTGzdwiBem7uTgtT2WNKSuKb5t3k5tBRUaNLfpTZMLiU0yzmOrTNiQImrxA69ECrOlUldxXUNy67oikDof+53YM5HsPdJJigB359g5V0pFJee4gUhtiKTRbVEgOREfdLS10DP7wP3kU9MPhiMCj1wDrrC42ro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737033386; c=relaxed/simple;
	bh=6K2Uh51MB5p4VfIC+OErlrf6f98kGPpVyzg3/jayVTE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pnVpHq6NV1WpGXyOsbdWaJAPh56Bn8Gl9kEUWNbuYxzcYLGTbL4JJlK3/ZEwfCget4gANwGA6Cu1+kBkYU+4aLOFmWTQwI42PgBRksRhKAmmGqgCd2TX0LVK1312fZF6OCb4siZrKS28kF6OAMAr7udexfG+KwSgEh9sBUlfoT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=XGmYYlsN; arc=fail smtp.client-ip=40.107.21.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=diAE2xgolusq9yIBznCUaotfZ1aCRgkrg+oLmE4uG2hjae+nVHpte6jHqK9Vacyv1rlD1LsysInLxwuDZ2NTLfe1zzSn+6YA52IOZEV2aH1zYo4U1wv/Me2xy1YauWJwxHclR20n53cT9aglb8zcSpcYAxnFarhCYPvNwmG+ENlSFz4I6Zfe7p5xdXNDa/KUK/BEpLxWBpxS8/Sp6a8AUZoqGtP430Rn7cZ1vK6zbTZG4SaRYTMlBCM4zDCRvtBDxihTkDDW1yYqtqwQgQgdqz7ogIpiGjGRA9lnkeEHj5VsyCcdAz+So/02k9qz/BtMNAZKUPgue+ghLhlK2kcMsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6KwZ6Wv5hOTPcpNAeEyK+Jq7culqJyz7hC+CDIVhGY=;
 b=hRBFoQktRrEJHGkMUKTe4w0mZoUS3L1gafgsH4bZEL0Delp4uvttLP7bGxyZq0xYfe78AjjK6ljwoC0Kz71d2hBsDLfyiIolJPdIYI0XHq+AWUND6HGNN9E8FYaRTi9jSFWmoZfHk2q5JSJDN/YKFb2nGcwEYvQEaYYieqqJ81TFI5tx4C/sKsLEdt3G34oc5l2cMvUmOpRqgytRrN15GFV7Ngx43HoFcZN21epLcHcPejN/yX5VK0afdToypFsVHVvAO2Y53SObsydrJHMor1FSVkfDPNufYj4rR847B6TQjrpywc1ei91Y1pke9LRnzXqEQCJpJu06hD519nR5sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6KwZ6Wv5hOTPcpNAeEyK+Jq7culqJyz7hC+CDIVhGY=;
 b=XGmYYlsNwnCJjlkSrkAe2cTdP7nBjwoqRGEf5WrUjujhe0qM69Iu/Kkw3m4e972o3trE6hDv0737LYBATcqM07KoQiGJtO6gak92P7xm3m9O+ibKMCGDwINvXtlYRoKM5jvcUEHxIHzGYtg5iHvjjHiHaihxIXBDQEqOWFORiFjULoaB5sjj2BtJ0qunH+XDI2QLo43KA5xkOZZ9Bv66zM+Juigwj5NVBLq70WFG7kuYda20s8RAcPPSzizUzTDzUh+cerPbAWOF3VbiKo1vdi5sNPmsFMYWt7zFkAbEBUYaxyTtusG9h7A0fiWO3ifmpM9h4xWnJlWdXOz7vPG8QA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by GVXPR03MB10213.eurprd03.prod.outlook.com (2603:10a6:150:14b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Thu, 16 Jan
 2025 13:16:21 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%5]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 13:16:21 +0000
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
Subject: [PATCH v2 2/5] rtc-rv8803: add new type for rv8901
Date: Thu, 16 Jan 2025 14:15:29 +0100
Message-Id: <20250116131532.471040-3-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250116131532.471040-1-markus.burri@mt.com>
References: <20250116131532.471040-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR14CA0007.namprd14.prod.outlook.com
 (2603:10b6:610:60::17) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|GVXPR03MB10213:EE_
X-MS-Office365-Filtering-Correlation-Id: c8cbb8e1-eae5-4542-1370-08dd362ff848
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rvzSQHqAcQLO/e1JNDjYtwjyCbW49Rnoo+tMB8iWCyRZRoTob+TUe/E1ngHr?=
 =?us-ascii?Q?ftYAZLu3O56W1p05MPsPWLGFS4Chl1wD6k76Uvk4+UWG0LHNY3EKJRF1Ej9g?=
 =?us-ascii?Q?dfuyl1euI/FVCSwZBtQ8kYCppSXaEu71pqq0GVw+ZZrXTR3cguW8oqRmGucO?=
 =?us-ascii?Q?2FCGaKE8nTye9ObUPFmALwVRL9W2OFcQZXYcQC43KqEZ9OKLmUkR05UeH4aY?=
 =?us-ascii?Q?ptzQkdj20f3xfvy1AidoRLtD7s9GP3Y44mqCCLA7hsChoqOWRXvTndywW4Bq?=
 =?us-ascii?Q?PFuqLWs6u7PYSVQJG9WSWn3Ia1BwMMWjB5UHe4osmRao4votoCtvKcbm0Brg?=
 =?us-ascii?Q?r6TmGlktxX9swPUMHIzfkCUfGpDH98mgdigGD1Tk4YbILwuoneGhZM2AXaDS?=
 =?us-ascii?Q?ZzHr5ITM9rIFB3TA9R7/OiHl/GH4tNgEK6wCeU+Oaws5NEd9Kn2uZn8zZ9Ui?=
 =?us-ascii?Q?w/C1Z3SsWZk4MAB1vxaSjblPKdnI6FdNlZMOei7P3vgMj4ocVzWV9cgHEdZh?=
 =?us-ascii?Q?he8r2FYljMJN4RMXs4bWIWytdL3tAEPAFVU/wNiSPMWqJ0KpTATPbjNgiDVY?=
 =?us-ascii?Q?/Hb/xoFVzYTxM3WjuSH8jS+VWvdYE5qtUpwqZzrFQb7A+/3jjK6CSPQbBAtq?=
 =?us-ascii?Q?qdCTgMvyi4X620t9V/C2jtiJzgd6yzSzbK2X277cV39KEwoNqibAKYOe/wF3?=
 =?us-ascii?Q?emO5w0GXIhaml1fKJVoOG1YIwkPHj/9JFU56EY8JFrPtAMxC5qoA8aT14id2?=
 =?us-ascii?Q?y8X3HQ42HBWS/LykfsK8uIGo/4lPnje2sJTXKtRG/PKUebGSvxfW+xDMMMKV?=
 =?us-ascii?Q?r2b70vMGmMJvaj6ZIo6ItMVBadDFfo62XIij0r3ZdACxE9z3bfY/AbrEdzhI?=
 =?us-ascii?Q?+Qww0oUZ/6AQUtGVY+9gH+F9EqNGkaGl1UC6y/jv/M0wUtiQ9zuSeS7MI+h2?=
 =?us-ascii?Q?TL9X6/lxOrxE+WMUusimj+NzOZVHX0i0UFnxg2uThuBqO0w5Je8PZzOnuT3Z?=
 =?us-ascii?Q?aOtCiWVOJkUWK9/pcZtC+iE/ePBm0UIeEKOT0LB+ZrWPI9NvBc/VXHyf0VNf?=
 =?us-ascii?Q?+PLaWz1Aff6ylgHVurrZeLiNe5AydjFuC7Lhu/2194Xx/Qxr0YEZvqOUQrGe?=
 =?us-ascii?Q?13C5kvI1j1iLr62NtItb0uE3MlmOGWWchT+Iqvz1m9vqxU8qqaDDnW1xXeSP?=
 =?us-ascii?Q?wk7EKEg3l5aqIaAwygk7zF67vJTSQWKQpWpVYX5fPGcggdhO+7rywAYS5kRZ?=
 =?us-ascii?Q?zjxWm0VT7792sFxcwZVk8n0PdZWQf6TR55a3K+e/xhme27wDRsQzN211EicT?=
 =?us-ascii?Q?33oitV149JMVggKPlUsdskYB+N/S/ScEHF64hGciiLKicVQTduoOpL7RhI5N?=
 =?us-ascii?Q?JMNzLVImdwj3Cg1jp0B8+WiN3vvtXSvvoWQHEPwWW4ZXHKTL8HsVIgvZr2+m?=
 =?us-ascii?Q?kpzrGCVsqq25RBC0mfRb5TpLwSya0RAe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CXIf7B0jR7c+v9rUWRP+mkU+84MBXLncuNffb+ZYOWU18UYeLU8/x/C726JP?=
 =?us-ascii?Q?yKx6hQaasPITi0Mv9w9goFflXFVIfSaoE8YOdL4lRTsOJs/g94uvHLaesS/D?=
 =?us-ascii?Q?77v5dFNeA03AFw6RNIIKZtaZuhsdHkWuXoBqK/iMWJ72XyI4iafMua1fEgvZ?=
 =?us-ascii?Q?rkBLL3Ui71mZM9wKeHMrhwgXRuXIgGgZE2ji5lYtiP0p7mN1yi6UaJP92dnt?=
 =?us-ascii?Q?On2J3pc/f8KlhHM41TdiTJuKmPjQjNhs1OKZf6q1rLpgVAnQs8w592GAPrH0?=
 =?us-ascii?Q?yY+aOZAiOT0rDpckfvaX/igdi3fCgf8ym26OUDwA/lksVZrYJnuzp61kjrP5?=
 =?us-ascii?Q?voKchq0hPVFUOF1lZnVU4Fz6Kvo6jdLwiyvEEyr+3in4nXXrht7z2PPzxx6i?=
 =?us-ascii?Q?rtYZo3CdebSy0HLfzTZGR4CFCTGR2LV3tGyprc93zaT0r87ds+7jM+EbUd/6?=
 =?us-ascii?Q?eZI6Iwj0+Th7GttyXEsURPl/YPkw7jBZs4D1gETdKpf+8mafbtvfCH2ZfKsL?=
 =?us-ascii?Q?nIT/IHOerAHAuvrSK3C7KGHbMpD7V8uF5mUQryo7ePxOYntawlRJ8oBn+Qgz?=
 =?us-ascii?Q?K8uCiYjkSO8ZmH01kawWvmU1neD/JEO+vfkp86QJnWNJpNujbs1ewy3y79Hj?=
 =?us-ascii?Q?65FBM0+IjaSLYDmWHffQRubBiaNXvA3SEwPbDxTl0+DpKCBpVlZgPLjMiGAW?=
 =?us-ascii?Q?zsHzncCVuuKP+S7h+DhmJz8Rv1iiUxyEw/opmQO1uoGuq4y9cyxdSJdYAPcZ?=
 =?us-ascii?Q?O8GGQ6aJAegZAFRLrDttHQMFoT6eJ7mLi6J0k0WY/KSQnbruKXQOIG8DswKV?=
 =?us-ascii?Q?orAqIIgFgKKHKToM59k0KI3Zq1x0miyjJS6KGWew0wIkMLLz/jVKqtvzhj2Q?=
 =?us-ascii?Q?TD0b0fvRF6NEa6q/JWp0jclofIUcKLy2/3fcGR/JjdH93Bf+J5RUQxlSb9de?=
 =?us-ascii?Q?5mUuJf/TxqjOUbF56fR/ua7bAHNYfg4SAYIrN+4sTwOPMcPzoFWk5FCz9aJf?=
 =?us-ascii?Q?7+MK7TvVYPQs5QmArvOkKtHsO3dKVFQDRD7rHn8d4CKb22vf2l/5ikHweHvB?=
 =?us-ascii?Q?1CF0d9yWSQB3iaei3dzXfPtX8dnGCHTjybPZOCCyBWwhmlGEwg8wR66ZLqgj?=
 =?us-ascii?Q?jJTJmKSttureGTfhu37I2gu64uu8cHcr03D5X3kmbN02O4cE7KV7nzPvK1fK?=
 =?us-ascii?Q?dSmiLXmnbLjmDU+5T1um9LYmq/FJO/GwRIXifgKzi4Px/i4c5mGs0geN2ZTv?=
 =?us-ascii?Q?nMRhBaIVVREqSBiEXiESH0xHJs9zwJ54BZPJR5sEIjpguC+mVnVNMWYBJmfl?=
 =?us-ascii?Q?aW97dCGWNBOJ12OwgNd9MvNH9Ah7V495HtXtk49UnHaFa2mrCVHlEYXdlqzE?=
 =?us-ascii?Q?oS9COWAkEwEqvSpjrWWJI0kymjJ4YsEGdG4bfidjz6DgjPRngsHEXo4xSnsb?=
 =?us-ascii?Q?CehNICFep0bCYppGJ92OJH+BW5hizkCKag/+Ttj7nZ6q120+lpQNssZ1BsFO?=
 =?us-ascii?Q?p0lV/G0vRiT74S4NXBF3wyM/oA/wx2BpIyTGi6DT1nyuXZ8dD/eB5OeIZ2L6?=
 =?us-ascii?Q?qxY7l+lH1m4IblHlMHQ7Q+CA72hdFm83eUj30CM5?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8cbb8e1-eae5-4542-1370-08dd362ff848
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 13:16:21.4409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D1qHggImx6PTq7squtkqAu6hYjw26Tl5RKIyygXjuSJC0DUbJJusB15UIFJozJVXK0du4meSGY5eDmeWUPfOMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10213

The rtc-rv8901 has additional functionality (tamper detection).
To support this additional functionality the type must be extended.

Signed-off-by: Markus Burri <markus.burri@mt.com>
---
 drivers/rtc/rtc-rv8803.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 1327251e5..50fbae931 100644
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


