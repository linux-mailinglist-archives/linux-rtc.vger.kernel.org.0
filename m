Return-Path: <linux-rtc+bounces-4314-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB42AE003A
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Jun 2025 10:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0081E5A2CAF
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Jun 2025 08:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CDC8266595;
	Thu, 19 Jun 2025 08:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YCZG9/Fi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DED26563B;
	Thu, 19 Jun 2025 08:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322711; cv=fail; b=XDxi5X1n1Ac8n4x/TmQ5dMFeto5h9ILpw0qL4cxHp5/I8+VFubtwh1/dhNC1A2HkWT3D0VcSH/YSO55rbxDs5+DwfrGqwQSiptxLdJ3HmioN/7vkV/9vKiuJ5VAa+lcy/wTIbPS6BGX2apgyHqgNNsybc8JJ5vvogxonSMoK3wk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322711; c=relaxed/simple;
	bh=BEVxjyZYhzSP9+pEb8ZMqSIyR2RUKfTtl1KnDZzw7XA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D6JSXwm3IsJdXs+R2kIP6UvioAJw4MR2iL9tsBcfJBG2iHsOShuEzr9VFscolU1fXvWocMYw8M48BR85YdoWYcsmXVpKjZeiiQBz0E1/5KKO3vEdBo8NVeeY6xlnpDrVT/dZOvdh4GdM0kPIeYfSFJgDsD/+I8kKdp2p07z3+fM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YCZG9/Fi; arc=fail smtp.client-ip=40.107.93.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVG8EmbZlgnMLVy8FnASfjReJY9doEBrlQRjo0507zDGwLlhcllp8x2/DDcbCBWpKpSP7FG/BVuqVfx1PZ5qCz+IB/Gyxgc4+UvwD9u/kOB9A7AC7p+EXUKrinC1d5g1a7tFRFKWFaXMM5q2Gy6yoqkG63K9/IADMjFzB89FUTfPux6+jCjTMO0eAs+ZvAFlMt4qN18HM2PYnJQNhZFZaywwj2hmA+FiaJP4f9Hej+2lfYGq2A4v83ozDGTyPHeF5jICrMvfSnO93TBO+a4xmDKS8SFfTaxvOP1ElMDMhaXNfBpzBJ/pd8L8JrlagGTKlzXh8XhDygoGbBp+0yTLnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VeQx8yQ+aHI/nkhkY7qvSKQx4IhG9ARvqLA9qfqHO1Q=;
 b=QEV+iThsn+eDh+jWOC5iP7FxiXYEw1/fD3EZ6MiFQN1BeWBRxNDouvPkMOl9HsOA3QRPjpdfVlEhawk6gqT5hhA0JJD4bjwY23V/6rlGqnp9O3fvMvr6WlHrhjsGOGIFsxuB4rDYGGxgK6V1m8hb7XciVToAfWV4Gh2/l89TMu9m9BSO/FJXsOExecf8KPhTDMcXeRCBGRbhR29Q+5yJDK1bdjlF+YnqKHUC9FOPf2fF9d1ZiGVqCjrwd2wWWuAHh/gYxywbdPL9EMJEMx+oJPW+1ipXZ+qohzn/W/ygN9z4NKaNaK0m0Tn9VZdvokAns9zjG2u0gHj+NdnWXe2AKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VeQx8yQ+aHI/nkhkY7qvSKQx4IhG9ARvqLA9qfqHO1Q=;
 b=YCZG9/FiZ30PnWv4abe+lSXuLHlC46HGQyNUOcod7aUAoowvTXVAENTQLyqoHVHGmlPJJfLUpvUHUcppLnfcSfn2cbF7q+m01bl4eNc3WtWMLAD8NoH4p6FaUOekdvETdllTV62p3IBoMS8uMsSxn2VpghNpdVeHNxVs2b1cFOkQ+UCu/Gjy++1h9qjwJAuGM186b1M8IN6Z10HfVLXhdD8yLlFE/3RmhmSdHRwPqQlAsA8fbBP6zDVryWS06fVEAEnnRxq+qfb8jG0Bl0FIMcqGlDMOKfXdaa+Ut3K5PkHMLb9CTITnoZTWKi9nk+AtMXJf8U2TZm1AHMJw2S5xsQ==
