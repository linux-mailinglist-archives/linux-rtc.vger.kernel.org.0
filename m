Return-Path: <linux-rtc+bounces-4129-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42440ABEF2B
	for <lists+linux-rtc@lfdr.de>; Wed, 21 May 2025 11:07:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F11EE1BA1B4A
	for <lists+linux-rtc@lfdr.de>; Wed, 21 May 2025 09:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5EE239E7C;
	Wed, 21 May 2025 09:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="xkKiicSv"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2079.outbound.protection.outlook.com [40.107.22.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B61C23A562;
	Wed, 21 May 2025 09:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818444; cv=fail; b=Tg2BBxSsC9aNOwlY4tJXFPvvQbK9vmF+TYSobjlHR4G/4fq276HvKwi9O6tH9AMtHybwyIJXonKqK9x9g/SRBzVn8+4za1ciUzkCVzG1VKUNnwQxGkfB6emmfvllLDI98dkROtXIWRzXnyVkf4ainMRdXLMjKjxFEue46xh5ydI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818444; c=relaxed/simple;
	bh=Ppe/91gWPFCURxQR2dJN7lEPhfGQOQrPY+1SqzH7S58=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tf74oaXBZGnRpWKPJOLJnLMiM24g4tSExaOXdBUonigKEmF4YVOoVFVPDcrsHYcCRrD3L2E9Dw/pXpoMLhDBUe1JUM01GpT9JWYRf3xgRr5xLoDVrGiSESH/qWM/U4ushBHYtTd8cg00FNK4pM2Zm8crED/g010eTqZdrYqWa7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=xkKiicSv; arc=fail smtp.client-ip=40.107.22.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r60iaFwXrXAEYAmQAnnIJxDF5b5r7WhDGH4gAykzKwbrnFBX5WfcGy8OvVytCZdOBt2nO4J24UMCesGfbCV3/dM2V0PiiXfOOUIeH823UcGiCdQk8uEBlHB/VZSSA04M0OAu/B6RlM86JnBj/nM+nfpNKrxbmgu+BB+WqajoXnburLDEz/ceDKq9pHRWEDp/hQROhfLyRfBqQiRvP0tJD+Cd6DkP10foOX76SSt0UA7XE6ROw6pywmsy7W4yIkC0kbIX160izhzCXQxoSeNx4fZyTnoxHYGFWQSpwkWPknb3Oy/1ByYps3CRY7X4N8VcVhfc8coDVAgiGByhitmX8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gEp0fYdO7cCt9gEMnj11S8aYPZfloz0/3CSjKw2bs8=;
 b=YsUnz1vY6snFJcXIJTMmh/LIw9oFsQ2l0Mf+AS8dhqt1n104Ghj2iwCoCaC4o/txOqdKSK/Av0CWCbGKUhf06/cpe2442WDX8XuOAeF5DjUDhsxXcyAw26/YgGEJj9rwX5/sQ321AWBJpFMI5/OhEEr9amnQgX93BmpwVhS03GrOUYdZxV1RZLH6VFS+FLzKIhWAhdMaIT/t74/DKrVrM+tf063y7U6iP09WQE1eL2IfDH8xs/zlCOctVgQ2/ngWkOWUP6N1JbstG01ABwib9qudCHuUn4qXszetqifobU9r7V9XDsj2DO1vUg36HM4984j39El9I2gD0SM8lWmvUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gEp0fYdO7cCt9gEMnj11S8aYPZfloz0/3CSjKw2bs8=;
 b=xkKiicSv6TSy6ZybfFQjAaviDAKfNPvzFU2TvNkNRMvivSZKuOBTu1NW7cL8fxavD6WSqvap3HzeTAq32w1QS21UGwTmMbdFNlcQugcpRiqh42aP/tN22D9ftBvxiSvjROJPA/Is2KUZTyRrCimSemmofT2nQ/VwhQqX6zzPc9xB1yA2IK7He6nl2bFg23Z7fdbwMqLLTsqw7Jepm3ZwZAKk00VZZDcA0iWwiF7kz9XO0a87HAxDzNSxk4tVcZTaGqJFoqNv3Q3eDZYY75IdiIMJgussg+B0tuvAh9Y1EKLOAiSeXmnTLa5BoiE6mbiXCLf/DrYjmSItsRuwJN1U2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com (2603:10a6:6:36::19) by
 AS8PR03MB9486.eurprd03.prod.outlook.com (2603:10a6:20b:5a5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 09:07:19 +0000
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b]) by DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b%4]) with mapi id 15.20.8678.033; Wed, 21 May 2025
 09:07:19 +0000
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
Subject: [PATCH v4 7/7] rtc-rv8803: make tamper function configurable via dt
Date: Wed, 21 May 2025 11:05:52 +0200
Message-Id: <20250521090552.3173-8-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250521090552.3173-1-markus.burri@mt.com>
References: <20250521090552.3173-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0075.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:52::12) To DB6PR03MB3062.eurprd03.prod.outlook.com
 (2603:10a6:6:36::19)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB6PR03MB3062:EE_|AS8PR03MB9486:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a81e9a0-79d8-4c1d-2d6a-08dd9846e3c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BisZDMoVvw7BZYl8l2OR7Mzcs8n+0hvujoBK4sO3uBy9XHYVuSShIZpO2aKo?=
 =?us-ascii?Q?s2unoM3dxH91y97v79by34rqMWZXGLrPEggf8R3lU7/W1uChXlSxr9ekMeR7?=
 =?us-ascii?Q?qVZ7Tm3F6+nPP3Xewq5jE7ErBlhgTs1Eo913Zwlc1yfbG4eV7UqzmR7aQL5W?=
 =?us-ascii?Q?aapL1ivTaUnBc91PmdrXihkeeKETDu4GFdgoOLTgFnjLBbkAAu/SdIftqXll?=
 =?us-ascii?Q?s7B2ypy2s/cztzCSPHGYI8bj6hAc6mH6CyZHES8iF3Jj4bjrivbfkjkf2Bzx?=
 =?us-ascii?Q?B7SOK9N2I1hKeBHnMn/lRip4sKYgPna1/MZ4GeZwUXFAdyCrb3O8NAiuNV0S?=
 =?us-ascii?Q?RIWuJdfvpknoOfkC10+mKMEF8v+8rytrLA3rOqAkZvCy67IpEK+Oi5NGfwEv?=
 =?us-ascii?Q?XJ2dLUlurIDQXnc05bl2hXAkCAZsra91JzUjxqRZzgORK7lF462mCTUcOYay?=
 =?us-ascii?Q?Px74mjAXdCXHQ9HdFdwCvBF6b+Eqjc6k4XAy8kPepIdpv4j5fdkcY1m4hUpK?=
 =?us-ascii?Q?rUId9oDg8w4o+7gF8Tz468SGmBkBmmZtngJBUsS/8QU1VOvCuRRZxXVAo1h+?=
 =?us-ascii?Q?SN5986c3iDkNos1LLfqp7pySfxl9YpBQCPbNCcIabLEDH4dF+Lt91g0RDQCZ?=
 =?us-ascii?Q?xIYm4PCc6haaS+X8V5oXBsursf517gi/kYqw0/pU4FmKmPKdKl7slR1NyP7u?=
 =?us-ascii?Q?9d+CMkFW8NFjPxuPITqtyvYlJA3A5JuVcRgA6pXmFqdi7CA5AX+4DsG9sB5U?=
 =?us-ascii?Q?0huC4DEMLr5il2Nob9zJrG1HFn7LUDn5dVa9YOMQjnCyXErsSMU7cZqh7lkd?=
 =?us-ascii?Q?FAjj8Frici4wwk0SZIRVB++sbcgMKGOHbEg1DvvM5hI20hVooJZH2ylnNzz3?=
 =?us-ascii?Q?5BAZwQawn3eqqF3TkDNkxxf23JDqkUGXnkGBrj+rN0coDF1FJQsjpgrcxZjq?=
 =?us-ascii?Q?OBncpa5G1rWO9gaSuxbjQrZRF22mfEcGihUqwIZxr1UfD2uYkVmc7qXxlA09?=
 =?us-ascii?Q?/e+56GigTg9kKUqufE7pdxpZvjXNYfWNoegxp6jSEOQpUjx+GVZHwKuC91x/?=
 =?us-ascii?Q?wTJ0Krso+28fPHO4iiGG9xdM2OJN4MaoZc/ZXiZA1sS00nCMFmOravywXiQ5?=
 =?us-ascii?Q?pHi36Q4p5PoI2kKnbi9GNsbPbX9V4mk8euhSxp1ACRGpd7DmiR3sLlEgyX0K?=
 =?us-ascii?Q?OxkeIgdbv9XftVa/OBZrfrjobOqyhdCdiI4PeIImYexOW5JESYTR8cztU0MH?=
 =?us-ascii?Q?oP1WF0ze+yJYN8N8DPKUk0lWrkTmE49Gstj+EjpYZ0RT+/rFq8rpqhY+vigU?=
 =?us-ascii?Q?L+u29favkDshgoN+SS4ee1UjWxeW4x+BfVgkmCduRsPFw5LciPk3LMFWy7aw?=
 =?us-ascii?Q?W56I5A7AYTlGyofj1eZ6z0myjS5FsaAaO8csn4+0pAni95AyWQWz6dhMRuJJ?=
 =?us-ascii?Q?LuBKpNN22Hm7FD+QwoWV9W1wbRlyXVYt0o5v73L9GagTdf7+V1JV4g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3062.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zHfTapK23TooWmBLicrhDa94V2ZThqmYGtds5iwIqx/cwD4/UYk1jWWw4/qo?=
 =?us-ascii?Q?Ugc5ScsiIQqf0/3VDpaDiZWEoy5e9qPKSMWIJEd9AXbjGHbpivAofWriLvrx?=
 =?us-ascii?Q?jZD3TcE6ENKHOPSMng3zeSiEJZFX4XiK4HasAllZtXx/+NwShKc2N1Wi5C8o?=
 =?us-ascii?Q?9Mu/DU76hOaHxNR1zMjDVYqu0Fb+CyJPnW9jytFBY5dLI8oiA2r36O37/XCB?=
 =?us-ascii?Q?2RZFQR27PwsyRDTE7ZvYDxOZsjRkZZuKACZswQn3+QtZ8V85jaH6lFVk13mk?=
 =?us-ascii?Q?zpJzi5kGW1poMa6ONhw8FQUoTlfSxu0DVi6+Aq510eCEHZwHqaBHD6aYOV9I?=
 =?us-ascii?Q?lZyzmRDWA+MEgchE/tB7wfEYWUSStVq00ZuZsbkcmO+5PICBAsrIU8Lz/gGA?=
 =?us-ascii?Q?P96R81Q3YYfi2ITiX0kvAWO7SxinUjyn2Y0SvXIgH1mboa0WzcUERgkEHnUZ?=
 =?us-ascii?Q?Y0ofzTc1bVXl1NN2reeVja7dHjHbDZj91WoZJY4wpluQr2vHZr2YveznUDWu?=
 =?us-ascii?Q?Oplj/lPm/zUOoYp78yCHyQg06BS317/l5HjBO2RF1kZWMJ9L+2r/6djw+21I?=
 =?us-ascii?Q?baoW+hiaPpWC0JfXXYe4odgXLPXJ2/zFgs5w8Ka1lnRgfVzz6ci124aucmHu?=
 =?us-ascii?Q?Lx+et4soBqe21sWWuBIRcKaNNYJZIXRDpzUcWxAkqSHzgiWcAbAZGhZzyMHO?=
 =?us-ascii?Q?ihvLY8bRzZh7ErOZOinCQiyH1HiEQ5LdJ9+X4KQgIEJmABAuGQKYSRhcfr6m?=
 =?us-ascii?Q?mKmf95xCDxhBmkVCiHMSK8xj0GzxN/qQR5gYTo/87+6FVFU19H4JipV9P0FT?=
 =?us-ascii?Q?6EhG8S18pMcRM6P5cEYhinu3F7HVPNuh/HJ+daPilGUJ92lX/qI9yRMHlArS?=
 =?us-ascii?Q?I2vElUCbotdyEoD69bPGqyGV4w4quZ7nfUQN0qxGIgVhrTmgjIhdUqU/d1d0?=
 =?us-ascii?Q?Csuw0+3DDElOy7d8qoJ0AxKH85rbhT7ysTVtiunFZreq1av2ITO9A6gbXE6S?=
 =?us-ascii?Q?wMEpHfc8wrq8djeuUqkfkSOYKNL3m/D4zURG7iRyvs8AGRDN8whTYwn6J4Va?=
 =?us-ascii?Q?cuNaw/9JdgYbPEIhBDLdmmTFcGXPUflxlvEMs3aRgMgWcPP1sxGO35hh0Pnx?=
 =?us-ascii?Q?l97zC/UmsV7mbTBsYTzPQwfqCfFOyb8cMDz6SAwmcisYU3UDL+8ML0pM5HMK?=
 =?us-ascii?Q?aONBauUsOq6tkqR6KX/j/Z32HG9NVfU8mOWzhsbSSSBENtn8TXjxHgRy548A?=
 =?us-ascii?Q?1eueMDobYkdwMI71bxTJfkXzrVs7hIg/mNbbNiSWE3zwit2T7bBGbZWJYpYx?=
 =?us-ascii?Q?a7hSfj9APPk1ZMfCgvl5sNzlGnMlBvJZRWgdVaa56uZ9zspEJevnP05q3ILs?=
 =?us-ascii?Q?sj7rcI0Nmt8Ax91zSDQfu3MR0lcYbv8AY4bnVkaJx2EXFPWA5hoQWz6WdFe1?=
 =?us-ascii?Q?VCIOgGB0QtoDry6VywHeri4MqJJZWQSYanCtDsayeeIXLlTNYIPRcoaxIHfE?=
 =?us-ascii?Q?Gj/7Te9rWpGcYOYwzI02WRrADoOvKZqm/EoBNl51fHAvCBWSXwuyT/z3XB0Y?=
 =?us-ascii?Q?zlpXzMNl5RqJkdZ+DIdk0EpsZsVxGHR3Yu+RJVBL?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a81e9a0-79d8-4c1d-2d6a-08dd9846e3c4
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3062.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 09:07:19.4095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JdCq6weGD9DFEW/GK1gHwd7jD66UlGT0mVLeClLYUHOCEWLdro6EgB0Z+QObv05+pMzLuau6e4rWhYB+YWglPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9486

