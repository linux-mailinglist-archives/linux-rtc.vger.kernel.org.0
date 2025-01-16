Return-Path: <linux-rtc+bounces-2932-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A98A13AA7
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Jan 2025 14:16:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF80B1691BF
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Jan 2025 13:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECFC421B8E7;
	Thu, 16 Jan 2025 13:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="eTsu+BUz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2049.outbound.protection.outlook.com [40.107.241.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACA1217647;
	Thu, 16 Jan 2025 13:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737033368; cv=fail; b=Kc2HcQBKJi8DLeztMmVUwqvdCAtRJ0yY/zFrKLZQJu650rrrCT1+kmfOGWfVClkJxMePnUipnAuYW0nISssBLW+CcrP33Vgplgw/L6pgZlGAf9uUyei12kBgdocTeb9W7otbb22SJyHzIyPyZO5hJPGA3PVyB+oPbnGc41SQNco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737033368; c=relaxed/simple;
	bh=xKU5It+KUgnlK0NYTXvRkvshCZ8I5UAoeg2kjxmegT8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=UwAUjkgkjyexlDOjax354IxnIyw1cSGLEC656albvF6NTLE7umIaRaZ0CdCmRfRgRhNIvAuYcDflIGzoJIq1t/siI1pxH+QD8HCU99vkR21htvKm/lhavGKkHjhJua315brwP1uRdzKt37JO3q7vDuY+s6z+NT89tc1XTbmiqM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=eTsu+BUz; arc=fail smtp.client-ip=40.107.241.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yQ86yG5vuuvA91xlz8l1cviVgXyQ5tVLlNLcn5u3CG2ThpkqBoLhjV6qd9GACfdSS479i0rzcbpU1fkNJWgwwaklHBxkHmNDWcTGEl2ZFgeQKv0clcv67x038/ocY+grKfY3L98ikbhr+HcA07/DeQzzahYLkhU/Gtc5+Ig731O5BC0sYzkW55QpC1+cSI07F/KotW6tFo98yXluodQXJtyVRZc6w9aCAXNNxUlxGcyC0+9dXzarK1rYd1Pyi86nPHmXpOfQ6Hm3oPUcd0y5SmB98nHax/R7czc0EygmJCX10c4VV02cK2+DQiTc/AVT2lz3DwKkiwTNRrvLeBYmyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMXgFtWw/NF2+1bKIeG3OSHql2ga+iFKhlJxvPjNt0U=;
 b=Q/LTgY6DkEcbcs6CLXtYsVQwonjERK4MDf/YVvRXyXwkHAHifIbvhTGfIMw07Gb8+RhBymS/FYmb9+o8KxuIkpWJZqH392np6+JIx1KtI+EN9FqgazI9B2yoI1ADoAJklQ1KRHOlq3n3n+YiwMoLVP+R52okP8dzFxnue9nPThh7i38zGObbvflOsVSOB8IaYoTnn+/pIy2lcEOfx1h6T1cTp3U/n37tYM1jN0uBsWI4iMjAosCTNAipEh3C6QVk4a7KI8CBkCm2Znmx4FjCEOa8FFccScPj7LCUZj6xsK1sB3BG3hhaoyE5sjpFXIYOcFZvk5YYPFfFEMgpHh9+Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMXgFtWw/NF2+1bKIeG3OSHql2ga+iFKhlJxvPjNt0U=;
 b=eTsu+BUzDPehBjh0aN+52qqxXUbm8ygJ90ipMP8ehDGblyv4WxiuLLa1kfuSERNBnZxBIstJlRQ4iqpG72iwHiVdpfLyzRo1ibfDKpxwr7pUBwiS1rbdxI5GGL6BMxI6PFAyzqqXrH37hpYJ+bqlJbgJjNVeeWa/AY3PAVzdZLoe1v70i6JHDyRu0tcfXZ3uV2ogVATbnvVjK3X59hU0LlMOVPg5MioMdJ9tx1s62N/Xm11eTKyGbpoKPL4REFYde00w7XeolWOWF3evnTHT6PMx2bUC3JrhmIOIQ4Dh8TqnsIcPmk7TJLE39TyyC8vpSsIWMPqZfinu2amVHkmDHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by GVXPR03MB10213.eurprd03.prod.outlook.com (2603:10a6:150:14b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Thu, 16 Jan
 2025 13:16:02 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%5]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 13:16:01 +0000
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
Subject: [PATCH v2 0/5] rtc-rv8803: Implement timestamp trigger over event pins
Date: Thu, 16 Jan 2025 14:15:27 +0100
Message-Id: <20250116131532.471040-1-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0005.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::15) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|GVXPR03MB10213:EE_
X-MS-Office365-Filtering-Correlation-Id: 66e12ec5-4c78-44f2-11a6-08dd362fec9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3kvzxTTOW9v5Cti7WNnaRMjVYQQDv9pdvVIss9Q+joDhl1soVTRe/6XdmWCD?=
 =?us-ascii?Q?F/gFkRqrQSR4Urgb1R8W/iBVsj271jxhprOXrhxetPUzVWJ1AEjVaZoP+CUp?=
 =?us-ascii?Q?an13TgyzqTjbkoWwZYg9+GMADI12tbOwGtpxuRxqFKtnc4FuDHUVcEMGrARs?=
 =?us-ascii?Q?G2u+bZYaFEXGCi8Oh499epAXW8bf8RdSt43/PjS79ylXSZUtiifE65PHrl9U?=
 =?us-ascii?Q?FcCxThFYet9KbAQWivnIMK4RQY50Qe1nEd9aTDYI0KWXqxxPFsTVQN8brf5C?=
 =?us-ascii?Q?hC7fafUgRzuXuBgss32SVa7yFHKEz8VEf18dZt6apqGmu+JSpxLXCFecGuRe?=
 =?us-ascii?Q?le+6IZnurgn402kW6cRC/8BE/6ZAnCAKfcA2SLQbOeUUIr2dE/hSlm0qBk+6?=
 =?us-ascii?Q?HrzG9Z7ZxoTm7hsYgexGc5EjApMuq484ZKamFL3sHdvr9SGPYAbyicUXA5xc?=
 =?us-ascii?Q?y9Med1qWyvlQH1Y+nSCPVOU6DjIEcqkOaD+QwXF5aAZqIpF6um/RCDd/egCd?=
 =?us-ascii?Q?kMACd7V7Es2LRc+u0dEJu8icB6LYNg7NKloJ9zmzwQHvvgmGWw4NSpd+tNlO?=
 =?us-ascii?Q?/8Tt9q4cCi9aAdlGJVcG8F0lD1VzeFpzBBiPtngb7xCYLJ9fqfkkDg2h99PP?=
 =?us-ascii?Q?c26hSe08ty9krfDzhEaDXO5/OaqySvqZzPd1m5pmHIShDCJeneyoh6znlczp?=
 =?us-ascii?Q?WWE/7neWDeakEYHHbbmLnchboi3JGUnra8EXw7d5csveVsvyYKy/hBgjGN3V?=
 =?us-ascii?Q?azAdGifp1xMXC5Z8s7vpHcRJedAqM3HGTE+FM/Qfu5mXmxN6Yp/6K/Y1d6Cf?=
 =?us-ascii?Q?ZIMj7k1wsd6c2Zw1IbTsTE9qXAb63t87oJYcyeVBc1Zsr9ocHhrxBkPtXdyb?=
 =?us-ascii?Q?MeMTCwpG6WtfhFLOPW+v/rOkJ26/3F/AIAn7u5ho3WtBgeuI3geZlTiWsd+n?=
 =?us-ascii?Q?xf2YiU+GekYvtOd/MHJeMEFCeh4+YBr/o89vjiEZOpXJeCoeJztXmAj1d28U?=
 =?us-ascii?Q?x6TMTr79kPKd7TCDbWe/qPwqfio3nEszkjbe3PjFHmDaH+HIcf0K/cP4scoV?=
 =?us-ascii?Q?ipH4F3CKXgA+tMDJca6jtd1SDu2ArsVyFhcufK+DRgtdSAmhaXW0JHaYCimi?=
 =?us-ascii?Q?kBohIdqiPHEMPNHQPqO9TOTM8bqaaYB63YvRglTMPilSGavUhsa41Y2yxwzb?=
 =?us-ascii?Q?NRRz+Z3iYZAaFGf4ndiiWfrO32iT2ASDVgkBfohM4Kk8BQ2ir0U5zCEdLlug?=
 =?us-ascii?Q?6wtfm1leily3jVWmFIY7cq5i1ZFB8xpyiRvpIr69Tdmfr99KnoxnnM5uBSGB?=
 =?us-ascii?Q?vzAnW6Abona5aDFJj06qHRe5WRZUck9/sjovyAFTyYlgNWw8Fhqb/eePUDhy?=
 =?us-ascii?Q?4GveSo/UIOOkXc+6AMMkGEDpfzXN0o4k5Bga5PRkvxSAbDuaJw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yBDOKF1adh9FHG0aBH1Puk7jb7wSoOaMvS92NObutLBVeWJvLf8yaR+d2/pj?=
 =?us-ascii?Q?oWQoi3df03Qxv2H89I+n89EYmbTkMwi+8qaXdNIjouipfIKM9VBV0Z6Qy4oe?=
 =?us-ascii?Q?kT757NCxdXexMJMqeky7vuZGKblxdLwquaV4tNtq6oycvI4SmWET6TFRzUVz?=
 =?us-ascii?Q?TV7LOfWUpJydwdR9eRoffn5zm73pwk8Hudi6GYXvdr6H1NPGsc8bvUDKtMmB?=
 =?us-ascii?Q?+id/0c7pFsSuusoqB7XWk6Lkn0ZRHu9uf5/o5cyd5reocYmONg1SLEg4zvDZ?=
 =?us-ascii?Q?/j4nXTuU+wybV8iXprLT7LdcLqoyM5s/dbA7udRUNbbPy8ikHodxOu0t1wAy?=
 =?us-ascii?Q?mNjKC2YfRHX9HQtiJk2VUc3OSI5Ik1OdazwQ6EVsJ1yrurPXXZLVDod9j0Pm?=
 =?us-ascii?Q?NU/sAbgQkwGdnlm0o7cd7g1/RsPbdXBBkBTNQC4TKiyEwV8gYf9Gd+IRveNv?=
 =?us-ascii?Q?x8A8LejWUBb+MhFJceV0aPONnrNDGLCXhDyKCiWXnspH1MMuStW45MpD0ji6?=
 =?us-ascii?Q?RXg9+rkeIee+E7MCyvIIRrMRHy4aFZQ0pW12WXJusrpdpAqEd6n9hZ5VynxD?=
 =?us-ascii?Q?YKhXcKzAzK5UxgsGSxxvj0d397tcXkHfcFc73VDbjBM3WYgDn6W+xupZdvqZ?=
 =?us-ascii?Q?Yjvb2m7ZyuS7GQRCziktHD+nUESmVwHcXOU4FPdN82yLqG6lKWzRWphSzQqe?=
 =?us-ascii?Q?UEStkN6MpB8hRdP+mm72lhvRdlyL+I4dBz5bN4Ct5PgUXuHvZmId8m52IEOw?=
 =?us-ascii?Q?qpeuzt0Ou33PwKRyaEyCojn1tc6G/2AacGsAWx4Wz9wtqI1Bj3cswQprOB6o?=
 =?us-ascii?Q?5VkhACXLKBVvaCk6qtxPGREOVvSN/gvLz1NfbNgwUDkiOtPUlHqPqlicZJJg?=
 =?us-ascii?Q?FuGHAy7mcU6381+Xqg5RNXbwj6L6uYFk+/89b6VKvUGrS4gxUaACeLcQ5tAI?=
 =?us-ascii?Q?6er/wKGQ7po0GGfqtndvQVGMzroBEePgZwyUHYy+ava8YFanfoS6MadNYafZ?=
 =?us-ascii?Q?13QKXrWNQ9Gdffx2slEoOq6kGgovWzKHNivZKGLDdzJw/3uEOQ5DIQYZFR5I?=
 =?us-ascii?Q?4K5dfrqb6viLUi1+/iC3icGUW4h9oA1TLqnhmmi4JDm6Mk/p2Zt/vSV3V8TH?=
 =?us-ascii?Q?ARvWxuwwYt5ugnEDZdqnwcWrEebDEtgCXps7ejBvszmw159ShSwx/lIa+xmm?=
 =?us-ascii?Q?nDv3Ztj3LSlPhlJOzq4A/O7mFCqB1zyAzns3AFI1ZzhZdywDiEJ27GmZmxgt?=
 =?us-ascii?Q?EhHwh6sP+Y8yfZRtukMKIhUgGjo2Cgk52oMJq6WyIXAG+y+QwSjO8jve6KyT?=
 =?us-ascii?Q?8uv9mU477vgI9qFwCexDdnf1cROj3V3SOocTuF4DrcgEBbpTBVqXN3BA/8IN?=
 =?us-ascii?Q?hV7VtIKbMsUWYosdJrrldAGePo0mpEK7ZmBWE548sgt5WfW57KAStP6GT9fe?=
 =?us-ascii?Q?Ul74qHJpdiJyuBF1c920TGEdqVHnYofKIsCPh58AB38SGBe8IqvH2GR7a5l0?=
 =?us-ascii?Q?LEwjb6rOqHkhEo/qO10Xlj2n1pwXq2ZbHvbJXTK5v1QHriOpjk3MaSF33Fyj?=
 =?us-ascii?Q?7wh1AFuTCPDSAQzuf7opOhJ+uhLg4j02KI0rLZ/2?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e12ec5-4c78-44f2-11a6-08dd362fec9d
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 13:16:01.8944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FL/o980rEnnaMD1jsa7CqvHidvFbtyLsAWsGy6hYfTcc+kUbw+Pcarnf5XrAoHDyqK2eUAW/b+mKs1SJ3ff6zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10213