Received: from DM6PR10CA0017.namprd10.prod.outlook.com (2603:10b6:5:60::30) by
 SA3PR12MB7901.namprd12.prod.outlook.com (2603:10b6:806:306::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 19 Jun
 2025 08:45:06 +0000
Received: from DS3PEPF000099D5.namprd04.prod.outlook.com
 (2603:10b6:5:60:cafe::c4) by DM6PR10CA0017.outlook.office365.com
 (2603:10b6:5:60::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.36 via Frontend Transport; Thu,
 19 Jun 2025 08:45:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099D5.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Thu, 19 Jun 2025 08:45:06 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 19 Jun
 2025 01:44:49 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 19 Jun
 2025 01:44:48 -0700
Received: from build-shgarg-noble-20250422.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Thu, 19 Jun 2025 01:44:48 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v4 6/6] MAINTAINERS: Add NVIDIA VRS PSEQ driver entry
Date: Thu, 19 Jun 2025 08:44:27 +0000
Message-ID: <20250619084427.3559207-7-shgarg@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619084427.3559207-1-shgarg@nvidia.com>
References: <20250619084427.3559207-1-shgarg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D5:EE_|SA3PR12MB7901:EE_
X-MS-Office365-Filtering-Correlation-Id: 32ffd18c-699e-4244-42b1-08ddaf0d9733
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x4FHM4evOstQxInwORiE4BBOMqsQrW0ux/ihF+vdrFkuCBkbrH0w4d9H0NTB?=
 =?us-ascii?Q?t7w1h7c4Hc7HOC1rmcLxpt1O238KqGqewJbgZ5n34WCplBq77CDZ2GbI9YbY?=
 =?us-ascii?Q?3qK279fFAO2Jz9rOu8/a/wy2O3M0/vAsl5A6mc47umT2SAPUp/tpnrPQPwVo?=
 =?us-ascii?Q?kGDAwwJkxflz8DjjXWom1FKqVzwfD8Mhyf3Be5TAEGM92h7rUMBUCPqaD2HT?=
 =?us-ascii?Q?cMpgmUQ9TRKsAuEXw1ImK8Y5IZ0c9cC2MIqeCRxsHrCzln75iNU5N4DDE1tL?=
 =?us-ascii?Q?mlJoz9RZPtTxXEsiX15ZwpWotR7cA+/ZG+YyCdYMP5YtnFbwyQXksLfF+JPx?=
 =?us-ascii?Q?YLstzLhSgFv6ggb1ny/KZQ0zz2byHIza0dt5hioxV+qUW+HsEXQfE7D7/9Yz?=
 =?us-ascii?Q?VZxJzshSg7n1NUKcMu20/CDxvpgBDt8ukePppgAECM91WA+0AVJnF2N9WGYa?=
 =?us-ascii?Q?f1VqoBF8QLnkKhwjDIaK/XfKCi2Tli3of9W/oiVofbP5ZWy+HdMYdZY92K8L?=
 =?us-ascii?Q?2g9Z+suMFhRWcSHpwV0ISdO0GXZCj1RdstC31ZZJeb8iOeJ44gNzNtaYmkBD?=
 =?us-ascii?Q?iH3dybESb0TFeEiA6sIP7VRH4nOBQvU+uOJJfDjMeeQexmSB42BfHjuyVzVn?=
 =?us-ascii?Q?AkI01SK7oAe4Bwe/mZRN5cVIFI3LNSpUfq1fEPD+rm1dZ8XmMaMi9TkIFGmo?=
 =?us-ascii?Q?Yb8qVFaAxMedNFt0sdrYyWC+l798DaM3+toySMahNFbrQg9UsDYyVnqcEjL+?=
 =?us-ascii?Q?qBVj2DFZKZ1jp/g4xlprkOuHXz+K/yu1R9n/4Kxd2o3kQTwqnaEA8haqjJZO?=
 =?us-ascii?Q?2zxviRt1xTO7wwRGY0QEDIQN1bt1byso3Mg5swmQySutycJPo8C0Zkf8v3te?=
 =?us-ascii?Q?sj531JR3vW630bIp8385l1zBe2ZviHvAM1coUDR3WPqRmtL3k2HLD8FgXC2h?=
 =?us-ascii?Q?cAkyN2SDhFteqLNd7Unlt9OYR7Oh6PU85Wgz1GongTYYRxMf2E+HYyvJsVaS?=
 =?us-ascii?Q?14TBXkOqUvkntJU0utJk21GwUyBAfj86P3ai1Hk8VCCQ2fstUDcy9UfqlK8L?=
 =?us-ascii?Q?JNE+xA9kdzJu5Q+9sE0Fk4ILaGQjsn27D6fp2VhQj7meo33B2M241AsNDtmf?=
 =?us-ascii?Q?mUwuxhIFVf0LZ9tEGYEEjclSyfi/P1S9MN7oQ4pzoDV1GVLNzIjwZxgThy3M?=
 =?us-ascii?Q?pB9v0Wj2/iqn+lduYdRN/qI/Igc49cwNVHmDnSFqsdnVdpS37cDY3AgfJKne?=
 =?us-ascii?Q?/G1iWkNpDaJEmPfaHNYd0SZo1WtUeZjwDF/C2/NahXaMEBEXhl4ZsGuZH7jC?=
 =?us-ascii?Q?QJ+RZ52MRJ+aHT7v5/GR2Fv/XwaTxO7/lBSyGHnoIsfh8Eq63RI5b4YxX3pe?=
 =?us-ascii?Q?39a/2lRnQybp4vAcjd+1BjM6XCBak+Ax83PQ/mOFmKJukv8Me0ea9Fijn2Tm?=
 =?us-ascii?Q?H9Kd4JFuUxDR1wa0xhGL9AhkNo9Me5jFs4uM0mMFZYPUOl+yV1IrKGDNhyyw?=
 =?us-ascii?Q?9VtIXjoAAcwMOkWL5E5FXgKgV3xuOaut3FRm?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 08:45:06.1269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ffd18c-699e-4244-42b1-08ddaf0d9733
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7901

Add NVIDIA VRS (Voltage Regulator Specification) power sequencer driver
entry in MAINTAINERS.

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---

v4:
- no changes

v3:
- fixed indentation

v2:
- this is a new patch in V2

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9165216d0cc0..11030db537ff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17846,6 +17846,15 @@ S:	Maintained
 F:	drivers/video/fbdev/nvidia/
 F:	drivers/video/fbdev/riva/
 
+NVIDIA VRS POWER SEQUENCER
+M:	Shubhi Garg <shgarg@nvidia.com>
+L:	linux-tegra@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml
+F:	drivers/mfd/nvidia-vrs-pseq.c
+F:	drivers/rtc/rtc-nvidia-vrs-pseq.c
+F:	include/linux/mfd/nvidia-vrs-pseq.h
+
 NVIDIA WMI EC BACKLIGHT DRIVER
 M:	Daniel Dadap <ddadap@nvidia.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.43.0


