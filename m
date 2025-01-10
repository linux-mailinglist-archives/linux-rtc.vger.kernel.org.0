Return-Path: <linux-rtc+bounces-2864-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C95A08838
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jan 2025 07:17:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E2593AA7DB
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jan 2025 06:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94692080D4;
	Fri, 10 Jan 2025 06:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="nxGbnTjz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2089.outbound.protection.outlook.com [40.107.105.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1082080D0;
	Fri, 10 Jan 2025 06:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736489701; cv=fail; b=lV1FgzYsQkaxdUXlnyA74rUbBA/OzN2mfLg4fMjMVhA3PTbh7kBhz762Di9h0HzthkQcrum6rn/kCEKprgBsI93GC0Qfy46GpJ9mgfGhUQVdqZMGZ9Ywe8gOhAdhiCDJVH33ETWofGYAWgajd5aEFofQb3eGPZgw1JoWgctn+oY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736489701; c=relaxed/simple;
	bh=U9s20N05vEYWEDnwpWYvGo0rRIUg+r1CE7QG5PycW/0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dHD2rd7mGZZOaWCi6OS3AWl2nQdBB1VLOPFeqS0cO3lVYLr7umqgl2T+ubDNHut0l0XYx0V31MUBq4H3V7aTlBtaCEzmVour55G9+1Ty+HWAsXnAeIOtr3xB1w7yRZZrDX5nVVyGnAKjuhof/9Q/p23SDMgn+te/j4CZ0mcAVSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=nxGbnTjz; arc=fail smtp.client-ip=40.107.105.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1E1Yhp4zzs4aYj0xUu6eo1W4TzOq1X2iwHByyCp/Lemyap67FFI6qtgWj0V2Xv4WDFEoDf7XhWntOd/mB6Sd3joqtGdlCt+/eoVFBSsOCKiIar2f0V7cL3JXcwPRwoX7PTkAKljf2wZZQo1BGsr84jahKDme8XEJibwsVLhDx0zcO4T2rNH+mzg2YHC29kVh1HSPu5mfW8hE9fId3vSnX3yjnPGKEBTXC1XFwaZt5NY4ZdznFosSiYIqZGc+wNbTxy+qfiWKlD1kuRuLPHDrJ9SspUb/e4CPlZyzvSlKGObcYrurd47zbuHdXIB2Cn7mVzqDztSIRLD4kTXZlkeBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SoXrPOKQm1PlxTWqwNzYDDyvHktKoNWgTSCzqj7kUEw=;
 b=ZYeNbsTDJxuCgI7VNqKalNiRPACbf5GovrrZzKPJMMwGcRmslEZMld2hYD4mbrYcA1DUQgszbZPoq3Va2DTv92kLN6+T5dtIUI/S+obI43WqJDmw3nnUyXPBdAQHsp3dAEr/pK531RfWYSoOU8bDKAaReK9qLlj6R39v+qnwwNhhrnM95b1ighuw91AXoBdxwE1UR7OCipnxsdXFXwJIE6e2h9KVDEsGZZRnXoNtDqLPUuvXUIA4EW5LVc0lEIdy41UffSAFXcNcHMf2flYohyHytoqtvbBJOoW20uW3JchhFBoRxMsHC+pWqKIZt7eHgNxDT1R8V2Rm2+vlEsLWxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SoXrPOKQm1PlxTWqwNzYDDyvHktKoNWgTSCzqj7kUEw=;
 b=nxGbnTjzPXHzZfDuvR8/VCP+Q/BI3PGmpk+2zM/sESSjs1+BVos1brAmLvHqUq8LC7ilRrWrX7i5YmDm0uFqkrsloQsES4RfaBjE54SSPoJ3W4/+bYUB+Cb43GsZOcj7UwEHXWYmnukZY6VUH3uvuccOUnIwQU+cfx/eC5OiQWji3iF2tfgplX+Dt6DMSDMlFkk2ANhddf775qIPzUkkpIwuup0N+JHkPrv6r0TEp5uefGOSDoMNFl5G7dJXzAPwRaRVYZXdchK3g7Jj+X8M22ygJILT99Fxb6jKcduzVbSIhnwrkO7eD7Zvv8yLGMo1PUoGJfuQgrArl6Qq8y9Ehg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by AS8PR03MB6776.eurprd03.prod.outlook.com (2603:10a6:20b:29c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 06:14:56 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 06:14:56 +0000
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
Subject: [PATCH v1 4/7] rtc-rv8803: add tamper function to sysfs for rv8901
Date: Fri, 10 Jan 2025 07:13:58 +0100
Message-Id: <20250110061401.358371-5-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250110061401.358371-1-markus.burri@mt.com>
References: <20250110061401.358371-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0050.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:53::10) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|AS8PR03MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: 97d7e3a3-86e2-4d1c-2871-08dd313e1ad2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o/cdZ/aRrvRHQWT13cVnTTnD6MEEvKyqgbqi6QJGP7+5ctYDXsYylY543FtG?=
 =?us-ascii?Q?O13/G5kaTOJorOoeM24Phn8j8uFoAGnyR66TpDnpMtMp2sLdP9b/0kL3Le2T?=
 =?us-ascii?Q?OTX/YcwzwFheJLYzwo/tLCY7yBFYHDkcVQdR4n6w4NkIz5L70QuOsXldb21I?=
 =?us-ascii?Q?vbymIUtW/+vQIO0Kv4wWmHYYVvWUH3tuUfHpeMpqnHRxm5+wEjYFY8xondzJ?=
 =?us-ascii?Q?tkQ5CQcntIW5BQHRy6Qq1bJpc/ilEU+JEPlpCcNnkykwMDd+hSAZtQprglVF?=
 =?us-ascii?Q?poL1e//ItS5xXr0G8Bm6zd5ReNsD074CxsfJV8CkDy6f4I7l4JloWE0FnLzu?=
 =?us-ascii?Q?wqHdZEJpkud1IIG7vxejk7FDEyiNWfq4ShqAPBB3eKWyO5eYM0VhC8MzhDMA?=
 =?us-ascii?Q?J+uRlth7qfiWiApfyIDFS70ke5HR0E+K7D52lShy/mWcwcnxmmxd7N/qCTpz?=
 =?us-ascii?Q?L/hriuFQKfxFVsnv7VXg1CyXAjMlW2WQxpHnb6ahK496ZKMp//dFNJbeSl1U?=
 =?us-ascii?Q?iCEOjF5euZ6LOxIzgC3Ax1SfeF5aSCnpAPJMkVM99j/bLHa00ugTu21teJkX?=
 =?us-ascii?Q?rWJLuB1zlbyAuakNkME9uobQ/aBD9E5xuAtI6Lt4M3r9y8K5XIcOqerzWv1/?=
 =?us-ascii?Q?rX4gfxSOzxKO1xZYBwhlLyc2Vsxp9F122QvogErAYsM07SGiFZG4GMiyUhDg?=
 =?us-ascii?Q?9s6MJkRGpm6Kgg39J0S1ZX54maRWVBGts6SEW/PLfAri/FrgTtMCTYGKXGOO?=
 =?us-ascii?Q?qd7z5WvXUcHe8K4Fw8gNREfCCb49qA8TqzyrbhOeFUnLGQxG95YDgTqVm3wJ?=
 =?us-ascii?Q?c95d+3WL7wgtL1SHnG37RHOT76MAskyDSTU5l5EjXpdxiAKt78QKiMmR9efs?=
 =?us-ascii?Q?tFeOqs4OxssiCTk4SCl0ANeby5JfE1WkQ1bDUKRwEu5Hay/YwutBZaffZ2zz?=
 =?us-ascii?Q?IbDN3WzMKyRcAcTgJUxYmP7Sg3+lMx4kmPUmbRhKSajyPQaFvDOXw/7gqxt4?=
 =?us-ascii?Q?5ag1tISwkIPzo/Bnz2cKsfDAwdZDnrltl50goUBuPpXx1yDqcnbje+wjy5Fu?=
 =?us-ascii?Q?mckACQGIVAoxzUtJSdJoXdjXGVLFREgTXyMOi559C05vI9xahGr3AxZgxMPP?=
 =?us-ascii?Q?gcAtmrPoNjoYOqfj6mVVXAaET49L1uirphNXWBR+XIsL1eJ7W8scSvU6rOsH?=
 =?us-ascii?Q?ndY/JXnFs98K8iclhkeUt16x1DONpgO/ID5/nmIYWqUZWJG20sZQMfQrMH0Z?=
 =?us-ascii?Q?yETkoDfyJbyiO39MQkF55kDnvC+5iwdgWKCLi8OH+R9RK2io+BNP9dV8KOh5?=
 =?us-ascii?Q?cTfNQTriNt2tQOFapSXYdZwzEV54UdR7DupzBkcl3Qo0ZrCRyhPggeQkm72h?=
 =?us-ascii?Q?tJJJ4PMPJ3GwLMOQe88zmVXIs1FS8BkYr8KGBsYn1aXc9uMh4UbJxNmHAKAN?=
 =?us-ascii?Q?1JXnTz+kRKeJ2sW1wk7oxJhdVDPpqJgM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cm3LXDVfKK3BB17wV3uzTtVraIWeQnpTVRscoDWiL6tG+8YFMBnf++E7DvnX?=
 =?us-ascii?Q?IGzGbd12XFH9e4I6fzdG3u4eUwouUamQ7GcsGPu5tgoY1EO9gKqySBSLAasP?=
 =?us-ascii?Q?xemW8B3CiN+CnZJ6BXM3tEGjzsRT+4qBWGKqmmM14qxg/Y/nXVgo4pEB0Yro?=
 =?us-ascii?Q?P4zco542gxi7vldHoBoWbRHlynzlegqWJMsmzB4odQeTdbrZrRWbYJvBL8Kb?=
 =?us-ascii?Q?i7LNqPzR1qWSWkFi9AI32zTH5UHoGuMilMKez5LWJCU2l3kpknTjy3Bt8J/L?=
 =?us-ascii?Q?6KKgaGYI+6IZwTiAE3y3M4PnG85CmJZ57cKCTa2baRARkaZwjOEyi/cZNCjI?=
 =?us-ascii?Q?AdRqwYF5lLF8K/z41zJhTme7Myx9jdqNO+M4qP4WY9pFUwhtpPN5XzT2mQNM?=
 =?us-ascii?Q?phqARX555B7FlIQeRmdRVX4V+iLg1B/m6GIdQb8EnAMpxhGuRvyZxoyrZ3to?=
 =?us-ascii?Q?BggmNgxxS34+gyEt5wSu1DTmiHo04ekTF5u+Q0flZQFCY3M+6kQZ5iGK8a/8?=
 =?us-ascii?Q?wnyIb7FIYMUaFBpUgOpDYfDYkDbKo5hurS3XX6Haq+HXsb7Uwi5TBi2alath?=
 =?us-ascii?Q?BxZkENzvW29UpMP3OovBWvG02UN9to626WVLFxydPH4io1NehLhw6HszufjL?=
 =?us-ascii?Q?GCaOBrwcnHSCiS8BfWCKzT2YFuzIqOwMbeY145bqe+9InxhTLw1BaFIri1wU?=
 =?us-ascii?Q?cG7kt1Ev8r2r7uPsCwcU+bhoaoFySeUB8VR7ATVA47P/Jqu3rudYIP4Kr0K1?=
 =?us-ascii?Q?5ixqHLFUWrR5TX0x7uOZfDsdLZQg4sBMilGqWjus7PqjZfGUOx8k23spCN/t?=
 =?us-ascii?Q?ONrPfWCsU0FvRjoQGbGFS5BeLKvO2c4E5grLkifJcq3BGf0LZXo9r907yrjW?=
 =?us-ascii?Q?O9kkkiwXAEhP1TVUJumJSKM0IGbKCtLJ+nYCm5onegfoTI59ze5nTjLvhRUL?=
 =?us-ascii?Q?+5+ROXnzmbgOJxTaE37G4k0arD4NXXhQYsus0FbhcDraztn4crkMKXNdKCHv?=
 =?us-ascii?Q?9TgC6cYIcK4NWh/L/eGHZ+4vBkRbPzNsDiIE8EJush6fIrDmxoGbN9r7cPrO?=
 =?us-ascii?Q?C3XuO8I08AcIoi4hxUnI6QGBg3fYdFL7Et8mz6+c6vTHtjhHN2a+v5IQu8N8?=
 =?us-ascii?Q?Yej6yXMr3pb/mr9CNjQeAq4qG7cNmHODOD1pkgVAkFGMVvHXMwDFexrVLdHf?=
 =?us-ascii?Q?Tba5KhE8sA1HIkDN0PwM4q33vhEVYlF+w/W2So9Z+MzfjN/tG2iwmKW/aRjg?=
 =?us-ascii?Q?F/qYl596Xzq8/x0Ap9t1Z4CikxJlLaBYdCC08ehw5dUhlrorSm39IwLLCQ9h?=
 =?us-ascii?Q?YSRK+Afl866j3/7mzgq47ONMFK4welKIPcT3/gOmj9K5lpQ9pLWh6yT3HBmG?=
 =?us-ascii?Q?L2W0+hthziMa2O4+9KPg1nvkj7fBvRZ8VPh5///ADLfs9dnth7QQNb4HX9sj?=
 =?us-ascii?Q?xum1HqaWzxGSULkTlaGLrThYkEQowFVY8RNGFMMtqSZgZqfAQquB6L5G4A+z?=
 =?us-ascii?Q?PQKZl4bTtpR1OCxI6zxzeM4+1t/LJCf1aVI3aiS4YTjkesFhrUkF5fn6SzR3?=
 =?us-ascii?Q?abKKCkfHvvBTeDm/MzbYWtsigxu36o/k1ECBzUIR?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d7e3a3-86e2-4d1c-2871-08dd313e1ad2
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 06:14:56.5054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KSR0Om5pl9YPvh8rm5eMrvnALWfPh37fMvuiHqJIiqIgjYBN4zy+9z1ZemKbH1IJ4FzQYjLeAZRu6SIf/tzTIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6776

