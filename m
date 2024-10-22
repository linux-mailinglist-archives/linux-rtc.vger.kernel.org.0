Return-Path: <linux-rtc+bounces-2269-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4539A9E7F
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Oct 2024 11:29:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95CA92838F5
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Oct 2024 09:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CAB81991C2;
	Tue, 22 Oct 2024 09:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b="T35031iI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2101.outbound.protection.outlook.com [40.107.22.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811BC1991A1;
	Tue, 22 Oct 2024 09:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729589363; cv=fail; b=ZoRcxui5oxzrG3TEhkNORXBhLTG1JHmlu88oV3Z2fTErAeGVKUKn8W+n+yDaf5KI7QiiyLEOfKPHOFcwJL+q4PVW1qr/RNuFfIgOo56Tv8HxsuUO5LQQAwVGl9ofxTrVafpaFbJ3J75eXaZJINFpjFAmjxKlCYuCU49kwY2c2Vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729589363; c=relaxed/simple;
	bh=IM8j47t5KOZJQd2QHzrMpnu24SQgbmSSZz8a7bCFkrg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kGPvzjKXWBjRjYTsqxuGaO8Heu/hRd9dRrVTZM7F797C6UDrR3b9voyDHPtOrndFrEbfrMGd7Fp0m9/KZVexEvxm/KczN2DRPRhLa47wKbeScdipdnswU3qypE+iwvd/EwWUMrAdak9PkKQZcDLGhjEjUPFkP0eb699ljb1kNcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com; spf=pass smtp.mailfrom=kunbus.com; dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b=T35031iI; arc=fail smtp.client-ip=40.107.22.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kunbus.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJWYYh0tWsYFf8UthTIC01BhV0ZmB9cxLNvTeuDD1Dw969ezzZ0FHYanlXcP8txGCBmXxdBQx4Ar9CB4sfFago4MDohJiSZhfIvb/mIb4ERBiy9IpJhsdvnGThtAQAbzH7Y3Jn+8OYWG0JauRKK31si/LigesH2Yh8tfAX2arJtSw/akyBQRX57F9yvIOvAlOuzJq/JYZN58CgDhqwbMM3/YnqkM7m4mymssgXrZDQaIcx5BjtfEN/UkqOlVb6unPakoF31eBOul9hdzAN2DG5xP9rS72++bRqjg5NZK5TFTWHJR9R9sgKUadiffb0eefAWeBah9LkdnjRJwZdFH9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCl/u6nKXHeBMlHInu4rPGYoi6zoCU6VtdJFDh6X2BM=;
 b=HTHj6CRu4ZynCF++QEX57Q4rBfsv5Vv1D20q4oNpsEgheDzj7OY5AXEacfgUwubW6mxKJiQz9QarNXBqNBGEGWyd+86zFNFQFRAKJbbRxofHc+p7vXjdD1Ce6ifnZxyq5+cVI15v1mrRkVKBe6kd3K7q629yg20vLg/gVGLbRCH3yrIg5/rq8VC16VGqvt0LYTqyob+cfhfGOjEFjP88v25jolsEUqmrHhtwjarnk+vQ3B+XpIseAW22poujDicqwPP4teUVe9/D8ubnBvsjifUeIXwQj4cGsYVOqMfG3088if9zptranyt3KUbzQWDAPmVznPsN8oEe14jrmQ2XIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kunbus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCl/u6nKXHeBMlHInu4rPGYoi6zoCU6VtdJFDh6X2BM=;
 b=T35031iIr+lshyxxNMl0pbRlcP6EuaA5EkAgwdtBS5XYb69DmN1JBEXuOyksujlGBdmNV1JQSZJObdJpgHB18ig8sk4yhIB8WfPVh6RoWRzgPiKVwEhM56wdg0kEzFw4y/gYGw1XmsebqpQ5MZwgf1qzewkJuZpZbc2kcArMHWw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kunbus.com;
