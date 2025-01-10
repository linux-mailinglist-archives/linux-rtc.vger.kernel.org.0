Return-Path: <linux-rtc+bounces-2866-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10716A0883C
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jan 2025 07:18:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAF9D3AA3A2
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jan 2025 06:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8053E208983;
	Fri, 10 Jan 2025 06:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="mPV1wWcg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2083.outbound.protection.outlook.com [40.107.105.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFB42063ED;
	Fri, 10 Jan 2025 06:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736489722; cv=fail; b=OFOmjvLs2x2j4TdoVFJyX2ImoM9nSgEpNiE+TqdcJOhOozd83WSJlvVmd0s2ianV79+ex+YkN1rhec5EgCcuBYw/J85fXGP/UhQM3tH0XPnef2sdVzTNatHRPTKT1BXwNBbG5heB0hrbzSMa81hsuxr4+5gpB+HdABvUrYDDMyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736489722; c=relaxed/simple;
	bh=PIlGMSr+hB3fJvkHklHlCRcKNbg/7/vdkCH98qZR6wQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OjkaU5XGA/pUdoDP7J+D1l2CRc0sF7IqhUmXGYD0sOI2K1oFCPGSWAu683ZOgNbXm86Rupykf1P46OVUjN0RTCHo1FioRt/KbsFD111fThzXw83I448otHJWlDPSMA/G2IiNUOncAy2L9174gnlq4B6VHqE5MFBb/iPoptoRPP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=mPV1wWcg; arc=fail smtp.client-ip=40.107.105.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytuxOAaPi0ovigMTVi8x+R5vKCPus0nX/MCgZ7UuQ6EM2BB68G41Ca3nYgk9YB9mkVayil2nEPm27YZ1HoSIPnOxfCJlaZ7YHxHp50EK9yXWpIiwqtOUCs7opXKeXktcAvB0fbO/LiRxtq3ymTZWWMo/jq9g6lhoyNWD+gcwWOTFCFFX+fhI5zExsjjUaaBI08t5gtt9C11vF+ySNzzc0nxH9Ra64Ddop2vkTmraL4u6dJm+bXzU+1K1P9Tx57+1wz2yXioMPi8fn9bZBV9pH8suX2GxNk3c4Amszl24wkkWG2fRotmZFmrqzrwspkC8qxKCTWuiJ+5cxH9Z2PjJcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMxXhYba6ChG6oij5zrh0g/M7iYOxFM8s1C2Eiztkso=;
 b=dJzxAK1OXtTODDOYC9IJtW35mGwW9pA0TYoIQ3x51bhnM4WrNnlc0AU2/3qLOH/MfdWjynma9Sem9uRuZfIEyuxgVjpmQ6mb601P8IPbOq+hepc1R8oGvOJFBQpG/AWiYGsRJFq0WJS9FYDOOunKfTrYQCjPz8GKGoRvJ3+gnLUxQyNpV1dOfFVpuGA9+9ibWbCModki7+OluELumZbYC2nGLxFanJCppjBfxx35IiD6MuGSK2oWuGmODytHIPZu1Ob89v2FNQ+AmeABZGsyrguFNUgg27+f2/HF0pyZYazehFh/KQowdaxOWR5qSgoxN8YYGkGPqion46FGChgVkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMxXhYba6ChG6oij5zrh0g/M7iYOxFM8s1C2Eiztkso=;
 b=mPV1wWcglUsXF+DKjlVxsF/yLi2pPEUTSzP0U8VdHReGiLVbI+ywTr0K/rQgzzfnsFm0GzueD7c4I3/VRG2Wkt8UbcHLIHXbhlOckoY8pQlj9M7N+uROvbZugJSRw6KhNfZ0THHckCImtlOOutD6DHiAs6im5yBp9eNScmYN5iHHWOoyrnEnuW7U9xWG3Y2u1qNEomdNGVliTs6nItGBuJwwhIDZCaHf35Ngv66D7x1sI0cYxsquQuUe5T4uXUGRI0YyGGQsomF0XuoUktaBoGjwqcahndducikCPrSUls888kxBJeXnoub0QRBv8/2Djf+9YhDmGvu9ro8xJ/0CaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by AS8PR03MB6776.eurprd03.prod.outlook.com (2603:10a6:20b:29c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 06:15:14 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 06:15:14 +0000
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
Subject: [PATCH v1 6/7] rtc-rv8803: make tamper function configurable via sysfs
Date: Fri, 10 Jan 2025 07:14:00 +0100
Message-Id: <20250110061401.358371-7-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250110061401.358371-1-markus.burri@mt.com>
References: <20250110061401.358371-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0020.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::6) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|AS8PR03MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: 9186c7a6-475b-4e0d-e88f-08dd313e25b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5luGVM8Wr3bxu+/APRaTOFlT0g0aXgEzq8X9t8KlOBPikFZlCUhJAdTY7wIO?=
 =?us-ascii?Q?BJQSBKd+wynB022WYt3zj0NsfDL/vYf29gMS5lLZR52JMW7Ed4JNl4AuYemW?=
 =?us-ascii?Q?5o+4B1saVHqKvBmp36O04DXc3b6EZHgO5ML0zI0KeUnRdEP3nJzcbqgxZZ87?=
 =?us-ascii?Q?v9IAv8lpdKmzyb/J8mKi/+OSpDQRWAWiFKBUtiK4nqU1hui71EWUTiQ0raYn?=
 =?us-ascii?Q?pnEruonzB5QnPw55aqM0MxIk/dw35rv9utUa4idMzWt6RkNugLYrpJU1+tAO?=
 =?us-ascii?Q?Wa/JUq2guNzBzKPMSadIxf0gir1fj5X4YkEwNqsZ7PH237bPA4Ohzg0K6yMr?=
 =?us-ascii?Q?Y109gSlNeXvtB+wU9pRojHPDT/gZzCLLjt+KY6JrgT5ZmvwEGDOKjyUklKN5?=
 =?us-ascii?Q?jqE10BPI0wAr/9X/N1/Bafwh/VZ5sYhrCciQ4vn5Q+wnT/zDl2R8dN5FDZHx?=
 =?us-ascii?Q?HkHitrbMFfOuZDWDaeJ6NlmvggBgh5w/DwqJh92vfDH/Jtx9UhYk1Y0rJhBE?=
 =?us-ascii?Q?b/WD6Dl3DYIh4k9b3kOLMpgXzQw+UStCFlzqCDPzsyl87vdNEgOQcOHTJyjA?=
 =?us-ascii?Q?DhmRcrOA3KWZF/qqTO1adWT+rkyARUXPNBqtTTZJTqVefPEz9XEA78COpbtq?=
 =?us-ascii?Q?h1Hm6a3MWuItbB33orH83KoEXzV5iidE9ZoOp2yOqceuW9MFtdhqQEeXFMrV?=
 =?us-ascii?Q?XkUOOwhFXhHn/MOQhOMhdJ5G1ayXy65s0KMngEbSwVEuMW0rqtUlCrCTCIUS?=
 =?us-ascii?Q?FJWJi5mIOOUMVAWItkiEKewM3cCkJKyQiS2yK7nYXda24lNEnh/c5TXpqwCp?=
 =?us-ascii?Q?AaI4JzU8YCnk2CWn97KImS2BffESP0//qYiDcu5CvHiw7eGLRw1tkm2ZmW71?=
 =?us-ascii?Q?dm85y8+/UAv6JGwJGWNAAu8svifL+quWSApg2woxkC2BcXoPa6r9ccvmJKNC?=
 =?us-ascii?Q?UkxXPwgEo7YDSZHSSLHUDOtLOb9bfKVF8wJ9YEkQIX2MY7TDxZz/7GqXWDVw?=
 =?us-ascii?Q?IMologvOZkX920wy4mpp6ItVDbSaNBiG7eNGkvAGz7Kbw2GDhVWYByIMJ9Cp?=
 =?us-ascii?Q?tExN++oyz8REgg49lF2WQISwNMedyE4NFgtkLR8KGZHIiqVaN605bk34dtaE?=
 =?us-ascii?Q?HV3ltaEbY4pbbrLscSAzAVMwkrsKwPk9IXhoAzIMCJrTtGy/onjCkAzJ52b7?=
 =?us-ascii?Q?7wBsC2B2HuVA/agDD+3s0NwDMHTCVcaJJQ2G7TAimfl9kEt59bassK+xn1JA?=
 =?us-ascii?Q?3H1KSb5gMYA+DLHWrE6ysscTlAo5TjBXurdcgoYKupqlA1QdMfdc7iCA+3aR?=
 =?us-ascii?Q?WNjnU4ORf4LRmAGIettkxTmAxeNdZf2NxXNNMiUtlcF/S4iBSQ5Sia4NQdNY?=
 =?us-ascii?Q?xbyn/0yziSEv02wl42VdMx2qf3RcOkgv9r+nnMh7EljZAfaLdXAL/QDCGhPC?=
 =?us-ascii?Q?AlbFkkT9cN3yYFffchDjNgw3jC3+9aH1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lOjTpy3UzlfFvyzYlgeirR7RwIvEEJNeK0/fA6OICqh8FTDPIw8eVym0+jME?=
 =?us-ascii?Q?3a2VKIWjZxBX5auOh+wG45jP+mDsasJxBHxOY7iGq1IcO4UnqCTUOShPiyg5?=
 =?us-ascii?Q?Qe2c0kvVoJpS7eQIXpIT+zNq+//1StB+HQvrk/ftk90jFCyLP6TMLcazz+0R?=
 =?us-ascii?Q?k6muV7U8BXDCjzklfbG4Vf+Qo5aF+kKb808cfDxizR1eboDUu3T+KENx9Bya?=
 =?us-ascii?Q?HwicK9KoRhLbB7DtDhbAx6smVKfDkLjh5OAJ9QHC2X1t72YRT8dG9gpNYPsZ?=
 =?us-ascii?Q?fF0713k/lq/X5t5qIXQXBf33QqO5OAglyy12H9GoURoSXlaMOR1T9/0zUxOd?=
 =?us-ascii?Q?Hlw7UtAeYobG+16IgERERJ4nKBq6N8dxQJnVUU5r8ncdleAu//9VT/LgMYTt?=
 =?us-ascii?Q?pVCcPWB9h2XPRf7dJe8AJJ6eFCo+Raf13jq2iqR7IMcSGPimygRZARlL4rli?=
 =?us-ascii?Q?Gx/rOUxVqdfP5wYC8rGgCCKSRBfvAZRuEyVdOMeve5EcCk49jGD4N0BoI4Ho?=
 =?us-ascii?Q?07osahZcwBOqlatPJJHm71QEnh0m58nV0x4Dov/fNLkP29Y0oPucBlbkPavX?=
 =?us-ascii?Q?xoI9W1ZNVhUtBXbny+HgNQuZBU6iJ+hWK7GvmQsKG+79zTZzrXFw5Gv70tUx?=
 =?us-ascii?Q?7FG/FS8wD9eWYdIsc009YVGL4mOxsfsrPWemMxFBxkCiaqbpwVdobvtpi3xv?=
 =?us-ascii?Q?xePILLVaHfZKDWYDiQzc17K/ZVJzvP9mAd1WsiqfyUrXpoWIa9k6PrPs4Cor?=
 =?us-ascii?Q?wvxET9kjIIuEGqBnzzco4viQkQqlVncWMxy3eCKfjKQX83aqqWNZeDBYdDSy?=
 =?us-ascii?Q?HFb6iUtu3M4RC50aCWefmb49qTaphVZHGxN/hjBE6vFmJfMkqIOYYqCkLrqg?=
 =?us-ascii?Q?ROXNOLDejGmOwefwsXk6GWckfii+1aY6s5EJZgQQvjTeCdoHOe/8GH097qI4?=
 =?us-ascii?Q?QKYoECeu1an8oa+FSo5B7vNKt6CJbILs/TjB1K0OqNR+wrr8hKO1zRT6a0vQ?=
 =?us-ascii?Q?Mfnkgqh8P9MV6hA4wkY5ThxWz+lUW3sKN3Pon+Z0E52Rry16ot72/2Dxr6/z?=
 =?us-ascii?Q?unFI4J0l4EBtE4LOW3b3HGcJEPBiYhhnitByI2s2lon2DLQcetMzRG2vbXRz?=
 =?us-ascii?Q?yN3gRHftVsBZia6TXTTeETECj5xMqVS5PzIBZgJZdM4SaOGCJFPLp9CO51Zl?=
 =?us-ascii?Q?8lWUL4Ya2hw1oghd6NR7YtP4B6syFk7UlXTxkiA3dj1dgxuOVqHVw/8jvvin?=
 =?us-ascii?Q?+Cx7f1V1xKS1RciqmezRdOZVncYF1YNOnDkoyAxwvAn+A3FXMccL7Khsh7g6?=
 =?us-ascii?Q?tQv+RlOTB84yJpgtCxNXm1Sjap8oJSWSm+oTLikoMn6czfHO+lrq98KD7HKO?=
 =?us-ascii?Q?QXBfEF8MhJCY1UmdSnWA3WXUp6U9RLZEuSRlAkOls8ur0rF0v4QRaB/GAYRt?=
 =?us-ascii?Q?H6qjZ+1SfgxsXbM5jRKKq2g/ai2b9v6gyK8RbYYXljud8yR4lrCGBK3wLjNY?=
 =?us-ascii?Q?JDXhhaBTOTwg+gEhSmDEO2OAfOExcXUvJlUESDGmZMBhfBrd3iEmrlJ0WNnQ?=
 =?us-ascii?Q?xSTs3WyUYOOJjp73C356e0kbLatW6iDm9I0G6bhk?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9186c7a6-475b-4e0d-e88f-08dd313e25b8
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 06:15:14.8344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q4iqfW7mPNqhulFLLF8JuPxYrwR+fZtXvmaB5dB/VZA+PbyjZ17zdqsk3W/+neWAu/0F5Oek/FhfpKfYWKXvRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6776

