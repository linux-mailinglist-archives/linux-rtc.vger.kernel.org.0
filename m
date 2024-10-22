Return-Path: <linux-rtc+bounces-2265-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD04E9A9BE7
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Oct 2024 10:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3F371C22734
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Oct 2024 08:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58BF0156F5F;
	Tue, 22 Oct 2024 08:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b="z3Sk2+2W"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2092.outbound.protection.outlook.com [40.107.21.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538D21547C4;
	Tue, 22 Oct 2024 08:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729584134; cv=fail; b=ZaBRtX/kbE7sWLz2b1Pot10bnxrv1msUhy6K1PmOeCm7B9J1JJxVAEcC7uGcywPK0JFe07S5ou0I7Z5eqdw5EayA8WsJQDP4C27PqjFKVzWULHDaO2TC5PiTHcGOQT3HjCbx3Rvzu2Hn5tYO3lHWxPxOxnmjL8MYeu+DgZr6+Yk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729584134; c=relaxed/simple;
	bh=FuWHeEJksRVSZveOxXsR/3MoDNW1bvU6a4gHntO2eQc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kOl8/9x61Vk2a0M6t465uQHwD9Oc1rRusVQqwe4CQM3s4ud8nNWMFbMPEh1a9VMDo6UudiP8YIn4NVTOQcFToL+LV8yQjej3N0OIHw4EuhheId/FrKLOEBxdtTBX7xglXTPyFrTWFLRz2iG9qWREUz1OOtk6wQZD6++c1sytIM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com; spf=pass smtp.mailfrom=kunbus.com; dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b=z3Sk2+2W; arc=fail smtp.client-ip=40.107.21.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kunbus.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lequOJkvoUA31wdhQGNCanoZtw4mxC42bv940jtEyf6Jp+DnxLqMNHy0KkBnEnQCWA1Mpobf0LBjT+cyX2Px9jJZbmyeFKP2MV4Em4Pu9puZOcOHrTQWnsqUXsSPs/iTkJAiSNMhv6oFLAT4Ao7XlmhyH0L/VmCCDMrFRaXjb/bTeS4PjxvWAtaX9A46wcdaoEEsdyVZwR3t9ULZ1NLk/r1NVF6posu/15j6U8GIZGpqij/dTgt96LfEZaXLtFW8xR0TGYX7CcS91h18u2qHSqRUkzUs0rxcKnncu3pN7bv/JP0mvyv8YdMGUxIUrAqQ3f3MstacX5w6m6Kv2vYTSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lXDv0RffGdWMYbbKEiHp0cR4svtT9Ts1IGNDgkKP2io=;
 b=UnQmut3wnB8LEzjA5wGh1WZQqwSpLui6DOZ4FGTC7X9ZxSIMU2nkwfY08j8B+FKWuxw8rUXO2vhuxt3rE+GUrG6+DaOY04phku8tV52yRwgesx/LzHjxduIKq4ME/hMowEW4Zxz2b5FHlEgAXXIjDsOPVahEmOmJNYm2n8Ol8iRl0fFTtKiSk46LMj3SdLeU6yvmuqcKmyM/8dbSmvfTviEjgsmFuLRNJSyeDpmH82j6k66DYp07y5XWWmaktz8+VtcAb+sb1dX/0PSTFiBSPURsw9E/0jUO9OtJsY7qeKLs1s/vsPcxYOYgGz5DLZlhAOxYw1yN96cGOxHc5fngyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kunbus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXDv0RffGdWMYbbKEiHp0cR4svtT9Ts1IGNDgkKP2io=;
 b=z3Sk2+2WNtf0k9g8cHELac/UkhgeREkTHrAD+C+kSaZG9i6XJychpaXy6XUkpLYYY7kvHI2pGPne+Xq4qjFPHWR8RwMjUjXsI/y4gneJxasSsBbiNfcZCdBksDPoA6swFF++EiN2CUTBd0n4WYWsl7Varb0pg7m9kGW4vwJYz9o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kunbus.com;
Received: from AM0P193MB0738.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:160::8)
 by AM0P193MB0497.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:16e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 08:02:08 +0000