Received: from AM0P193MB0738.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:160::8)
 by GV1P193MB2407.EURP193.PROD.OUTLOOK.COM (2603:10a6:150:29::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 22 Oct
 2024 09:29:14 +0000
Received: from AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 ([fe80::2398:d74:da85:f90]) by AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 ([fe80::2398:d74:da85:f90%3]) with mapi id 15.20.8093.014; Tue, 22 Oct 2024
 09:29:14 +0000
From: Philipp Rosenberger <p.rosenberger@kunbus.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	Philipp Rosenberger <p.rosenberger@kunbus.com>
Subject: [PATCH v2 2/2] rtc: pcf2127: make battery switch-over configurable
Date: Tue, 22 Oct 2024 11:28:55 +0200
Message-Id: <20241022092855.1609427-3-p.rosenberger@kunbus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241022092855.1609427-1-p.rosenberger@kunbus.com>
References: <20241022092855.1609427-1-p.rosenberger@kunbus.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::19) To AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:160::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0P193MB0738:EE_|GV1P193MB2407:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a9aa4a5-bc5e-477c-6199-08dcf27bfe57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yf2oiop878SV3EqYJwVZOWXTUtP5MgfYjkqW9Gyph4Fc2WhYOyJeRMsRzcbj?=
 =?us-ascii?Q?Pees2ewYa7aS9KUa5cPb6DmwvJD1JWODdEPvkmsLNWOHFiRyCDI+KtuIlJK2?=
 =?us-ascii?Q?Y3KrS5G0yOzTFuOmuvagSjc5LshIlsnw3BKGtjgKXLr11LWOPymBXF/7ohn8?=
 =?us-ascii?Q?Asx0eYfKo3lh4Ulo8/hq7MYO6ljhAeb9vebEZ71lorfnstXDdecw2Pnel27C?=
 =?us-ascii?Q?ZzTqyOdQi67rF9FyhvBtEGY+koQ8hngsag3v0B11BTUD6W4qXStbYLbe8MCV?=
 =?us-ascii?Q?ltr1VSSOmzVmh5mMFJ6xSXw3zDEknswSBrjksSaritu0Rpnugxh2C3Mki1bx?=
 =?us-ascii?Q?VXGNlsfcH3kLd5V0PFt8TGehq36vNNGfRPus5AAnH6A/5MAPFVhLeC+WpF+S?=
 =?us-ascii?Q?6jXpSb4C7WdoC3csQ2yXj+vQIrlbDiBf9C/xFG4rSIGsE8BCtJ2UuSNnHMFq?=
 =?us-ascii?Q?C+/K6Y6njqSAaiQXWWB8tjkRa5toCktNjK2cC9EQ0RQ+5+z/GPe9j5cshX9B?=
 =?us-ascii?Q?gk5wWdvVp+Ev/DwQFaUy1tZcTaYBD1DZq4BOyBW34NS+SNtOWL2B2Nx7bLg2?=
 =?us-ascii?Q?fX2LjTP9d5pDwWyl1ipPdQyMfJt2zF0NzFDkxwl2R4zXpTQmEPsWB5Obvshn?=
 =?us-ascii?Q?HshEGRA4v6yb6wp/ON7euPpYaXVhjYvcsrBseYpZqX46tc6BJaoshqt8Gwc7?=
 =?us-ascii?Q?6MHcQfw6mkS8s+rPpaAD/5XDVans3fTEKMHNaScssYJ7xHHBo86g70Q26Ynd?=
 =?us-ascii?Q?ETilq4I2D01unf0lsf9JTMeQ4Rs+QKVvybNr5xzqU7iDCc498jrAHGwX0DRY?=
 =?us-ascii?Q?N6xezQtoHXmBPZR0h0QFGMps/iE5F2whG1LPkq8NLCbQzCH1d3A8odzQpetQ?=
 =?us-ascii?Q?76+/7ZEvMKDLkDd0+q+rcGOqgsB9hzPvFVDpRgDeGkUPkbs0Pnw6sK4Jjtvz?=
 =?us-ascii?Q?009GFto9zbqnuzSSrYRsrCwWCNKnB6xrQagymfqo+Ww6qPs25gbR8mCwCQdh?=
 =?us-ascii?Q?2OAlpd+NcA9NOWGIAu/uFv9AF8FoIZYsjSxjM6gcGEc/XCID2vQcZQUQTeyo?=
 =?us-ascii?Q?TBNZp2YH23f46OQoaNa/4ypemgvKYs2l3Htw5KFFaUorbv0f8BDy3GLHFzvU?=
 =?us-ascii?Q?gD/p7yQ/sIvSMW30+CtRD5zDg8HFRRREvVY1+2l9NXewafIaKWOxTnw8y8WT?=
 =?us-ascii?Q?IVsF2hHZu+DNSNQajv/n1w0hX3W9gDvJeGuWGeQ0jby+FXOfD3Bn892D/y28?=
 =?us-ascii?Q?uUu2YiBzO6kXaiAuN5MABDu5C5l65QaI5DE1KnjawXZ8LIjaaL8wa7x81jsW?=
 =?us-ascii?Q?5AWmdA0KvmOMnYXgyVvtT8TGV5WsjMqf35YyLPe8AVaxEiOyPwOcwbWsHe6x?=
 =?us-ascii?Q?o/YtU1s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0P193MB0738.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ND+LNccVyJJ9HcLHGigXeZwSqMQRUkLw94PkFlqxvponhuU7AO42yw16GidW?=
 =?us-ascii?Q?CYozE7s39ICpxYZbcBfVc1iIFDHBJ6DTKEtlITfVYVZvQMegerohLBAcuyyI?=
 =?us-ascii?Q?UNT11ITd08i7eISVPjO5IWw7pbxVlbOlzuew5pN6IfBRdbIbXTSunIr+tpQx?=
 =?us-ascii?Q?NVnX5jRu8lto8Zoaz/p3mKCofzUR4N+ZxrLjb92r+WaQ1bSR6dS8xdhRkm0H?=
 =?us-ascii?Q?Jz6vz/BnamrA6S7Duojuix/dKjC/r04uL5ZFb6qZz9epJv06GfAB3i3EvROA?=
 =?us-ascii?Q?wl4woNQzmcCS88X4l0iC/C0wqJJE7iZ86zmUo1ZaCbAcjx4GaKbFmZnS/mOW?=
 =?us-ascii?Q?MbtqDdiA8Ic4YsHV7IEWF7qCcdYSOLmd+rcGxtt3/wZJ8b5HnTuGW3Q3+2re?=
 =?us-ascii?Q?Fs3y9/EraZr50/IF++fB3gT2h1sQhES6FiG6PiCnYeH3zl62rCj0ZMCY2ymJ?=
 =?us-ascii?Q?v3VYeUD4jNdZ6F2murpEefPfmBLh8erWwkbSbIq+JSMg3SwQ2ZvhRJZvtqmh?=
 =?us-ascii?Q?JtiM9rU6mzMh7frGiToqAy28c8ZfKxsSQL/NZvrJYhrl2T8B9tZBQPcyMwfA?=
 =?us-ascii?Q?bGZQtnIVbF2AB7y3ynWPp9sFt4QYAM8WIFhdcZahWzJcOOKXlo7dFWaRNzKz?=
 =?us-ascii?Q?q4YLYgW8bw2/DbLKDEM5nRgP7cxBU818CYiDvyXu7N6bEFNg0QHF9MArpStY?=
 =?us-ascii?Q?9FiBurP2GH3+RtL7k04yMzmX/O+6zXmGKt1/IMp9e0EdhY8ysdZOTavzZ2ju?=
 =?us-ascii?Q?rJVmUdHQOaYXgZli/Vi4cxAZ7RFzrDfze2fhU6JzI2zqRABZCTrSVY510Dz2?=
 =?us-ascii?Q?wDWaW/dqGRTT/SOrNXJsX18n97e1Vpyj1iKpT8JqH3XnKGEWr+Y5HoVqVRpR?=
 =?us-ascii?Q?dSwIo+vd15l46tpxNDCle91MYBlUVQqKtR2d+1yIxQ0/kss7FLJJHSxqjDy8?=
 =?us-ascii?Q?IMfIQFhNu5uwBQKk4T7QAghw/RdMSamiJF/tcBy4tUNSOTCmCljei5M3hgYp?=
 =?us-ascii?Q?Zy7/zl60KPCpTVL1Fo2fz79Ul6OhftjG7lSmfpk4+8gGVFeRapWu4GhT2RgG?=
 =?us-ascii?Q?ZSdK317f4pDZOWLDRcJXz/krwFePbFG8LgUzWIRDn5SpYPER/dowuIbTsnHC?=
 =?us-ascii?Q?dVrmQwkWl8kYk8HVqfCQ/QKjIjvn40D3cAhSEqPSn2wQui2ONbdcFjpoXAQC?=
 =?us-ascii?Q?BQ4oDzSL2Lq1SbYNhpx2qok7CFXCsHkjKS92dOXlsydg4Rrc3o4oVgMJ7QJw?=
 =?us-ascii?Q?szn7o4RoDW/+8321RakybQbUBIxp6CpkjYUQo9xCM/phzU3n/8CEJoKF277B?=
 =?us-ascii?Q?0OHDnirKsre8Q7uyVcMWofpAA4nIGAr4GQAQyfSljEetsY5c5Tu4lkSXX59J?=
 =?us-ascii?Q?JNL5vYtEhwh3mPsycAqbd/wN46Vk/FXUV09W0nNhRoUyEr4/97dsAnIWm3A5?=
 =?us-ascii?Q?WYH3pD+dnQkPMUeeh6ljQ1Esz6efymQPvHEQOoCQYlZbEcTIEik3oPs/C+pv?=
 =?us-ascii?Q?0HAUeIqx4vM/3n8H/Wlngk9gaOVIiZOAzPeAUXonvI/2BreNo7jSX2T2nN+5?=
 =?us-ascii?Q?njSkmK8LNQ/MuektpF6eq/0QHNoNU5qPCGtZsLfgs5PKvYOEAJSrgcScPDoC?=
 =?us-ascii?Q?Ng=3D=3D?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a9aa4a5-bc5e-477c-6199-08dcf27bfe57
