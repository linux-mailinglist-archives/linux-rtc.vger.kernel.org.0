Return-Path: <linux-rtc+bounces-2862-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE16CA08836
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jan 2025 07:17:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3F933AB773
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jan 2025 06:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C6A207662;
	Fri, 10 Jan 2025 06:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="i2OJTawM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2052.outbound.protection.outlook.com [40.107.105.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61251207DF5;
	Fri, 10 Jan 2025 06:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736489684; cv=fail; b=UXMK0BaTI+TH86cU4ht1NZ7mGi4rOJ3qKSXQ5gX41OCCgbeQe88tmhWOSPQDeiqEU+4wQgSgZGQGZKQ9ko0Gd1MQcUMQefKI96YYIlhJhneDt0b87wsgbcC4L3mOSLRQpO66bZ7SYZvbdmfmycFBOdLN4ta9r38zcCD8CLlDTbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736489684; c=relaxed/simple;
	bh=rN5NASk6TBVah8D7CgCQscbWcL6qVR6nSbEz/GhqlIQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e/g1DqHSctQztVYk3pKdi3YQboVPyqVr/xYLmFUVa/WzYhJ3bV+M06VCjenTBIQR8o4sb1qNfoHYS5nQB28GhQha4H/0toaAY7AlCUTiTMk19Lo3SdrA7BAQgAqEvqkXKtxEnU/FxfubqDgvNcyiCcoUrWT5amWjmssOT2sf3c4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=i2OJTawM; arc=fail smtp.client-ip=40.107.105.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=djWEJArGjMxXFeKRZ/GEATs5Y7QnNzlC5gNAyofFhsCJ7EKsHZiRcnxUrdPa05ptWot9VxD7A8AGnQIHRhAVTBx7q98Ie3QWngy+esy6QY4R66ZRZJZnBUwKlC2l6gQnPNaHIXO/JYK7xsxoxzq3DBF13K7bR7n/2dfn/NQJ3KeLYS2k7xERlgxi0rfZAONI21pWyxGod3aakKgC8dR9sSSHWbm18StR8YXs2xlg/oGd9N3RfBysYVWWMa3BvbAOfHW2qv8gSYJKavj65sF8ZmFQsa2wLwyLUVyPVTnEHOYhhUGWoSBAK5qilBe8+SyWGCy1gbRc6E8O6g+DrOyQYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSyTv2f0OuDaYrIQSJb07KQnzdm2oP6ExQj/EZ8/+Og=;
 b=nGxBFiPhx9W1NEXjoY4DCWKyVLNAawc3oo6dRal203LkXe+NFeHlcHIgUc2MOnMSLTkB9EHTNHrNPc7oYjCJoExU5vKncZ0EGLS8wRv/i5C7MQLhTS+tIvIsjh1n66fAJDF/Dk2Tgl3RCawtYlOv4uE7IpFAeXCVcKyl3iF0Vh7jMvOQVZys9mJsNvr740fpgcZE9raeINY12JbPWtrR8Ke6fPvmR11J2ewm9u95yR3HLB4yehm2nZre+tuuEmKRanVIxSBLLet0/HcdFYkWCOBbNxgoN9XmgVoTLUPvGpuEYtaSQs3yM4vhbyLPCVGd2r88nGJbWWkwvMGaDDmC5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSyTv2f0OuDaYrIQSJb07KQnzdm2oP6ExQj/EZ8/+Og=;
 b=i2OJTawM7ZfSNV1oZZh3nmhNcy4zltZ4qFbosYejOKwF3kYi5TA/TrgdfM97ol8M/OG2a9/8B9YUCpXzvKzdLn1vzjqdZeE3L5IGLp5oJ6jx5HjrjHuZzrr43iBdpcHNFHUg0QcTk10RPObzquV7NsBBEe5QPjpAaE1MF3D+fe1YhYWFQgj1NgWWb5D+y8/b5/xoVfbqXDM3DbwL75Df1t1qS/pYmWMG/YddVpAv2EQPm9QKhHZ2EC5YR/H40aTgjpRZI7Lw+EjcifNIb1nGv2K0moWx5oHDZvYEUkhpkuYDAaCXEYqfiY04LQYHTPZtkdiEE3M2xDxAYBTzNaN1WA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by AS8PR03MB6776.eurprd03.prod.outlook.com (2603:10a6:20b:29c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 06:14:38 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 06:14:38 +0000
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
Subject: [PATCH v1 2/7] rtc-rv8803: add new type for rv8901
Date: Fri, 10 Jan 2025 07:13:56 +0100
Message-Id: <20250110061401.358371-3-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250110061401.358371-1-markus.burri@mt.com>
References: <20250110061401.358371-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0090.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::23) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|AS8PR03MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: e7c2768b-fbef-4931-ab36-08dd313e1047
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Zwoav6oAkKW7mXupg9JAOXsfJs/JuPGUKj9Jlf64bAec5lmt8D6OhTOMzgnM?=
 =?us-ascii?Q?izLsGJUUM1ajgvhIL1y+yeXOY947EGxiVlrUcE5tsQSoxcbHyhpZ84aEcK6E?=
 =?us-ascii?Q?dLn0fRYUOt4Knxdr4z0x1sRMp106NiXgGlgCmhVdzpDJb5G8B4Nmiohkc8cd?=
 =?us-ascii?Q?UJclRkO+Vfw0UQVgthFbCIGrv5LEdeCrOSy6PK4bXMQk9C7FNmd4WQDVtLaz?=
 =?us-ascii?Q?EPfI+D48oWIctXA4CqySlRjpb+7ok3McPRSDJYio70UFzXLna4hBLaavlg00?=
 =?us-ascii?Q?FMV91ily12jFNzytHg9IhM4TIp/19oIbsTeSH0PBddMlXUUwcOgEo+a6ZuMt?=
 =?us-ascii?Q?0OUtE/I8VUk+0KeFrxjCMsaXsfBEbL9AIVhXmefSUowo3pVcpiI2Hw2C/VAU?=
 =?us-ascii?Q?nVHH/I3g9X9nwZQnZG3iNi6N7opd7Tuk/v2tJfD7pd1u/4I9eCpOosmI+c0R?=
 =?us-ascii?Q?0+9ZrsJD9iM0Jl7rn0e6++CVzz+LcnUOlqpG7y16necC+ZnVAdPfuxlXgAoc?=
 =?us-ascii?Q?sTUFnZmUV7ftkTCv6f70nZ/xFv9xlO7jNe2/OZpTWqzFUMEaMMVKl+Ex0NJS?=
 =?us-ascii?Q?WbjRG1rFBKZVmhSU0yZ7DcDMrDNMhWfxFKsXfdBcIhR1x5XJ4Zl7lJ0zr3Pf?=
 =?us-ascii?Q?paEZGr9Oc6PvNeqm1TA+QOSkXXhbeHzvnI3wCzk3lFfPafuupfM0erOj3iCz?=
 =?us-ascii?Q?vHbfA7sxMc57WgfPtsUruisisKdwlWwzfNa1bXUU3ZgCZxp3W+OXIiqJPmT2?=
 =?us-ascii?Q?9/Mwrryj4LJo6dpnwSG+/C6FAs57jxUw+aWKXi0KDzYL5W1gsHx3/Eq3KlSj?=
 =?us-ascii?Q?A/4EKujNAyHvhn865COBq2F5R6SDmzHL9DjjcNnIzb+QC5OvSePBPu2qr2SN?=
 =?us-ascii?Q?fC4gql72/XYG+ibN5+kt9sFLaNcP5z878gb0JjzCKek+4Wi1sZm56Ubyx8NX?=
 =?us-ascii?Q?VRD9/P8m00LWXCAe9Ibv3kftcLFTMxVLg7M/EygsHwsaO3QpBuBPpcYceg/t?=
 =?us-ascii?Q?bbiHCZwPisZ2JtUq9CGl84ypeVGI5QPidfHdHhuzXJIo5m9zZLjPtdhrff6N?=
 =?us-ascii?Q?KUqOWhfN0ArB2F4ZJSeLcSKa17nuBXeMD6FuOXxv1W5BgqDYLhJfrDUnmDOG?=
 =?us-ascii?Q?hVjvJJdyKZshFBLHroMsLKCuCBWWLnOjntn1juTM5jnddUQutA20cKy4g76H?=
 =?us-ascii?Q?WG07ktN7bJuDTtVILto/9UQvHoIJhJE6iwsb+YGIQ2dRODUqwbCr/mEKR3O4?=
 =?us-ascii?Q?Jij2MGcvMjh1BNMqP4BVWjdkWZcNaXvOrp3wGuZRgqhm74xF75e754inqEHZ?=
 =?us-ascii?Q?kmLsu4BmNcPOnXG+unDh+bDtac61tjZwsw9tNG2j00luFzwWQXQfjgBffuYE?=
 =?us-ascii?Q?CZMPQNxF8GuZlQKu5osNEQlvU6fSfihbSd5xkDbZpP7fqcSzi28/Jc42haiK?=
 =?us-ascii?Q?jZzQ71wXqME1uavbt3z3Ou/AJ4eMC31e?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q4hNNA4alkzF4FYxsnf8HwSGsM0TrziS+lyoYs/nO30oKTrgPCfXOxUKTP5e?=
 =?us-ascii?Q?h7cjWKH8EPrWE7j4/F1U7i/PNkC7G+Mt9PT3qrhpnmjkddVRopO0gg2Bz2w1?=
 =?us-ascii?Q?4Rf5flWGSTkEkNaSQznoT2XI9zT9Sg2F9TqorfHrI3SZfJwV+PZes1bKyAVL?=
 =?us-ascii?Q?bpMntz9VnRSjRlVvruMNmDW2357OOgYfcjk4h27xM0Bjq14EFPy5GQvwkYAu?=
 =?us-ascii?Q?rbOLQafjAp0wLcuPYIfm3Tek8VPEr4YfYHWg57p+YGv0jPKurCulrqxBHxyb?=
 =?us-ascii?Q?Sooa9Pw21LukYe9FFtBR54mTA4291yxDWDddY6/mNJWvhwrGB+KK9A3wylN7?=
 =?us-ascii?Q?NlzCF8PSfXeTA+6DldUWTLe+TE7wFeT6zuTgOfpcLiStnKhJjOrOkJ4TaF01?=
 =?us-ascii?Q?JnwhYtTBr5KePdQ4O7rywI517KRJ5X7Ku8/9KQu/CdAYX2/gCf6Blq6hsG5S?=
 =?us-ascii?Q?fbVcAJDCwFoN7o9034Z4Fkef+8ED+qhD2blJOczqMlC+NxZesNM1kJoll6a3?=
 =?us-ascii?Q?BHlfMZktg0si5czGy+FGpi6EswL4mi6SDxzSdQjKFcJ6mAhHv0R0zL6JR4G+?=
 =?us-ascii?Q?kyR9NhEg/D7b0lZVfr4bXxxLbTaMz7ZYySe7yg7wBuYymMmujoYg/1Sho9G4?=
 =?us-ascii?Q?ZKdFDvLkp7w2uuiKltcYdSyUF+onoFT2K4DoZGg88SyfFC96BxFK8jY4dmbh?=
 =?us-ascii?Q?ayIE2B7lKj2Ao/RtuEQzXzFe5ED/EIXS9H6Tp1dQE+b1gLoIQgZfGfkAPVFy?=
 =?us-ascii?Q?w1W1zOAkHafH8tgegz8r93MA3pBN1ifnNyfQIESaevKK1DzJh4MpBjToHaOg?=
 =?us-ascii?Q?DaOhtW5vv7Pml5aBecwMQCsZ+sHSNPB4xi9YKjvlm5wwdnNstbuqqCDK+Nuh?=
 =?us-ascii?Q?EJ+G9wod7Vurr0QvOpYOBjx0DKBKqZdGoR6mPmv094yhlbBAP5Dx6R6b/I1N?=
 =?us-ascii?Q?JXhQyJsRaWssZ4nJ3Yx4lkfY+v5kJUFMLlmvRs5+GjcRyT8vXfJLDhcW3/rG?=
 =?us-ascii?Q?ECi7e45qI0whe6dZ58FUueE1N6pd/Xxdz3SiBPFEWMh/hQ76Bc7uxI4lyL5G?=
 =?us-ascii?Q?5LHzZiiXqhQV1fiyfZgJ3fp/moAEFncYHj6HPYsKzchyV8L4CC4OglgpSFH/?=
 =?us-ascii?Q?9xOFgohHM1Loa37oOs9j0KqKnXf09RAK6B6RnDKbQOOrWHBovlYi2P8KQX6N?=
 =?us-ascii?Q?aFQheF5336VNwCXP/Hp2vpJ4sI9so+zFonYJ2AiMmiwpKyRiNpkUANQqNRBm?=
 =?us-ascii?Q?ckAfDNvKLJWpDJiA9ov7uakpQGiwZOldETAkWLbnE8NQjUmEK1oZ2HCmF7O7?=
 =?us-ascii?Q?/gNo8aVIujBk/DIL2cPuQbtU0E3gChu4pG/xdbos9wuVFV9ZPMvKhbDtsHDw?=
 =?us-ascii?Q?0fi27oEBAAYitwuabhsvHfkihVIqidIsxiL3reVjZiXPcPjv6BtarrI93wwD?=
 =?us-ascii?Q?Ne9KT9ZiwZgmnOctTM8GqHp4BZKo/H6/q+z3inaX0qizCbY02Sjz5u6m1fxR?=
 =?us-ascii?Q?U3sSDcKdJ1NB43ViFVPdBjCpZ5T5zf1P1zYGJb/SR0t7CbHLapUiLmxuNr0/?=
 =?us-ascii?Q?gfTZukvf89O8wLZy3KhHqyVJuidUQEpGvLY9WSxu?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c2768b-fbef-4931-ab36-08dd313e1047
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 06:14:38.8196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BXT+GIqDbAQhZHKQuxYMk1Cs+7kqGrF4xFE+YQw7qsCgh3F0Ca2xYrafQiemSYXSF5N3UcwDLGn4FpCc3rkGlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6776

The rtc-rv8901 has additional functionality (tamper detection).
To support this additional functionality the type must be extended.

Signed-off-by: Markus Burri <markus.burri@mt.com>

---
 drivers/rtc/rtc-rv8803.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 1327251..50fbae9 100644
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