Make the following settings via sysfs configurable:
  - For the input pins: input resistor, trigger edge, de-jitter filter.
  - For the buffer: overwrite or inhibit mode for the FIFO.

Signed-off-by: Markus Burri <markus.burri@mt.com>

---
 drivers/rtc/rtc-rv8803.c | 262 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 262 insertions(+)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index c479cc7..cc8aa53 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -681,6 +681,31 @@ static int rv8803_nvram_read(void *priv, unsigned int offset,
 	return 0;
 }
 
+static int cfg2val(const struct cfg_val_txt *cfg, const char *text, u8 *value)
+{
+	if (!value)
+		return -EINVAL;
+
+	do {
+		if (strcasecmp(cfg->txt, text) == 0) {
+			*value = cfg->val;
+			return 0;
+		}
+	} while (++cfg && cfg->txt);
+
+	return -EINVAL;
+}
+
+static char *cfg2txt(const struct cfg_val_txt *cfg, u8 value)
+{
+	do {
+		if (cfg->val == value)
+			return cfg->txt;
+	} while (++cfg && cfg->txt);
+
+	return NULL;
+}
+
 static int rv8803_ts_event_write_evin(int evin, struct rv8803_data *rv8803, int pullup_down,
 				      int trigger, int filter)
 {
@@ -719,6 +744,31 @@ static int rv8803_ts_event_write_evin(int evin, struct rv8803_data *rv8803, int
 	return 0;
 }
 
+static int rv8803_ts_event_read_evin(int evin, struct rv8803_data *rv8803,
+				     int *pullup_down, int *trigger, int *filter)
+
+{
+	int ret;
+	struct i2c_client *client = rv8803->client;
+
+	/* get EVENTx pull-up edge trigger */
+	ret = rv8803_read_reg(client, evin_cfg_reg[evin]);
+	if (ret < 0)
+		return ret;
+
+	*pullup_down = FIELD_GET(RX8901_EVENTx_CFG_PUPD, ret);
+	*trigger = FIELD_GET(RX8901_EVENTx_CFG_POL, ret);
+
+	/* get EVENTx noise filter */
+	ret = rv8803_read_reg(client, evin_flt_reg[evin]);
+	if (ret < 0)
+		return ret;
+
+	*filter = ret;
+
+	return 0;
+}
+
 static ssize_t enable_store(struct device *dev, struct device_attribute *attr, const char *buf,
 			    size_t count)
 {
@@ -968,14 +1018,226 @@ static ssize_t trigger_store(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
+static ssize_t cfg_evin_available_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	int i;
+	int offset = 0;
+
+	offset += sprintf(buf + offset, "pull-resistor:\n");
+
+	for (i = 0; pull_resistor_txt[i].txt; ++i)
+		if (!pull_resistor_txt[i].hide)
+			offset += sprintf(buf + offset, "  %s\n", cfg2txt(pull_resistor_txt, i));
+	offset += sprintf(buf + offset, "\n");
+
+	offset += sprintf(buf + offset, "trigger:\n");
+	for (i = 0; trigger_txt[i].txt; ++i)
+		if (!trigger_txt[i].hide)
+			offset += sprintf(buf + offset, "  %s\n", cfg2txt(trigger_txt, i));
+	offset += sprintf(buf + offset, "\n");
+
+	offset += sprintf(buf + offset, "filter [ms]:\n");
+	for (i = 0; i <= EVIN_FILTER_MAX; ++i)
+		if (i != 1)
+			offset += sprintf(buf + offset, "  %d\n", EVIN_FILTER_FACTOR * i);
+
+	return offset;
+}
+
+static ssize_t cfg_evin_show(struct device *dev, int event, char *buf)
+{
+	int err;
+	struct rv8803_data *rv8803 = dev_get_drvdata(dev->parent);
+
+	int pullup_down;
+	int trigger;
+	int filter;
+
+	--event;
+	if (event >= NO_OF_EVIN)
+		return -ENOENT;
+
+	guard(mutex)(&rv8803->flags_lock);
+	err = rv8803_ts_event_read_evin(event, rv8803,
+					&pullup_down, &trigger, &filter);
+	if (err)
+		return err;
+
+	return sprintf(buf, "pull-resistor=%s, trigger=%s, filter=%dms\n",
+		       cfg2txt(pull_resistor_txt, pullup_down),
+		       cfg2txt(trigger_txt, trigger),
+		       EVIN_FILTER_FACTOR * filter);
+}
+
+static ssize_t cfg_evin1_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return cfg_evin_show(dev, 1, buf);
+}
+
+static ssize_t cfg_evin2_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return cfg_evin_show(dev, 2, buf);
+}
+
+static ssize_t cfg_evin3_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return cfg_evin_show(dev, 3, buf);
+}
+
+static ssize_t cfg_evin_store(struct device *dev, int event, const char *buf, size_t count)
+{
+	int err;
+	struct rv8803_data *rv8803 = dev_get_drvdata(dev->parent);
+
+	char *buf_cpy;
+	char *token;
+	const char *startptr;
+	int pullup_down = -1;
+	int trigger = -1;
+	int filter = -1;
+	u8 v;
+
+	--event;
+	if (event >= NO_OF_EVIN)
+		return -ENOENT;
+
+	buf_cpy = kmalloc(count + 1, GFP_KERNEL);
+	if (!buf_cpy)
+		return -ENOMEM;
+
+	strscpy(buf_cpy, buf, count);
+	token = buf_cpy;
+	while ((startptr = strsep(&token, " ,\n"))) {
+		if (strstr(startptr, "pull-resistor=") == startptr)
+			if (cfg2val(pull_resistor_txt, strchr(startptr, '=') + 1, &v) == 0)
+				pullup_down = v;
+		if (strstr(startptr, "trigger=") == startptr)
+			if (cfg2val(trigger_txt, strchr(startptr, '=') + 1, &v) == 0)
+				trigger = v;
+		if (strstr(startptr, "filter=") == startptr)
+			filter = strtoul(strchr(startptr, '=') + 1, NULL, 0) / EVIN_FILTER_FACTOR;
+	}
+
+	kfree(buf_cpy);
+
+	guard(mutex)(&rv8803->flags_lock);
+	err = rv8803_ts_event_write_evin(event, rv8803, pullup_down, trigger, filter);
+	if (err)
+		return err;
+
+	return count;
+}
+
+static ssize_t cfg_evin1_store(struct device *dev, struct device_attribute *attr, const char *buf,
+			       size_t count)
+{
+	return cfg_evin_store(dev, 1, buf, count);
+}
+
+static ssize_t cfg_evin2_store(struct device *dev, struct device_attribute *attr, const char *buf,
+			       size_t count)
+{
+	return cfg_evin_store(dev, 2, buf, count);
+}
+
+static ssize_t cfg_evin3_store(struct device *dev, struct device_attribute *attr, const char *buf,
+			       size_t count)
+{
+	return cfg_evin_store(dev, 3, buf, count);
+}
+
+static ssize_t cfg_buf_available_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	int i;
+	int offset = 0;
+
+	offset += sprintf(buf + offset, "mode:\n");
+	for (i = 0; buffer_mode_txt[i].txt; ++i)
+		if (!buffer_mode_txt[i].hide)
+			offset += sprintf(buf + offset, "  %s\n", cfg2txt(buffer_mode_txt, i));
+
+	return offset;
+}
+
+static ssize_t cfg_buf_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	int ret;
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	struct rv8803_data *rv8803 = dev_get_drvdata(dev->parent);
+
+	guard(mutex)(&rv8803->flags_lock);
+
+	ret = rv8803_read_reg(client, RX8901_BUF1_CFG1);
+	if (ret < 0)
+		return ret;
+
+	return sprintf(buf, "mode:%s\n",
+		       cfg2txt(buffer_mode_txt, FIELD_GET(BIT(6), ret)));
+}
+
+static ssize_t cfg_buf_store(struct device *dev, struct device_attribute *attr, const char *buf,
+			     size_t count)
+{
+	int ret;
+	char *buf_cpy;
+	char *token;
+	char *startptr;
+	int mode = -1;
+	u8 v;
+
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	struct rv8803_data *rv8803 = dev_get_drvdata(dev->parent);
+
+	buf_cpy = kmalloc(count + 1, GFP_KERNEL);
+	if (!buf_cpy)
+		return -ENOMEM;
+
+	strscpy(buf_cpy, buf, count);
+	token = buf_cpy;
+	while ((startptr = strsep(&token, " ,\n"))) {
+		if (strstr(startptr, "mode:") == startptr)
+			if (cfg2val(buffer_mode_txt, strchr(startptr, ':') + 1, &v) == 0)
+				mode = v;
+	}
+
+	kfree(buf_cpy);
+
+	if (mode != -1) {
+		guard(mutex)(&rv8803->flags_lock);
+
+		ret = rv8803_read_reg(client, RX8901_BUF1_CFG1);
+		if (ret < 0)
+			return ret;
+
+		ret &= ~BIT(6);
+		ret |= FIELD_PREP(BIT(6), mode);
+		ret = rv8803_write_reg(client, RX8901_BUF1_CFG1, ret);
+		if (ret < 0)
+			return ret;
+	}
+	return count;
+}
+
 static DEVICE_ATTR_WO(enable);
 static DEVICE_ATTR_RO(read);
 static DEVICE_ATTR_WO(trigger);
+static DEVICE_ATTR_RO(cfg_evin_available);
+static DEVICE_ATTR_RO(cfg_buf_available);
+static DEVICE_ATTR_RW(cfg_evin1);
+static DEVICE_ATTR_RW(cfg_evin2);
+static DEVICE_ATTR_RW(cfg_evin3);
+static DEVICE_ATTR_RW(cfg_buf);
 
 static struct attribute *rv8803_rtc_event_attrs[] = {
 	&dev_attr_enable.attr,
 	&dev_attr_read.attr,
 	&dev_attr_trigger.attr,
+	&dev_attr_cfg_evin_available.attr,
+	&dev_attr_cfg_buf_available.attr,
+	&dev_attr_cfg_evin1.attr,
+	&dev_attr_cfg_evin2.attr,
+	&dev_attr_cfg_evin3.attr,
+	&dev_attr_cfg_buf.attr,
 	NULL
 };
 
-- 
2.39.5