The settings are depending on hardware connected to the input pin.
Make this settings configurable in the device-tree:
  - for the input pins: input resistor, trigger edge, de-jitter filter
  - for the buffer: overwrite or inhibit mode for the FIFO

Signed-off-by: Markus Burri <markus.burri@mt.com>
---
 drivers/rtc/rtc-rv8803.c | 95 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 92 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 39d5881ba261..e3a4e9eaccb1 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -114,6 +114,11 @@ enum evin_trigger {
 	both_edges = 0b10,
 };
 
+enum evin_buffer_mode {
+	inhibit = 0,
+	overwrite = 1,
+};
+
 struct cfg_val_txt {
 	char *txt;
 	u8 val;
@@ -164,6 +169,16 @@ static const u8 evin_flt_regs[] = {
 	RX8901_EVIN3_FLT
 };
 
+struct tamper_cfg {
+	struct {
+		u8 enable;
+		u8 pull_resistor;
+		u8 trigger;
+		u8 filter;
+	} evin[NO_OF_EVIN];
+	u8 buffer_mode;
+};
+
 struct rv8803_data {
 	struct i2c_client *client;
 	struct rtc_device *rtc;
@@ -171,6 +186,7 @@ struct rv8803_data {
 	u8 ctrl;
 	u8 backup;
 	u8 alarm_invalid:1;
+	struct tamper_cfg tamper_cfg;
 	enum rv8803_type type;
 };
 
@@ -769,7 +785,10 @@ static int rv8803_ts_enable(struct rv8803_data *rv8803, u8 enable)
 
 	/* 3. set EVENTx pull-up edge trigger and noise filter */
 	for (i = 0; i < NO_OF_EVIN; ++i) {
-		ret = rv8803_ts_event_write_evin(i, rv8803, pull_up_1M, falling_edge, 0);
+		ret = rv8803_ts_event_write_evin(i, rv8803,
+						 rv8803->tamper_cfg.evin[i].pull_resistor,
+						 rv8803->tamper_cfg.evin[i].trigger,
+						 rv8803->tamper_cfg.evin[i].filter);
 		if (ret < 0)
 			return ret;
 	}
@@ -787,10 +806,11 @@ static int rv8803_ts_enable(struct rv8803_data *rv8803, u8 enable)
 	}
 
 	/*
-	 * 5. set BUF1 inhibit and interrupt every 1 event
+	 * 5. set BUF1 inhibit/overwrite mode and interrupt every 1 event
 	 *    NOTE: BUF2-3 are not used in FIFO-mode
 	 */
-	ret = rv8803_write_reg(client, RX8901_BUF1_CFG1, 0x01);
+	reg_mask = 0x01 | FIELD_PREP(BIT(6), rv8803->tamper_cfg.buffer_mode);
+	ret = rv8803_write_reg(client, RX8901_BUF1_CFG1, reg_mask);
 	if (ret < 0)
 		return ret;
 
@@ -1125,6 +1145,71 @@ static int rx8900_trickle_charger_init(struct rv8803_data *rv8803)
 					 flags);
 }
 
