Return-Path: <linux-rtc+bounces-4813-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A0DB4275B
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 18:56:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1131F3B4867
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 16:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47AD130C358;
	Wed,  3 Sep 2025 16:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IsBIfFiC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011043.outbound.protection.outlook.com [52.101.65.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615E12BD035;
	Wed,  3 Sep 2025 16:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756918559; cv=fail; b=uv7Qf0EbzETinRZquL5mMc1h2M8HLR8KCtCPQb+Y8l6kc3NhkTVRnwZjQ25X8AHLay/2Wodr8RAiwGj4F2XWQAwqDDs4U0YY5rikhAyGAOSh+XMErjyNZOJLblDtzo82j9A+tual5b+JopH/mgthYfteF0pkjMJlxF4w8DyxnnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756918559; c=relaxed/simple;
	bh=VQhILbUpQJiw0iYVXUP1qytkVrJiscI4qa4WCJ8ekmA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=GnwLGzO2L7k1bRK27gsfupOjmIag7EHKxfoBnhZ+wnp7LFIqcepYt0QbYqTL9Y47+SYJetFFJzgm+gOmI5xei2yiphORbB2AaJBQdyDgS2ydjLpemO+MmUuKS2Wq8Cl8pVUV4ocin2yIueId3reyOFYLB8fe2PES2H5bJ4CFCXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IsBIfFiC; arc=fail smtp.client-ip=52.101.65.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nm0usGoLhAhF/Mq55LEmw7IaRkg1BPa6bTmUO5qkyISg0HrBOm01iMJy6LXoYBB6Kgd572/7CptHN4kGgTUio0wu+Sxp5Lyc3iSnZzt8QyMFQYOJsdvpBeJ2Xq78fmOm+fS6VgnLGlriEw/58oMIaa0Ebc3BKHnQPbrU2ElpyxtJPcm0j2SGX52kuoFc2P8qNz+giyostbzZA+FuQ/Gy98MxEVsCPUoJ5v3aSjGPVm6I70WQVaV8dTUP/Ifnysrj0/51WMAv/BMOOZUTerJVdlwb3rqGp8WHYThR5vW25mrkKuki+wS2PGmdLMw6DGO0IzMAtNAQOoB3TOIcXcBjuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQVgm6aCVwaTa/F+8lAtLvvyTm8YJqi4ZXPiJwMd0uY=;
 b=XoDANrt0XQugcCsKtdRkxArtKb9CYsLUBjJSkL1a0OcEpUoZq9ls9v0hZyG+P8FjYsJWGHYGZY2kixB/f29vawTdiwQrxuCot5saypiFbYUesNeOP+4BZRuQgRX8At+peRgD8QTHputA/5f2DXntivhiIGJ0h/NxM6SFpb1CBSu1d8cpMrREUcuHBZiRZ30lRUSBiXFSdlhVmsSVBQamddr71uTZ6SliXc49TpIKiQTBHTgkHY+oM/3HHfAHDXOsS+9FJaTaPlLr7K5cjKBdK6ojVS2ps/0mI5nt2/FfDjo48vBlkkgR0cHWXiDILerGUg0e2bDcZAnTGd2crhH+FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQVgm6aCVwaTa/F+8lAtLvvyTm8YJqi4ZXPiJwMd0uY=;
 b=IsBIfFiCgKlVxbPVdR3NykGukLxtUKuDGZS9OAk3nGvLSd9dXhlu/bypmT/WtsmMDSiR+u0asOVtIejkVYGGXWriXheGEfqduFrZyEXUa3X2a4XqnlxQDE4LC6CdjN332NZ9cx8H7jYCg6QQl8CdRxQFHME4/PTcSBzuIX+wmZyuLvfHl4OoBK/rzWXld3a+Tm/de6zIpONlnx2FLRxIdC3mKNmvJBArf9i7/rtI06WgWb4G6amqkfybVk8yvsqVk/fQwS/6385BUNC0egxk0Ip0pGb8+NKGqntdtP16OQYUfoa7e7wCNI83sm+KiTyCvZarPkFF1rM9Hwj/DEH7Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PA1PR04MB11470.eurprd04.prod.outlook.com (2603:10a6:102:4e1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Wed, 3 Sep
 2025 16:55:52 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%7]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 16:55:52 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rtc@vger.kernel.org (open list:REAL TIME CLOCK (RTC) SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: rtc: pcf2127: add compatible string nxp,rtc-pcf2123
Date: Wed,  3 Sep 2025 12:55:36 -0400
Message-Id: <20250903165536.431586-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::11) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PA1PR04MB11470:EE_
X-MS-Office365-Filtering-Correlation-Id: 64a671f2-a1da-4d01-3a3a-08ddeb0abdcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|19092799006|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AjFg8IgE1jVuQ2CWHG2+udc7W3pUPippjgyMqZLMQI08nBbqThTbG/njjqU9?=
 =?us-ascii?Q?yNMlT8oKMYfdObEECl1Bo9PM459tIrJjHX5uRd3y5tbEFVf00BQhpWrKMVR6?=
 =?us-ascii?Q?YEjQyOCRz2fQ3iBdhOk9aW7b9K1rEzQdXOhaLqRNfWP0R4PPJrK3C/n+Jdt/?=
 =?us-ascii?Q?j+tTH3LmPIoNHy1O6Ye+5v91lvwocc0i9dDT5niaSacYR/FbVHcqryMIzpK9?=
 =?us-ascii?Q?WXhJ+c1haYschZMb5VVoHuykmzZ3Km4GjT9TtyefgqsWmHSHqD8+nZrhiKtX?=
 =?us-ascii?Q?CCuSQLHGIBGABfaCARdF1FSxhbZIufbgI9hSA0xX/dRes6kIaG8Hco92+wVR?=
 =?us-ascii?Q?GdAEVmOt3iAZtJz3pVLYIc35M7RDC4hsFZweH1Ojsg2LLN9JSxoL29qUQNRA?=
 =?us-ascii?Q?MEICHzDhm4pQkg5/fnKowYMnU6ov4pcTaX4CftGdzefu/1VgJKxMmGSmc2fg?=
 =?us-ascii?Q?CCiHeOX1uzI2u48DU6Ak50jcrAO8//GEyfYyIVHIPwj8PpHg3heSBZCADiIr?=
 =?us-ascii?Q?rQJ20mieNCLuMDlLnH4ekYNfo8DzE+api/yHrTyH8HffRc3r9Itk05DzY2qe?=
 =?us-ascii?Q?v2tcBvtTUKsDWo+t3lXQR7p6zDqgETOjSEo3rzNiyC+0G8zSXK6N11+Y2vuq?=
 =?us-ascii?Q?vA56ZpHszES/dTccP7F7AFdWRdFwX24J/LEkWaOjK1oX1MII/c0NgrdQlS9Y?=
 =?us-ascii?Q?TCABIB52TnXIXleW8oRk/K3TQmUMyGD4kc6vIu9Ibc2GcviNc12xzg3RFz05?=
 =?us-ascii?Q?UK+xSO4/9mtFNnJHkZvH52xqwNcjJG4ZYqdM3875r8550fWuPqlDqJ7Rx6A5?=
 =?us-ascii?Q?GbY/t8WGW3OykGzTbM+/j3PV73Tpx4nWbSOiYdg3GkZ88IiyMK5lL+KfqfUK?=
 =?us-ascii?Q?0V11K9mBaVxO9PnW/JS3Wj+RkXocYewy2jLf1x0ThaasRIIpvcTNREQRG18G?=
 =?us-ascii?Q?EBiUf1esQkhAOaAQdOeGUkf6syt/mT1l5ekUb8ieSr9Dyyt+kEKRUKqfkWC6?=
 =?us-ascii?Q?sZKdTONgTbqei/fEMlgcYxJJyiHFZ4emcXrcRaNbOPiR+dwJ0ohJQyxNbtZC?=
 =?us-ascii?Q?4EYpk7EvEw+QbDr4gr2Oh0BXaqMiPlcoCBox4FjLA42WYSlCuuSfpZeHL9DO?=
 =?us-ascii?Q?cRTFedm55D3kNbhJwLvAZjMGbyYlXg1Yx6YU7Bc9AWsvYahNtqGF1Yvtn/eP?=
 =?us-ascii?Q?XwmFCS064HrNM5xx3Qiz+okuFXBHycUMKPeHBxMoZrG/JZ8fwNAQXpCitHCF?=
 =?us-ascii?Q?NrFac9OEgc2WEHorCUAbNd+Rg4iLfWECpycWeIQArc4ftXg/pUiAcQ//lNQP?=
 =?us-ascii?Q?2f+XRH5hiBE/cjTSbgs8rnf+3Z4+9tKuJGSW89dY1nX6XhL0uKiv5DvJ9Seq?=
 =?us-ascii?Q?ThUBB5NzqqpLk9MyHbekxWR0X1j4Xnf18f/8I0bX9z4h4V/cUC0NxU/XiM2B?=
 =?us-ascii?Q?fTeIoSim43HMJTtLBvfQ8GcfAjFnmkmaml+jdzJLK7aB8REc0WKHkw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(19092799006)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?65a5asUi6YE/ZGRgEkrWm3mQufeRbzzXKMJ+4gQNOqiDFInUeIQPQcs26NUJ?=
 =?us-ascii?Q?noVhsrS9oTRvwRoc/p6qKl2i9uWgcfKh68TYKx70OGzmIACygG1VlMBTwTw7?=
 =?us-ascii?Q?cU+lu0CZTO1GbWEsXE05HJRMsZUkUlphRFexQ3IGnCtO52jKC3KAVbUHew59?=
 =?us-ascii?Q?uEKGBwRBKDaBzpkXOhqJGZLNo8U/TYG2nInTLJw6c5qdINU2cWpkVESU5xFn?=
 =?us-ascii?Q?KBl3B1IXz7tRz1xFh0luAueptynndd5aey0174ZOPc7DU0WAbxoi6F80Ka6o?=
 =?us-ascii?Q?n6x2lr4PcNjaE2ONtVscDp8taEkHEBedpgMwVFAWqo2G5IDslnqMHpX8WC6c?=
 =?us-ascii?Q?AFbsbiA08KyTkEzZ6L0Z38+agQF/tqmNwqO3JvxYfCfYNxziktaBT8Ic/Lqp?=
 =?us-ascii?Q?47O5trf/dKfEI4Q0v0UoBkjqPtqQRI+Q6Lx9hNb320lufeXV/HSQVWOTo/fS?=
 =?us-ascii?Q?BY96cP9Xt2IQTzs90ogyvFyqa9dZORgfZ75MXLdWnzu+TEx8p9bAyavymF7/?=
 =?us-ascii?Q?twufHQwTEBZseV4cuNNDRNczz16NsEgmo4ct/bh7DF2DIfenyEd9xeVqwIst?=
 =?us-ascii?Q?HZzk+F9KopAzK2Tr3vTW9vH7/nEUbda4+lhZ3QRpH38Nuq78F3jrRU4FkVbK?=
 =?us-ascii?Q?fjEEpXhr1cp3paK+tLOBKIgX4JSrIlISYDrBvWrIAzzsAG7WSOqT7R0si4/i?=
 =?us-ascii?Q?QoaJ5FV2UhFLnWsmn49DH4+stCqXsexHt9pojeEXI0ikDRx+A7Dtg21boguB?=
 =?us-ascii?Q?x+71+2GFhYqGm4HZdtOiX/Wu5ZmShTYdL/DDBSPatFJpTz59CIKqZpO/WIpo?=
 =?us-ascii?Q?Ns9egZcxneIWVcjrlqTijxGPAnhQT3On6ce/68g9xCfPByZxrhSsuByVQjYS?=
 =?us-ascii?Q?IsrCNzQIgEz9y7JnedOR0POOhByYD2xnHCLc234EtpzRcPeF8lPNhRfitQfe?=
 =?us-ascii?Q?0KeIqu0Nfo3pjTLl3QmjjyXZHB5vE4wWjt++HRRvmHI3LXEcTgbG3jXMKzmZ?=
 =?us-ascii?Q?BTjiVGHh9ElYMHA1rGfYvGqTy/r2NW1d+3K2xZNEqb4EHvwR6GiF6zk2utXr?=
 =?us-ascii?Q?EcEvQoCqnikFePcWmtAgLbdm3Oft8hjzgWMv8l9UqSZ2n4gLcZGFlaHxho1a?=
 =?us-ascii?Q?paRnquGK4qf9DBqZJxOhGVTyx9kgU6gV0wBLaeQ2osgDoKpVqenUlVRy1Vas?=
 =?us-ascii?Q?VsmGNkw1nvq4j3KxN8AuydDbEwuZ1zw7B1AgyvouzXuV5+Xq08nN4ZKA/Fo0?=
 =?us-ascii?Q?vi1UMujt2ni2PCVwz+svzLlpyQJdaDy8KjjLcdGnjMHx/+8Mj6Kyufo5eXPX?=
 =?us-ascii?Q?0092TEl3kVE1sc5PLS8zkc9U747U/P+AkAH7VE/25nb+qrNuCT4C74URZLIC?=
 =?us-ascii?Q?R++OUNhv9qJVN+fvwss2D+B2jAZON37Iht1KDzBuWle9wVSF2oeBKn3Ysg/i?=
 =?us-ascii?Q?c9HqWtLfQ4Q56j8LleQqkfl10PT/R6hROjTFtIi3586x7Hx4mFxmQ4HsuG2i?=
 =?us-ascii?Q?SF7yQEkHbUKrz7m5z635nMKHKwvoW79A1RRMoqHddhaBMKaiQ47xZqvvFuuT?=
 =?us-ascii?Q?qxXFtVCg51YdFpqwrX/ddCfmdxzjs+EdmXL5Jvp7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a671f2-a1da-4d01-3a3a-08ddeb0abdcb
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 16:55:52.6334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l9pg5G6TWlYA6FbkbYC0ox865H9Pqo5g8NZMUQZ1jXnxc24+kxnDR0OBoomzdOFhAjEAlJPcdzPuBSz8deEMgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11470

Add compatible string nxp,rtc-pcf2123, which style is not consistent with
existed compatible string because existed driver and dts use
nxp,rtc-pcf2123.

Fix below CHECK_DTBS warning:
arch/arm/boot/dts/nxp/imx/imx6q-evi.dtb: /soc/bus@2000000/spba-bus@2000000/spi@2018000/rtc@3: failed to match any schema with compatible: ['nxp,rtc-pcf2123']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
index 11fcf0ca1ae07..595c20df6a411 100644
--- a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
@@ -20,6 +20,7 @@ properties:
       - nxp,pcf2127
       - nxp,pcf2129
       - nxp,pcf2131
+      - nxp,rtc-pcf2123
 
   reg:
     maxItems: 1
-- 
2.34.1


