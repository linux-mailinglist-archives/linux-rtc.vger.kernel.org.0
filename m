Return-Path: <linux-rtc+bounces-6554-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFFKLDPMDWqq3QUAu9opvQ
	(envelope-from <linux-rtc+bounces-6554-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 20 May 2026 16:58:59 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A45B559054A
	for <lists+linux-rtc@lfdr.de>; Wed, 20 May 2026 16:58:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A40A3008CB4
	for <lists+linux-rtc@lfdr.de>; Wed, 20 May 2026 14:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3AD83E95B8;
	Wed, 20 May 2026 14:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="EVBOierH"
X-Original-To: linux-rtc@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013063.outbound.protection.outlook.com [40.107.159.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85060375F63;
	Wed, 20 May 2026 14:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288565; cv=fail; b=Pb4ITo7ThwnmKInr2pQzXoxTZ8RD5NRcKH07Ew0nNofJg3re3FM0xVQQhdzlSy/xMdQ97SDWZvhXSdumMaQ5rKs6yUZJqyIpE8jNaviFKTA+Epinwn+UD8gt/WiQxawoj+jng/2V3tXf/nNNx6PYtx66rLaX0bRH1efDYOWqh3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288565; c=relaxed/simple;
	bh=j2vVsLAWcQA2mbobxHKAFQA0EfWFN86m1S7abMfTVko=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=i2/DBGYCkihwW4Hkq1smxFwXpFTcJmCURDw6bTBo+CTSCg1EwRyb8RYsKVFxW/4bDs74Wx3G3iJJCvFIOK8f9Z/7QRLaQJr7ghPMPookdZHEidA9RoadQ4V6BjrLyt4I0nJU1V3JEe7FKfTR9zxVJBD94U3y3frtQKc9WyRgWJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=EVBOierH; arc=fail smtp.client-ip=40.107.159.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R0cj0+whod/Sro00NXonajHBugRThU4Iu4R176RJaqN4puDk5juPIfZIMsFaHgaYnz2ooOob7DjFCcN6Apkld9TV161KVw6y+j6XCjaQsnW6Ivy3PeelmJQCP/VQu52rZiIR0ei+BS/sxMe9B35V2Of3nryqjq+9cm2E6f7Uh4ZzQnv8QjuZ4BZK8s2dG/DGT25bqPWMf2XmdjOHRyv53WufzvZjmw6Eu14+EwAUtOES8RAkdeyrtwiTLkUagU4ksHSEoV/9OtRfuFws1p+EALmJ+9EXOlFJ3AqmhVimxF3r7biEyHtclKI8lBr4jfA1y5uNfauWUf6iQo4PnfHyUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=At8fOOP7LGLu7h1eSW/pABZkfOiwX5nFLhyNTZmEjVg=;
 b=d4sURj+/66GJud8a2TJ/nSawBe+bee4EyLTCp7wSyN3vW0MJi0YxbUz0kMzBG1F9vInUiWipBXJCL7W9kusqnMENVt5+IValnIU3LnxXRFeUn9/lmsI4Uu7zimMYjHHjYG6DOmaEQuGPJPJZMiSf1iccKAXhqt45k5mTO1DuBaKUg0i/G5WNyGBJhH3rC0NWD1u8Qi7Qmlmp0EB03BrapYUElccSeMcjwRFOqlFUv2uOLyzGE133sx0lNfXlqEE8L4po5mdFIqX1gHoWU7MGBr5T9jhTRCID1l3PlNkIqek9HUNy6N3Z94Mwg+mAwG0EsM8zIKJW8w3XVK93rEgZrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=bootlin.com smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=At8fOOP7LGLu7h1eSW/pABZkfOiwX5nFLhyNTZmEjVg=;
 b=EVBOierHS4pF0uYJDti4cP6f+H/5oXU7x9oQyRY273kyTgDmmAubozqy5eF5LY2hH1YF89OUmB8TTOanDQBRVqdkXY0XTjDPPWSZ4VEvOcDN+jZjYZ8qyA4nGLOIKPFc4NE1ai/7JUUelCCeJ2SfsHtfHTuzhW97qEcWFsLBAVY=
Received: from DUZPR01CA0105.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::16) by DU0PR02MB8831.eurprd02.prod.outlook.com
 (2603:10a6:10:410::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.19; Wed, 20 May
 2026 14:49:18 +0000
Received: from DU6PEPF0000B61D.eurprd02.prod.outlook.com
 (2603:10a6:10:4bb:cafe::39) by DUZPR01CA0105.outlook.office365.com
 (2603:10a6:10:4bb::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 14:49:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000B61D.mail.protection.outlook.com (10.167.8.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 14:49:18 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 20 May
 2026 16:49:17 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 20 May 2026 16:49:17 +0200
Received: from pc62507-2516.se.axis.com (pc62507-2516.se.axis.com [10.94.180.48])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 6ECEB2661;
	Wed, 20 May 2026 16:49:17 +0200 (CEST)
Received: by pc62507-2516.se.axis.com (Postfix, from userid 13629)
	id 6A62442098C5; Wed, 20 May 2026 16:49:17 +0200 (CEST)
From: Fredrik M Olsson <fredrik.m.olsson@axis.com>
Subject: [PATCH v2 0/3] rtc: ds1307: Add support for Epson RX8901CE
Date: Wed, 20 May 2026 16:48:52 +0200
Message-ID: <20260520-ds1307-rx8901-add-v2-0-e069ea32e1db@axis.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANTJDWoC/22NQQ6CMBBFr0Jm7ZhOR8G68h6GRaGDzEIgrSEYw
 t2tuHX5XvLfXyFJVElwLVaIMmvScchgDwW0vR8eghoygzX2TGRLDInYVBiXizOEPgT0phOq2Dg
 WhrybonS67M17nbnX9Brje7+Y6Wt/NUvuT20mNNgQd3wqpRHHN79oOrbjE+pt2z75rR1qsQAAA
 A==
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
CC: <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Fredrik M Olsson <fredrik.m.olsson@axis.com>,
	<kernel@axis.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>, Nobuhiro Iwamatsu
	<nobuhiro1.iwamatsu@mail.toshiba>
X-Mailer: b4 0.13.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61D:EE_|DU0PR02MB8831:EE_
X-MS-Office365-Filtering-Correlation-Id: aa3717c9-a14a-41d6-7c8d-08deb67ef879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|7416014|82310400026|3023799007|56012099003|18002099003|13003099007|11063799006;
X-Microsoft-Antispam-Message-Info:
	R2ypUM5+pu0yM8XVYYHU2uluZ7Z3+VE6WUOzqRtLiU5GaUq2p2kxvLueEpz5SnX8MFr0M+5eWz7elBoIj9DUHmQNPBmI9TtMDG5nvMeJmBDR2V5uviJD0+m17QCvazX93ChAsY/sa4cI2kCyx06JP1vfahxbmmpxuQrQyuXy6cdt8LKvzfscpCe/9v/SEYLHYKvm1lcuXE68iGf4XB27TQQWg3d+Jo854srHWTHNXeeXYV1naGyST1eBhNwi46UzZnSOKQORVocPiLvu9YcQn9mQvs5WSPjCyWsSgtuCY5rT/tANJyzlgPghuzjd08dIcfoMBkBxGHz27/RyGve4XbbjFSDrW6EJbf3bwwZEGyke+yo4/QDnzocY843xH4GgBhQpPFmKqbF4LiWdOQtTzu8VG0JIJN5znb171/T1CqNCCLbto3iLONOn3oZASLdorfW03e7GloaGdhsnpaJ668FXqf6Afi2mWmaBPW/O6TlHyYxWHeCRzIKnWi3syZYPcRmrwei5PQfD5OyrfDSz9lG8Y3+cumiiaoRYgaqQaV4IT50QPin5+vweo1gCphiDXabct9NkNnPcDptZhAruuzRqr9EmJQQvPzVRiyTGoKnMK8iBESQ8ZcWtnvWNGHsj+GQyQ2ykw4Mvmv+MhVY6S76uQ81jdgo+tB9DyuUVIZxar4E67Udc7Jbw8UuU1bb8
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(7416014)(82310400026)(3023799007)(56012099003)(18002099003)(13003099007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FGxMdHs3wekYRUt6NHE8hENKzmTi60iEPbWpWTy+KJbdPFs5d+EORl8svhpp4E8wktYQu8cM4dWfHAjzmr3jOuPDhbJ9grq/dXdqO3gZr+vLC1rovZhyMG/Z/RZPnuvHlGzvQZEDwvmN59R2RqnZYK+XIGv16l2XENwNb1Xkl76JB5qvSLHxlLJhRnP1zjxXexjPfJaG5+c4gFIVRPLoAylJgIENXbF/ArX7uw5oN3Ipj/mtC/jOb6jEYmdiMZBqlurgOo9PuZIM3g/daWD5/XArGFgg8zHxkgxHC/Y9HSzOgH+ayVfvndNySjq16WW+z+oseV3UnyaM0ZagiGt0MqlreegRcYXttVmPXOOX5lzeoWG0HWQFjFSljuD3A+ju8EV0cAzop07A5xAV8AgtRigs39pMtuWHkm9GUqw0NX4iyVyetzMMB8dlLEUXHhHC
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 14:49:18.3538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa3717c9-a14a-41d6-7c8d-08deb67ef879
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8831
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[axis.com,none];
	R_DKIM_ALLOW(-0.20)[axis.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-6554-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,axis.com:email,axis.com:mid,axis.com:dkim,epsondevice.com:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fredrik.m.olsson@axis.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[axis.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A45B559054A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add basic support for the Epson RX8901CE RTC.
Datasheet: https://download.epsondevice.com/td/pdf/app/RX8901CE_en.pdf

Also includes a bug fix for an issue with reading the weekday from the
RTC which affects both the existing rx8130 and this rx8901 driver.

Signed-off-by: Fredrik M Olsson <fredrik.m.olsson@axis.com>
---
Changes in v2:
- Squashed the Voltage Low status patch into the driver patch
- Switch from dev_err to dev_dbg
- Implement Backup Switch Mode (BSM) ioctl instead of hard coding
  switching mode.
- Change the prototype for the do_trickle_setup function pointer in
  order to make it possible to propagate error codes from the added
  PWSW_CFG register read operation. This read operation is added so not
  to override previously set register fields.
- Link to v1: https://lore.kernel.org/r/20251219-ds1307-rx8901-add-v1-0-b13f346ebe93@axis.com

---
Fredrik M Olsson (3):
      dt-bindings: rtc: ds1307: Add epson,rx8901
      rtc: ds1307: Fix off-by-one issue with wday for rx8130
      rtc: ds1307: Add driver for Epson RX8901CE

 .../devicetree/bindings/rtc/rtc-ds1307.yaml        |   1 +
 drivers/rtc/rtc-ds1307.c                           | 218 ++++++++++++++++++++-
 2 files changed, 209 insertions(+), 10 deletions(-)
---
base-commit: 27fa82620cbaa89a7fc11ac3057701d598813e87
change-id: 20251126-ds1307-rx8901-add-a0fe173093e3

Best regards,
-- 
Fredrik M Olsson <fredrik.m.olsson@axis.com>