Received: from AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 ([fe80::2398:d74:da85:f90]) by AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 ([fe80::2398:d74:da85:f90%3]) with mapi id 15.20.8093.014; Tue, 22 Oct 2024
 08:02:08 +0000
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
Subject: [PATCH 2/2] rtc: pcf2127: make battery switch-over configurable
Date: Tue, 22 Oct 2024 10:01:21 +0200
Message-Id: <20241022080121.1594744-3-p.rosenberger@kunbus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241022080121.1594744-1-p.rosenberger@kunbus.com>
References: <20241022080121.1594744-1-p.rosenberger@kunbus.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::10) To AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:160::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0P193MB0738:EE_|AM0P193MB0497:EE_
X-MS-Office365-Filtering-Correlation-Id: 73caae4b-2e2a-423c-144a-08dcf26fd399
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QXaDShfisAKJfL4Q98gVrNc9T8gmeRHG6kYVzdzyNfQt/pPqb04wd5LDZy9K?=
 =?us-ascii?Q?4HzFxpkSupUc8hKwri0OeIbYMechP0gMt8QAHOeuZGIGEPbXDUzt6pr2jlkW?=
 =?us-ascii?Q?z66haB5bTWyfnFkGS+vja6u/o3s9qq+LuhTNbesJtu9kP/NWEbk93bssfbks?=
 =?us-ascii?Q?YYYZ+ZnxXMl5nizXfD47TQ/MDVL+792ro5GrPt+o+c1lkohAaDnAe44gp94y?=
 =?us-ascii?Q?iENX45yszo0AclHEec8E8iBoMGZkB4phXiva2rrCQNdE2tdcc7uLd/JA5ftu?=
 =?us-ascii?Q?EDa//dHpGoPfBd+lAKDWCX6O9O4abGDBtsWGiFzC6tbxNcvoehi/Efh2KI8J?=
 =?us-ascii?Q?RW2DVE8yhXHSVn/QZNn5Gs4NEyucuB4kt557TT+izmqyiBFLrfJTahth21cH?=
 =?us-ascii?Q?BRQIYnOGTtulZ/4saFpNDesvjWXXY00PzvMnoNugmX1kLZbiT9iy4g0H3YjL?=
 =?us-ascii?Q?QCdavCr5gWjxelTtIR/w2qHiysfqrGpnrSpBA8bEqB6UQ4l4ymM2TVi1Vb5o?=
 =?us-ascii?Q?AiALqlSGphXk8WSJWeI1u4i/X66qpUIAB8wB4tbzhvGm/UAZSYOYHoAZIISE?=
 =?us-ascii?Q?ZPm5+ZHEFi7ClBBvK6tVKq5IW8MfmZ3gEtkBOlQulX3Gu5PVyjAQRLnI3+mc?=
 =?us-ascii?Q?BHQfPEx7NEKfbbWk7qPLXf37sILqty+c2Iopvfv7ZrKgALkIkOuwN6y6QH8X?=
 =?us-ascii?Q?4HH8vOMNpx7FNQ1rPd+PAWx3KWprJVI1mNztTCRIQK9p52A9Ktklg1vfRq4w?=
 =?us-ascii?Q?FRhKpf+uag4LiGMPFKCKuJ2Vh2+CTNBdPgN2YWU7TKf3rDDJqqU04rNaanqW?=
 =?us-ascii?Q?Uu6EGQk5kKCMBok/Gcq0XnhXUI71ahcFjem1wh37U3jeK648XFsahTH4uz26?=
 =?us-ascii?Q?SJKlOSW5MBUqwlpa0IrB6NGDQgQkAwlPPRhsYQHFIjgnyER2UBiH9liuLhO2?=
 =?us-ascii?Q?te+gZoFTra8Sp+1GcDiifr7kK6cxaXQRqYN2MUysDYO6wHAoS7rBbnW494kl?=
 =?us-ascii?Q?yY+8xgKJP1RlOh27K7WX9JuR6IWG++j1O6ffIWpsacS+DX0qPBImx55xCfJ0?=
 =?us-ascii?Q?iVMLIgaAPItIo+Qh/GZYpF7w4LXGVNJLmMOgHilVPDtG8wI4ElxPh/XRfC14?=
 =?us-ascii?Q?Cy0r5QoZu1YJOgoB8dohWAmT4FS+pvgzXjMhh5E0VYHoVKEZNiOR3vBtMWWY?=
 =?us-ascii?Q?YJCu0DGlqupIGTiLCRhmWJ3Jr68lzdfqKKIZdA5KQNcyCxexDNdDXAFUM1pN?=
 =?us-ascii?Q?fml5SZSBlrju+CyMsKCP7XrS4rt2F49f9J3RQVD3RmIQnItEr5lckZux/Sw4?=
 =?us-ascii?Q?ILlxBi9jvw+vvTST4u6wdMSOSr33lEQMZvGSeFPFnPlSSmJXQp9ZCMmK4NxT?=
 =?us-ascii?Q?kdxgj1I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0P193MB0738.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9nBRHLpDeHSDnWh7anrTfZKlMXrhUwoiTqz32YoYNjAJNeifin2cuF+5oAuP?=
 =?us-ascii?Q?+b8eeopTy96dNAudLnTVVm1h+uq191QWSUpk5vJSEK37I7qsazpix9HXhHU7?=
 =?us-ascii?Q?wbV3sbQ1cGruIVMgO+J2GJ99svU81tFKTKvHwLFt0rbhb/hhXlwOdXgi7q78?=
 =?us-ascii?Q?289iMvMKxpBcUgZwvalI9naJ0k8PrlF/eRd2Pa1molbW54oFNLG1R5D1CDFB?=
 =?us-ascii?Q?q/6LZ/vWb277wtf9CUSVKN4fSEQvfzdV04OuolgMqseGMPGrcleiocP1BWM2?=
 =?us-ascii?Q?8OLHcOVpkB2HzBRmENOlFxYAZILoeocVmJdjzUNx41NurDFjfv9EjGK3ZxeQ?=
 =?us-ascii?Q?B/VYY/9CqNgsg+9zP7vEqnm8Vyk2s+ldmuhUNWH8Ad8S+4Ayj/yYJmAOXqxx?=
 =?us-ascii?Q?kJgUduWbBjLj4/NRQCX99kca66w0IOQzt08d0SjGGHt2CQQKL+xXl98ePh1x?=
 =?us-ascii?Q?WbARAiD34JT+rq4tg8hkVuvnSeIOz+8RDPKbGCHea48qeZLcDa0Vn+EVDol3?=
 =?us-ascii?Q?4EFfLdA0Y3VgfnDuFiWn1FQf8HzMMzh8RRwdABvjkVuXDuu/6idasbFI3u5N?=
 =?us-ascii?Q?By3ZHg4Nf2qGnQ0zTGZQzTdOx2uzwukowHruSEPyw1sRTzi8pwb4Rs1PC6DO?=
 =?us-ascii?Q?o3mrBQb+NaDFZkyXLV8V5iTJuiD94xTEwqbeQgJUUf8DJbIRxmWJ3UTnz1ew?=
 =?us-ascii?Q?hU58SYZWhLVpXGwFcgW3dqh5cyxj+JzBP90FJY3VEnQDBB2smDbjJi8CKZyh?=
 =?us-ascii?Q?lp697IUK12nWPkYVbS4WjM4F/oPmYyXyzELpvjj7EuDrbXU9BcYX8bK45kmF?=
 =?us-ascii?Q?BvJwKoG1v3HQ8N1Q8fX44Nxg8smoC439gmeucOMV8xPUYJj7V5/IKn4tVWpe?=
 =?us-ascii?Q?xsdEH4yr7htC6REZjz3kD/BPGlJGyvuuQd5RcggQlx+5wOXo5JuwJUnNvBp+?=
 =?us-ascii?Q?SLDRLaL6fbXGTlD9/lSdwOlYYq/dcoXFqwYSlHmwoJqlE8DgED8/4O3ZCgEf?=
 =?us-ascii?Q?U2rS4wzan8mTLatlQRNtRvT0Ab2aDgRuz7aE4JGTDhYzziMpcHhTcMJzTbnQ?=
 =?us-ascii?Q?OaZiK2nTRdVi3BJU1dkMUAw2qt5O9F28JehnatQDATkXZHnJzhqvpUpF1uWu?=
 =?us-ascii?Q?LxynVXhTcCTXWOOq/4/AtJBXdLvzxnUGv1KmqQ3YcqDjLrV3OzX7wEXja1y4?=
 =?us-ascii?Q?OQvK76mRJPY4p7RDWcIQElSBHY8av9eGjOmzSN6jzV1IwUTSmjXwR68dhMMu?=
 =?us-ascii?Q?+eChk8RNkr2luPv4hv+2jEtMrvvXw0DhfQ41UMjJRAr/UBZg01cEPoxDl7cD?=
 =?us-ascii?Q?B+sJMHsxOncuM0Z20RZJFvmT0VJJdoMuPqiMzD/muf29ojYlbe2Pz2mC3TLh?=
 =?us-ascii?Q?zm9sPs2aMD5zAACfKFYou/0sic79sfGowyeArhAOGGhxqvy8nhot/rwY2OaN?=
 =?us-ascii?Q?sTg3ixVFqhZZHTIawU7ySloWAxoxV+ITaxhubpJyzsaRVx1h/jfXasvXL1/k?=
 =?us-ascii?Q?NWms+T8WY8UpKxG1Q+XHJY6UeD9pAItL6cUL+Ux8hvo2d3CarYfybCJzdCmd?=
 =?us-ascii?Q?BGqz+TwnNuSbpmUR91jSpR0uFMkx/vrqeZ3kXo80L/LACPYp5VcTDZpZm5Dg?=
 =?us-ascii?Q?dw=3D=3D?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73caae4b-2e2a-423c-144a-08dcf26fd399