Add sysfs interface to enable the EVINx pins and read the time-stamp
events from EVINX.

Signed-off-by: Markus Burri <markus.burri@mt.com>

---
 drivers/rtc/rtc-rv8803.c | 277 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 277 insertions(+)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index a4f2f53..754657d 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -10,6 +10,7 @@
 #include <linux/bcd.h>
 #include <linux/bitops.h>
 #include <linux/bitfield.h>
+#include <linux/delay.h>
 #include <linux/log2.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
@@ -680,6 +681,276 @@ static int rv8803_nvram_read(void *priv, unsigned int offset,
 	return 0;
 }
 
+static int rv8803_ts_event_write_evin(int evin, struct rv8803_data *rv8803, int pullup_down,
+				      int trigger, int filter)
+{
+	int ret;
+	u8 reg_mask;
+	struct i2c_client *client = rv8803->client;
+
+	/* according to data-sheet, "1" is not valid for filter */
+	if (evin >= NO_OF_EVIN || filter == 1 || filter > EVIN_FILTER_MAX)
+		return -EINVAL;
+
+	/* set EVENTx pull-up edge trigger */
+	ret = rv8803_read_reg(client, evin_cfg_reg[evin]);
+	if (ret < 0)
+		return ret;
+	reg_mask = ret;
+	if (pullup_down != -1) {
+		reg_mask &= ~RX8901_EVENTx_CFG_PUPD;
+		reg_mask |= FIELD_PREP(RX8901_EVENTx_CFG_PUPD, pullup_down);
+	}
+	if (trigger != -1) {
+		reg_mask &= ~RX8901_EVENTx_CFG_POL;
+		reg_mask |= FIELD_PREP(RX8901_EVENTx_CFG_POL, trigger);
+	}
+	ret = rv8803_write_reg(client, evin_cfg_reg[evin], reg_mask);
+	if (ret < 0)
+		return ret;
+
+	/* set EVENTx noise filter */
+	if (filter != -1) {
+		ret = rv8803_write_reg(client, evin_flt_reg[evin], filter);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static ssize_t enable_store(struct device *dev, struct device_attribute *attr, const char *buf,
+			    size_t count)
+{
+	int ret;
+	int i;
+	unsigned long tmo;
+	u8 reg;
+	u8 reg_mask;
+	struct rv8803_data *rv8803 = dev_get_drvdata(dev->parent);
+	struct i2c_client *client = rv8803->client;
+
+	/* EVINxCPEN | EVINxEN */;
+	const u8 reg_mask_evin_en = GENMASK(5, 3) | GENMASK(2, 0);
+
+	bool enable = (strstr(buf, "1") == buf) ? true : false;
+
+	guard(mutex)(&rv8803->flags_lock);
+
+	/* check if event detection status match requested mode */
+	ret = rv8803_read_reg(client, RX8901_EVIN_EN);
+	if (ret < 0)
+		return ret;
+
+	/* requested mode match current state -> nothing to do */
+	if (ret == (enable ? reg_mask_evin_en : 0))
+		return count;
+
+	dev_info(&client->dev, "%s time-stamp event detection\n",
+		 (enable) ? "configure" : "disable");
+
+	/* 1. disable event detection interrupt */
+	ret = rv8803_read_reg(rv8803->client, RV8803_CTRL);
+	if (ret < 0)
+		return ret;
+	ret = rv8803_write_reg(rv8803->client, RV8803_CTRL, ret & ~RV8803_CTRL_EIE);
+	if (ret)
+		return ret;
+
+	/* 2. disable events for configuration */
+	ret = rv8803_write_reg(client, RX8901_EVIN_EN, 0);
+	if (ret < 0)
+		return ret;
+
+	/* for disable no configuration is needed */
+	if (!enable)
+		return count;
+
+	/* 3. set EVENTx pull-up edge trigger and noise filter */
+	for (i = 0; i < NO_OF_EVIN; ++i) {
+		ret = rv8803_ts_event_write_evin(i, rv8803, pull_up_1M, falling_edge, 0);
+		if (ret < 0)
+			return ret;
+	}
+
+	/* 4. enable EVENTx interrupt and VBATL,VDDL */
+	ret = rv8803_read_reg(client, RX8901_EVNT_INTE);
+	if (ret < 0)
+		return ret;
+	reg_mask = BIT(5) | BIT(6) | BIT(7); /* EVINxIEN 1-3 */
+	reg_mask |= BIT(3) | BIT(1); /* VBATLIEN | VDDLIEN */
+	reg = (ret & ~reg_mask) | reg_mask;
+	ret = rv8803_write_reg(client, RX8901_EVNT_INTE, reg);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * 5. set BUF1 inhibit and interrupt every 1 event
+	 *    NOTE: BUF2-3 are not used in FIFO-mode
+	 */
+	ret = rv8803_write_reg(client, RX8901_BUF1_CFG1, 0x01);
+	if (ret < 0)
+		return ret;
+
+	/* 6. clean and init for BUFx and event counter 1-3 and trigger cmd */
+	reg = BIT(7) | GENMASK(6, 4);
+	reg |= BIT(0); /* CMDTRGEN */
+	ret = rv8803_write_reg(client, RX8901_WRCMD_CFG, reg);
+	if (ret < 0)
+		return ret;
+	ret = rv8803_write_reg(client, RX8901_WRCMD_TRG, 0xFF);
+	if (ret < 0)
+		return ret;
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
+	/* 7. enable event detection interrupt */
+	ret = rv8803_read_reg(rv8803->client, RV8803_CTRL);
+	if (ret < 0)
+		return ret;
+	ret = rv8803_write_reg(rv8803->client, RV8803_CTRL, ret | RV8803_CTRL_EIE);
+	if (ret)
+		return ret;
+
+	/* 8. / 10. enable events for configuration in FIFO mode */
+	ret = rv8803_write_reg(client, RX8901_EVIN_EN, reg_mask_evin_en);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static ssize_t read_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	int ret;
+	int ev_idx;
+	int num_events;
+	unsigned long long time_s;
+	int time_ms;
+	int offset = 0;
+	u8 reg_mask;
+	u8 data[10];
+	struct rtc_time tm;
+
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	struct rv8803_data *rv8803 = dev_get_drvdata(dev->parent);
+
+	guard(mutex)(&rv8803->flags_lock);
+
+	/*
+	 * For detailed description see datasheet:
+	 *  - Reading Time Stamp Data (FIFO mode)
+	 */
+
+	/* check interrupt source is from event 1-3 */
+	ret = rv8803_read_reg(client, RX8901_EVNT_INTF);
+	if (ret < 0)
+		return ret;
+
+	/* CHECK for EVF bit */
+	if (ret & BIT(2)) {
+		/* clear EVINxF 1-3 */
+		reg_mask = BIT(5) | BIT(6) | BIT(7);
+		ret = rv8803_write_reg(client, RX8901_EVNT_INTF, ret & ~reg_mask);
+		if (ret < 0)
+			return ret;
+	}
+
+	/* check interrupt source is from event 1-3 */
+	ret = rv8803_read_reg(client, RX8901_BUF_INTF);
+	if (ret < 0)
+		return ret;
+	if (ret & RX8901_BUF_INTF_BUF1F) {
+		/* disable interrupts */
+		ret = rv8803_read_reg(client, RV8803_CTRL);
+		if (ret < 0)
+			return ret;
+		ret = rv8803_write_reg(client, RV8803_CTRL, ret & ~RV8803_CTRL_EIE);
+		if (ret < 0)
+			return ret;
+
+		/* clear interrupt flag */
+		ret = rv8803_read_reg(client, RX8901_BUF_INTF);
+		if (ret < 0)
+			return ret;
+		ret = rv8803_write_reg(client, RX8901_BUF_INTF, ret & ~RX8901_BUF_INTF_BUF1F);
+		if (ret < 0)
+			return ret;
+	}
+
+	/* test if there are events available */
+	ret = rv8803_read_reg(client, RX8901_BUF1_STAT);
+	if (ret < 0)
+		return ret;
+	num_events = ret & RX8901_BUFx_STAT_PTR;
+
+	if (num_events) {
+		ret = rv8803_read_regs(client, 0x60, ARRAY_SIZE(data), data);
+		if (ret < 0)
+			return ret;
+
+		tm.tm_sec = bcd2bin(data[2]);
+		tm.tm_min = bcd2bin(data[3]);
+		tm.tm_hour = bcd2bin(data[4]);
+		tm.tm_mday = bcd2bin(data[5]);
+		tm.tm_mon = bcd2bin(data[6]) - 1;
+		tm.tm_year = bcd2bin(data[7]) + 100;
+		tm.tm_wday = -1;
+		tm.tm_yday = -1;
+		tm.tm_isdst = -1;
+
+		ret = rtc_valid_tm(&tm);
+		if (ret)
+			return ret;
+
+		/* calculate 1/1024 -> ms */
+		time_ms = (1000 * ((data[1] << 2) | (data[0] >> 6))) / 1024;
+		time_s = rtc_tm_to_time64(&tm);
+
+		offset += snprintf(buf + offset, PAGE_SIZE - offset, "%llu.%03d", time_s, time_ms);
+		for (ev_idx = 0; trg_status_txt[ev_idx].txt; ++ev_idx)
+			if (data[9] & trg_status_txt[ev_idx].val)
+				offset += snprintf(buf + offset, PAGE_SIZE - offset, " %s=%d",
+						   trg_status_txt[ev_idx].txt,
+						   !!(trg_status_txt[ev_idx].val & data[8]));
+		offset += snprintf(buf + offset, PAGE_SIZE - offset, "\n");
+
+		/* according to the datasheet we have to wait for 1ms */
+		usleep_range(1000, 2000);
+	}
+
+	/* re-enable interrupts */
+	ret = rv8803_read_reg(client, RV8803_CTRL);
+	if (ret < 0)
+		return ret;
+	ret = rv8803_write_reg(client, RV8803_CTRL, ret | RV8803_CTRL_EIE);
+	if (ret < 0)
+		return ret;
+
+	return offset;
+}
+
+static DEVICE_ATTR_WO(enable);
+static DEVICE_ATTR_RO(read);
+
+static struct attribute *rv8803_rtc_event_attrs[] = {
+	&dev_attr_enable.attr,
+	&dev_attr_read.attr,
+	NULL
+};
+
+static const struct attribute_group rv8803_rtc_sysfs_event_files = {
+	.name = "tamper",
+	.attrs	= rv8803_rtc_event_attrs,
+};
+
 static const struct rtc_class_ops rv8803_rtc_ops = {
 	.read_time = rv8803_get_time,
 	.set_time = rv8803_set_time,
@@ -854,6 +1125,12 @@ static int rv8803_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
+	if (rv8803->type == rx_8901) {
+		err = rtc_add_group(rv8803->rtc, &rv8803_rtc_sysfs_event_files);
+		if (err)
+			return err;
+	}
+
 	rv8803->rtc->ops = &rv8803_rtc_ops;
 	rv8803->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	rv8803->rtc->range_max = RTC_TIMESTAMP_END_2099;
-- 
2.39.5