+static int rx8900_tamper_init(struct rv8803_data *rv8803)
+{
+	int i;
+	int err;
+	u8 flags;
+	struct device_node *of_tamper;
+	struct i2c_client *client = rv8803->client;
+	struct tamper_cfg *tamper_cfg = &rv8803->tamper_cfg;
+
+	rv8803->tamper_cfg.buffer_mode = inhibit;
+	for (i = 0; i < NO_OF_EVIN; ++i) {
+		tamper_cfg->evin[i].enable = true;
+		tamper_cfg->evin[i].pull_resistor = pull_up_1M;
+		tamper_cfg->evin[i].trigger = falling_edge;
+		tamper_cfg->evin[i].filter = 0;
+	}
+
+	of_tamper = of_get_child_by_name(client->dev.of_node, "tamper");
+	if (of_tamper) {
+		if (of_property_read_bool(of_tamper, "buffer-overwrite"))
+			tamper_cfg->buffer_mode = overwrite;
+
+		for (i = 0; i < NO_OF_EVIN; ++i) {
+			char of_evin_name[10];
+			u32 evin_val[3];
+
+			snprintf(of_evin_name, sizeof(of_evin_name), "evin-%d", i + 1);
+			if (!of_property_read_u32_array(of_tamper, of_evin_name, evin_val,
+							ARRAY_SIZE(evin_val))) {
+				tamper_cfg->evin[i].enable = true;
+				tamper_cfg->evin[i].pull_resistor = evin_val[0];
+				tamper_cfg->evin[i].trigger = evin_val[1];
+				tamper_cfg->evin[i].filter = evin_val[2];
+			} else {
+				tamper_cfg->evin[i].enable = false;
+			}
+		}
+		of_node_put(of_tamper);
+	}
+
+	scoped_guard(mutex, &rv8803->flags_lock) {
+		err = rv8803_read_reg(client, RX8901_BUF1_CFG1);
+		if (err < 0)
+			return err;
+		flags = (err & ~BIT(6)) | FIELD_PREP(BIT(6), tamper_cfg->buffer_mode);
+		err = rv8803_write_reg(client, RX8901_BUF1_CFG1, flags);
+		if (err < 0)
+			return err;
+	}
+
+	for (i = 0; i < NO_OF_EVIN; ++i) {
+		err = rv8803_ts_event_write_evin(i, rv8803,
+						 tamper_cfg->evin[i].pull_resistor,
+						 tamper_cfg->evin[i].trigger,
+						 tamper_cfg->evin[i].filter);
+		if (err)
+			return err;
+	}
+
+	if (of_tamper)
+		rv8803_ts_enable(rv8803, true);
+
+	return 0;
+}
+
 /* configure registers with values different than the Power-On reset defaults */
 static int rv8803_regs_configure(struct rv8803_data *rv8803)
 {
@@ -1266,6 +1351,10 @@ static int rv8803_probe(struct i2c_client *client)
 		return err;
 
 	if (rv8803->type == rx_8901) {
+		err = rx8900_tamper_init(rv8803);
+		if (err)
+			return err;
+
 		err = rtc_add_group(rv8803->rtc, &rv8803_rtc_sysfs_event_files);
 		if (err)
 			return err;
-- 
2.39.5