X-MS-Exchange-CrossTenant-AuthSource: AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 09:29:14.2889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I8YovUuQeR62ATffT1XY6FIgjFI1oTztcU5Qmg5h15TB7cSalKfUWv+yfRFes464exIZY9LWJWxzG/JOy3RX/aDpBCThT3c+qXrwSECQIFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P193MB2407

The battery switch-over function of the PCF2127, PCA2129 and PCF2129
have the opposite default behavior as the PCF2131. If the PCF2131 is
used as replacement for one of the others, the battery switch-over will
be disabled.

Add nxp,battery-switch-over as an optional devicetree property to configure
the battery switch-over, battery low detection and extra power fail
detection functions.

The property reflects the value of the PWRMNG bits of the Control_3
register.

Signed-off-by: Philipp Rosenberger <p.rosenberger@kunbus.com>
---
 drivers/rtc/rtc-pcf2127.c | 61 +++++++++++++++++++++++++++++----------
 1 file changed, 46 insertions(+), 15 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 9c04c4e1a49c..812764b65b34 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -48,6 +48,7 @@
 #define PCF2127_BIT_CTRL3_BLF			BIT(2)
 #define PCF2127_BIT_CTRL3_BF			BIT(3)
 #define PCF2127_BIT_CTRL3_BTSE			BIT(4)