The RV8901 RTC chip provides a function to store timestamp events.
There are three input pins (EVIN1-3) available for triggering.
The timestamp can be read to detect tamper alerts, for example.

This patch series extends the sysfs interface to enable and read the 
timestamp events.

The data-sheet can be found here:
https://download.epsondevice.com/td/pdf/brief/RX8901CE_en.pdf

This series applies on 'linux-6.13~rc7'

Changes in V2:
* remove separate patch for register definitions
* remove pin configuration over sysfs (use default settings)
* add sysfs documentation
* rework enable to simplify and remove big mutext scope
---
[V1] https://lore.kernel.org/lkml/20250110061401.358371-1-markus.burri@mt.com/

Markus Burri (5):
  dt-bindings: rtc: add new type for epson,rx8901
  rtc-rv8803: add new type for rv8901
  rtc-rv8803: add tamper function to sysfs for rv8901
  rtc-rv8803: extend sysfs to trigger internal ts-event
  rtc-rv8803: extend sysfs to read status

 .../ABI/testing/sysfs-class-rtc-tamper        |  36 ++
 .../devicetree/bindings/rtc/epson,rx8900.yaml |   2 +
 drivers/rtc/rtc-rv8803.c                      | 516 +++++++++++++++++-
 3 files changed, 552 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-rtc-tamper


base-commit: 5bc55a333a2f7316b58edc7573e8e893f7acb532
-- 
2.39.5