X-MS-Exchange-CrossTenant-AuthSource: AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 08:02:08.6090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GCTY5Po+NskI2ZGQKSPo0REBKMsylOnKSDKTQpckaX5HYRbvBZ22gxNZmztouWBbhXDakpA2VBZuGAfamayccNDvKRmj2J7PG4OYLsv/shQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P193MB0497

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
 #define PCF2127_BIT_CTRL3_BLF                  BIT(2)
 #define PCF2127_BIT_CTRL3_BF                   BIT(3)
 #define PCF2127_BIT_CTRL3_BTSE                 BIT(4)
+#define PCF2127_BIT_CTRL3_PWRMNG_MASK          (BIT(5) | BIT(6) | BIT(7))
 /* Time and date registers */
 #define PCF2127_REG_TIME_BASE          0x03
 #define PCF2127_BIT_SC_OSF                     BIT(7)
@@ -529,6 +530,49 @@ static int pcf2127_watchdog_init(struct device *dev, s=
truct pcf2127 *pcf2127)
        return devm_watchdog_register_device(dev, &pcf2127->wdd);
 }

+static int pcf2127_battery_init(struct device *dev, struct pcf2127 *pcf212=
7)
+{
+       u8 val =3D 0xff;
+       int ret;
+
+       /*
+        * Disable battery low/switch-over timestamp and interrupts.
+        * Clear battery interrupt flags which can block new trigger events=
.
+        * Note: This is the default chip behaviour but added to ensure
+        * correct tamper timestamp and interrupt function.
+        */
+       ret =3D regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
+                                PCF2127_BIT_CTRL3_BTSE |
+                                PCF2127_BIT_CTRL3_BIE |
+                                PCF2127_BIT_CTRL3_BLIE, 0);
+       if (ret) {
+               dev_err(dev, "%s: interrupt config (ctrl3) failed\n",
+                       __func__);
+               return ret;
+       }
+
+       ret =3D device_property_read_u8(dev, "nxp,battery-switch-over", &va=
l);
+       if (ret < 0)
+               return 0;
+
+       if (val > 7) {
+               dev_warn(dev,
+                        "%s: ignoring invalid value for nxp,battery-switch=
-over: %u\n",
+                        __func__, val);
+               return 0;
+       };
+       ret =3D regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
+                                PCF2127_BIT_CTRL3_PWRMNG_MASK, val << 5);
+       if (ret) {
+               dev_err(dev,
+                       "%s: battery switch-over config (ctrl3) failed\n",
+                       __func__);
+               return ret;
+       }
+
+       return 0;
+}
+
 /* Alarm */
 static int pcf2127_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *a=
lrm)
 {
@@ -1224,22 +1268,9 @@ static int pcf2127_probe(struct device *dev, struct =
regmap *regmap,
        }

        pcf2127_watchdog_init(dev, pcf2127);
-
-       /*
-        * Disable battery low/switch-over timestamp and interrupts.
-        * Clear battery interrupt flags which can block new trigger events=
.
-        * Note: This is the default chip behaviour but added to ensure
-        * correct tamper timestamp and interrupt function.
-        */
-       ret =3D regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
-                                PCF2127_BIT_CTRL3_BTSE |
-                                PCF2127_BIT_CTRL3_BIE |
-                                PCF2127_BIT_CTRL3_BLIE, 0);
-       if (ret) {
-               dev_err(dev, "%s: interrupt config (ctrl3) failed\n",
-                       __func__);
+       ret =3D pcf2127_battery_init(dev, pcf2127);
+       if (ret < 0)
                return ret;
-       }

        /*
         * Enable timestamp functions 1 to 4.
--
2.39.5

---------------------------------------------------------------------------=
------
sps
Smart Production Solutions
Nuremberg, 12 - 14 November 2024
Visit us: Hall 5, Booth 228
---------------------------------------------------------------------------=
------