+#define PCF2127_BIT_CTRL3_PWRMNG_MASK		(BIT(5) | BIT(6) | BIT(7))
 /* Time and date registers */
 #define PCF2127_REG_TIME_BASE		0x03
 #define PCF2127_BIT_SC_OSF			BIT(7)
@@ -529,6 +530,49 @@ static int pcf2127_watchdog_init(struct device *dev, struct pcf2127 *pcf2127)
 	return devm_watchdog_register_device(dev, &pcf2127->wdd);
 }
 
+static int pcf2127_battery_init(struct device *dev, struct pcf2127 *pcf2127)
+{
+	u8 val = 0xff;
+	int ret;
+
+	/*
+	 * Disable battery low/switch-over timestamp and interrupts.
+	 * Clear battery interrupt flags which can block new trigger events.
+	 * Note: This is the default chip behaviour but added to ensure
+	 * correct tamper timestamp and interrupt function.
+	 */
+	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
+				 PCF2127_BIT_CTRL3_BTSE |
+				 PCF2127_BIT_CTRL3_BIE |
+				 PCF2127_BIT_CTRL3_BLIE, 0);
+	if (ret) {
+		dev_err(dev, "%s: interrupt config (ctrl3) failed\n",
+			__func__);
+		return ret;
+	}
+
+	ret = device_property_read_u8(dev, "nxp,battery-switch-over", &val);
+	if (ret < 0)
+		return 0;
+
+	if (val > 7) {
+		dev_warn(dev,
+			 "%s: ignoring invalid value for nxp,battery-switch-over: %u\n",
+			 __func__, val);
+		return 0;
+	};
+	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
+				 PCF2127_BIT_CTRL3_PWRMNG_MASK, val << 5);
+	if (ret) {
+		dev_err(dev,
+			"%s: battery switch-over config (ctrl3) failed\n",
+			__func__);
+		return ret;
+	}
+
+	return 0;
+}
+
 /* Alarm */
 static int pcf2127_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 {
@@ -1224,22 +1268,9 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 	}
 
 	pcf2127_watchdog_init(dev, pcf2127);
-
-	/*
-	 * Disable battery low/switch-over timestamp and interrupts.
-	 * Clear battery interrupt flags which can block new trigger events.
-	 * Note: This is the default chip behaviour but added to ensure
-	 * correct tamper timestamp and interrupt function.
-	 */
-	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
-				 PCF2127_BIT_CTRL3_BTSE |
-				 PCF2127_BIT_CTRL3_BIE |
-				 PCF2127_BIT_CTRL3_BLIE, 0);
-	if (ret) {
-		dev_err(dev, "%s: interrupt config (ctrl3) failed\n",
-			__func__);
+	ret = pcf2127_battery_init(dev, pcf2127);
+	if (ret < 0)
 		return ret;
-	}
 
 	/*
 	 * Enable timestamp functions 1 to 4.
-- 
2.39.5


