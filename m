Return-Path: <linux-rtc+bounces-4213-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C30F1ACB3D2
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Jun 2025 16:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D61AB188D447
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Jun 2025 14:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE6622F762;
	Mon,  2 Jun 2025 14:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hHhuzuTN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2062.outbound.protection.outlook.com [40.107.22.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE8522F751;
	Mon,  2 Jun 2025 14:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748874539; cv=fail; b=Kmc8q7BP4MydQ0lfaFn/dMa9TYPDSZOgqgkweEknSHsg+TRpneZ/r9ysPdShtMBCdhuep5RsM+S+vYQPRDOocTWmebrM2P++XI28Z2TrilddeZELajj1uiNKzAsgDI63KMpmtkD8cFiZWncZ2SvJRz62c1JFRsS0CYedFpMrEwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748874539; c=relaxed/simple;
	bh=O9tcRvqxp1bui85AOgcWtSgNn6AgzVq2Wx6f4JQ/mIA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=VfMgtiFFHXcBQIkZmLu1FxAJ4Q6F59nwDNnYBpZDs1CDWp7HnbRhjLnRcE1+BIDjpNbbfvpQtlixCCdz83CCEEZ7WCB0r5yoYJ1Qybl2GR6yLmMHnVU+jXdXLlJ4UHAq5e1AzX0Q5Hi8949W3NOcrQMocu1aajTgFsRW08j0RQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hHhuzuTN; arc=fail smtp.client-ip=40.107.22.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qx2Vlzqi1YZL/eaGL81vB2w+MVUuOEb2zzYZwciktEbYVH9bcQPD4ZPtacKlojQSEJ0V1Pfboc3bzyq3oF9Y6EFSnJ71OFyRBUmvsvoBpa60RpX+pKgamIoWNpuS8xv3Gq1x1kXCMg/FZxCpt7l4hWcWSV9aH+qP61sUhPF2NXI05RgaYsz5q6UYHgDkfhJ++ioIrFBF6Klue7f3L9cMH+Kl9ZzOs7d+PGPabSfkdAcLe4xZeX6lk9dbaPd+75UWSbeIElz0M21fKu2g+j7+Q36il1tKwySTGHN2Zsi0VlNX1jCdESd6PE/ErcOengfOn+U3yPkKuXKOQJ8wNXQTvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3cWrZyKXkOWGCqkEjiN2GOqhgJTFuyDIRcqM25x/hRQ=;
 b=Q2KkTiOwR3St+Klw+cJpPGHvyD9JjVEe6TbmjPuo9b9fs8gWR2vhGNikSLruceE+Qdc3/Exsi2l2Hq7zvDrCJPb9QJMSQ9ji2dIgUmcq/kVGxlDHI6oLqmO/mAeFpiVH4rV+ySr3QpXQ1KgNgzpvyVfJuNpflock/JGAP2KLy8IHibxirsq3sAznHPG0FvOxjSB15yFBl46kX9LIw0cV3U2tyuxn9kUMc5vDoS4V35WOWf8wA2+eadSPmg2HgfM2CYewmAVWeuNlW8hpLJPqACrYLELAhB+1c9QJsYsefG5JnRROrTUrRHVuTBYqLInbewvEl1OxEYMsa0a2lVoqYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3cWrZyKXkOWGCqkEjiN2GOqhgJTFuyDIRcqM25x/hRQ=;
 b=hHhuzuTNJ8lTvSgQX5qAOdCOxs82HnMfPl4ZmfyRymCUKMNvBoPSO7SQ+nUpYQRpey3rYTgas+nV8iJnJTXC8Wide3vtKhow1mTbw2F4GstHTnDJLP5tyOZffiTvmwTkAGdCtko64ZCb/jClb91iOdVu2LIYS12xJvWaAZGMYfFJNf8Kyhh76UhPj7r6HGMTz2Wp+vIhefF/9+RF4+/kWSafiLBYzgoiw2BnPb0+xZ3SN4o2s2d86qGoqER2D25Wh7V+5ttpiuiM3G7oLnJ9ntHClTEF0OvuphONmwr86jglfKItXix30YUvCTXQ5LjQpGaqXk4dyyPgHtN+bbPYkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB10133.eurprd04.prod.outlook.com (2603:10a6:150:1b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Mon, 2 Jun
 2025 14:28:54 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 14:28:54 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux-rtc@vger.kernel.org (open list:REAL TIME CLOCK (RTC) SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: rtc: nxp,lpc1788-rtc: add compatible string nxp,lpc1850-rtc
Date: Mon,  2 Jun 2025 10:28:41 -0400
Message-Id: <20250602142842.942700-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0010.prod.exchangelabs.com (2603:10b6:a02:80::23)
 To PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB10133:EE_
X-MS-Office365-Filtering-Correlation-Id: d7042a02-2396-4f56-8b2d-08dda1e1cd67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P4qnMOC6K6dZM6Y1ceLSIqlJIsITV3Z1Hfo+FTFwzqH0Xb2K0GZ3ay7FiRmQ?=
 =?us-ascii?Q?dQjm3d1Kn9m3f95tVNEsmvItF26NOx0HbWe9u+9NI0iPb8TDvJjEaV6GYXNJ?=
 =?us-ascii?Q?vlAQGIO47a5cFJbfo8NBc6A2N412Is3fpsmMjZrSwiketVOmys+2gQ7NAa8U?=
 =?us-ascii?Q?qpTwjsCkXPTa59c+I2jSTmkYAzyyV13TK8rr3hoFAqCYStV/st0jFjdzrxKQ?=
 =?us-ascii?Q?icziiLO+/wJkhHhUsznDLKoVqekWiocr5xWuFnhZLGy+zSgOgWMoqFaou2x9?=
 =?us-ascii?Q?IRaJiQ6w41uCPiwxFMz1kdGbqxtBFoeMnqF7kzj+HH5lPmUenXYk6lKxie4B?=
 =?us-ascii?Q?IaX2pbHBr9AYhpsRkCbmLDOhgtxI9dzdmRaRjVznaLSPtaj5WEcxXK8D5bod?=
 =?us-ascii?Q?pbJbSud7BJ9xUQospizZtsludSc/j/KUdwcR5lAzBYBXQdyPHhWTyljCY63A?=
 =?us-ascii?Q?0f8FHI0CpUXPCfBFm7dnf1yzfZSrwi3ExLFqvcNAg4mvWS2gQ9E0zuWO4Mb/?=
 =?us-ascii?Q?wAZAGAMS2N2sFnYkMFtnlLg9//n9afAQeZhyrtqbxpZCZDg+p/xe7Zm1kUEF?=
 =?us-ascii?Q?a8j8QavPj6sk0hSAU4CRerANHAWAgZ+UqtecOrquoHl/k2lCO+mtRE8j+Bxd?=
 =?us-ascii?Q?iYUcUApPG7sq3cVeJUsyJ6pPOCoJoppV08ZFci4OqnGEIqNKYeXs0ZNjrlEW?=
 =?us-ascii?Q?hO/iJdyI1b5oFfYyycBmo9ZgY9EhKWl/ZKbePn6zK4HslkjqFf777ATFvfUO?=
 =?us-ascii?Q?LkeI9AFjIvgecmFoZ746+te1D6gTSEADqnvlGshcfl9E+przDci7sxDgk6BQ?=
 =?us-ascii?Q?5zL7EP/qr1X09t+xLa1+OcfWV9aecqrkqlt0yH0uPt5WR81q+Q4zjg9XJ0pG?=
 =?us-ascii?Q?0t2ZItqSq3uDJBiXqYBPVPKzfGdWy8CJ9CPVm/7eMK7cHd2WiAHIbCvVcDEy?=
 =?us-ascii?Q?XlZydc8HmgBXkuByZ9TMnvoMW6Ku0c5ryFbmRHB4xp9k7HoA35m8mXTnK7yV?=
 =?us-ascii?Q?+ke0o0OmO6Qqx9fT3r+WSLGmSo9gWnl1DMDS1a/ewubSXqaMUIO6ufHhVk1I?=
 =?us-ascii?Q?iCLyf+unUDA3omyLfkMW9xbEBOnjCtWAfwZx9BpmMdT1WJ06ZeKRZgK4Sbgg?=
 =?us-ascii?Q?QS5YoWBQV2bZt8Ke+XRYnfSdQhaq86km8KRJvNEVRe72kSWPQSFNnBo1iLFy?=
 =?us-ascii?Q?9YGLGH2VcCIjYQULpBP/0ZqU1QeQe8cGBeJWJ+GLAgJfxBiJsDSaS+Lgfx0Y?=
 =?us-ascii?Q?bjtqs+PnnxAnUGJSf6FmTXCz4grD5x0/0nJTctD2HWKzmPa8wVrf7/KSnc9j?=
 =?us-ascii?Q?3b26GbkB7bxwac4kDNWk5iHEvdxeADogniDbBGbCrd9255o1dsoIV/teEOXY?=
 =?us-ascii?Q?7qaEAQ19H6kHmEyn8sAoCu2FRq/MTAIqDRIJYj1aH2lqdgpxjC8hdcIG0pW2?=
 =?us-ascii?Q?XwcW5AWauFO3Fk3tuffNYl3CtTuMysBRm8ZS1ZfB4bNTjaIbhmZm0g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OWl4axWqLEZ8iMQ6pYZ2ZCSZbCeMd8Th5SJFaoyzSv82nWopX9N/GW3hTNae?=
 =?us-ascii?Q?hWswBMWq0ZzdxLNYzuAZRLuBqjKZVcpiyJpW93IDMSbabz5FPHVk2RcNjjoK?=
 =?us-ascii?Q?xf5+v66nkFggAkNNx5uFqDHhfZ79HX6A+1aA1aEztr/skq6U126rvAwAUvC+?=
 =?us-ascii?Q?XCz0ntww4D0+PNdaFoV1guw5L6zSH9tIlboT6xPIRHHJhz5C0bfYzMnmIxop?=
 =?us-ascii?Q?9rOw69wYyS6691HLU6DefvVQLdNsZj/M61Jtm6+b9kptQP4x+oJPcc0k+uo1?=
 =?us-ascii?Q?XJ0JkIDYCSeiJX9gXaS+vhx6YHfm0hMRY8jn3b2ErZTmu4sGHNFniWDdpPjl?=
 =?us-ascii?Q?C+0XgM8mFvmD9yX1oETYkDCRcBeXnBY/Nd4rIc522y4puAact9fs8M67b/gT?=
 =?us-ascii?Q?TzVJ3CiCLJH5f8CoGUyvAtDFbfe7/PmRzpc60mefivNdokzoUEwZZpe2VrjS?=
 =?us-ascii?Q?w1pd3Iv+Aonl6FvX3eRlHFujXwUChavzdFH8luY3OkS+SmbV6TV1l7ySl7CJ?=
 =?us-ascii?Q?5JJ6OETXZXtj7hP0iDVM7VgXV7eu/+s9YheEgtFfXfDeZ5gmzvZ0aU6Z74lj?=
 =?us-ascii?Q?egNup9rXYNvAmhLJ+wNuysQsh9Jyu+gwaYQuSlHUIAjgaYGcyVyuhOsbylkW?=
 =?us-ascii?Q?lNcPLNj8sV5Fkr3y/ReBX9IPjASXOxo+fzBGBT+6neYNIoy5p++iEuoeg6ij?=
 =?us-ascii?Q?DQ+WUQNyuO1VybdFlKN3jPvlXLUyhNoE2PEp44oX/6Io4S2AuVS5y8m/L5rX?=
 =?us-ascii?Q?GLvlXoix2thoeW+9Ounrx8YnyQgnKs/WFVCkXPq0435C9CzLkP04vzKLiwu0?=
 =?us-ascii?Q?3ZY7qAl8glq2QRa6SNJZKGCDfnTUc8U+zP0ihD63bEe9PLSbsHJilthM3IdJ?=
 =?us-ascii?Q?dmXZY52TzaWTUKmbrZsDc3XJOzoc846xGqfMpilPPH14lYxNMTKIuB8UkG/c?=
 =?us-ascii?Q?19WJ2/Hf4g1kuTwokx7R/uPGvesHVTYLxTcqbKNaO1Ez8atLVqzKnHDFJDEi?=
 =?us-ascii?Q?cB3lVGViQ+/CAgEyAbPeic7tAgWl+kLEQkjdszY/p7prC1nlac4QrS2W1MZn?=
 =?us-ascii?Q?PadyCKnF1MnAG4h/TDFak9020yy9KBlZQ0UQ8q56jCT3+tzoydeHjvUruP36?=
 =?us-ascii?Q?i9FbsHPfmdaSEbMbNmBK3Et6ocgba8xmmuDEo6I79XAK36R9NeilQuWxMLqh?=
 =?us-ascii?Q?mip6odvZHH6Twkd6xWjQqOdlj4fUmYaZc/j+mhbhmznIpLc7rdCQ1na0ecwH?=
 =?us-ascii?Q?1bJBvWANelBIeU762zhl9CGp0fMjLGhy86KFoARWIjS8JSripZLE+EM7ssxw?=
 =?us-ascii?Q?hY1np7K37Bkde3myAtLhqt/loLtWPL62RSaA7Brfj8c09X6F4rihgo4x5pHp?=
 =?us-ascii?Q?mDiVSMI3Um9BtwjUW6PAdCBblpm+oEAeBxRI3aPB4UIxDzhSiNKdXwbl/8A5?=
 =?us-ascii?Q?/qdhPzFpvcXgdyvnDXLTUF8gDlg8Oh+saeS3GDsi3c/o4z5iQxcjLy5CEdOw?=
 =?us-ascii?Q?5qxFQ9fQCquQU514L6iDj3WfdflH0E3b3FNDZF9yawfBRNjyu/7QYGsydRN/?=
 =?us-ascii?Q?DWueDj6uXLCf5U4BDhw7KOV53Gk6P7rd7UcowULE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7042a02-2396-4f56-8b2d-08dda1e1cd67
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:28:54.5975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HTTlFFuyYIP1WS5+rECMVR+4C4V1VTegfa+5xJaz3LBktB7smDNqI5+UMx75YeWKphwFDdg2jUVKN65AbwqDqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10133

Add compatible string nxp,lpc1850-rtc and fallback to nxp,lpc1788-rtc.

Fix below CHECK_DTB warning:
  arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: rtc@40046000 (nxp,lpc1850-rtc): compatible: ['nxp,lpc1850-rtc', 'nxp,lpc1788-rtc'] is too long

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/rtc/nxp,lpc1788-rtc.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rtc/nxp,lpc1788-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,lpc1788-rtc.yaml
index e88b847a1cc51..e896ba59302a4 100644
--- a/Documentation/devicetree/bindings/rtc/nxp,lpc1788-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/nxp,lpc1788-rtc.yaml
@@ -18,7 +18,12 @@ allOf:
 
 properties:
   compatible:
-    const: nxp,lpc1788-rtc
+    oneOf:
+      - items:
+          - enum:
+              - nxp,lpc1850-rtc
+          - const: nxp,lpc1788-rtc
+      - const: nxp,lpc1788-rtc
 
   reg:
     maxItems: 1
-- 
2.34.1


