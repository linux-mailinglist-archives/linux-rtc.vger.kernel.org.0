Return-Path: <linux-rtc+bounces-6555-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Bhp/CuDPDWo53gUAu9opvQ
	(envelope-from <linux-rtc+bounces-6555-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 20 May 2026 17:14:40 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64612590992
	for <lists+linux-rtc@lfdr.de>; Wed, 20 May 2026 17:14:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8325E3168211
	for <lists+linux-rtc@lfdr.de>; Wed, 20 May 2026 14:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74F6A3ED110;
	Wed, 20 May 2026 14:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="flqZDjCS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013014.outbound.protection.outlook.com [52.101.72.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411AD351C3D;
	Wed, 20 May 2026 14:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288566; cv=fail; b=tCBRgC4rckpxv6KLvTGKvmtT32PEG9P/FvJJw7mMX+e99CnKgmks7vrG07KS+N/ze/RcM2qZUsNJzVRemq6YReIz6YX/6NWfH/xW6WDBN02Fvfd5VZzh6MFw9m+QpUlhB+n2tgJ1d6vnzTlJy57AhR17xO+IXizOsKWXH0b1AEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288566; c=relaxed/simple;
	bh=M78Wql/0JQdaSGxRNUYCJrBgxTqzeOT7gx++tjUeTNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ggpcyZhEM8hVtKMa1FJ+lz+uJkHYbuybFDBMJIy1KQzEb6Oah2EjBR92BI6Q61xNt3389FWPslYSPnN9kyqzKcFFim7vjAiNENksRvcxpYsw2fE2+h0y6kKybqDG4DquKc/DJAWGGnCN8o0Nr8Oi4e+1XmRiCEK6QxxcjUArQKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=flqZDjCS; arc=fail smtp.client-ip=52.101.72.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cs8gbhMz1h9fRxWKnMUDKIc99zpfBSzvp5yKfRBcD5uDjxWO/dvg6sEyndr3uX4VoarpXvVsXeR+Z9b4k2HqSVvdNNbhbG6YBchTeCTwiI2NYI36B7adD+w0YFApkOtUKyvKR98p5iaFBL4/zWj++0MwC2KHrlzE+5KHtpeKOBnp5qZRNC9T/YJixKsi8fN/ssJATQXWZ4LyglhzUudcBnUiHiUqgqaFzLiyl5cUhCPlngldctWR3ZWxzRIhOSFezKkbaWzDSgGQcDu4890JMklKFs+f7MxBARfH8+ZktZAcAPXDD44qPGge+K62l50LufHC2Wl72llJ7boO/z/EmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAPqvsP0FNqkydKvgAUPmyLBa5OkrXWtwmZ0LZ/6uAU=;
 b=H9yMvD2IIu0xQuUemuAfaJm+rYv5VPksdBEEBhCYS1o0IgDrh8HD1aP2yw4qbyYEamYxqnoQLM77lJLhdxEIkDvbl73Nr9vhXoLX5wInAm48pK/WRC6q2V69ovYgp/Qi/2dJ4MX4QjTQw4Kch9lje3c5Xl+cxHNJujEPesNsIuGfq/C5jbIXMPaVHPZfC+AhEReslifxwK2NZUBesqOfC6XYLHgOzJeT+f2i0Dy+s2Iob5/zWasNx7vernuKOnYAkLC5Q+J0Fqitm40JO9ymeH3sdqaxw6OLrBe5xllOpUQafNvb5daGJAm5ny1XTBEZOsyWxoXhMTmH8O21v3MSQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=bootlin.com smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAPqvsP0FNqkydKvgAUPmyLBa5OkrXWtwmZ0LZ/6uAU=;
 b=flqZDjCSVQLkX5w+fqf0C0GjrAyIez8aVQg8GO0jZkNHrJtl9e8bJTDSvSydKgeusCPu60kyyFTc8QYrM7N5DfNoulT7NR9TriKGkCdNeirWuCetQK/jobGiS0g7GAnl9D/tZ3BYl5bSgN0qVhNfHZw+0OEqfCcfKGmv9wMsong=
Received: from DUZPR01CA0320.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::16) by AS4PR02MB8694.eurprd02.prod.outlook.com
 (2603:10a6:20b:58d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 14:49:18 +0000
Received: from DU2PEPF00028D10.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::d8) by DUZPR01CA0320.outlook.office365.com
 (2603:10a6:10:4ba::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 14:49:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D10.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 20 May 2026 14:49:18 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 20 May
 2026 16:49:17 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 20 May 2026 16:49:17 +0200
Received: from pc62507-2516.se.axis.com (pc62507-2516.se.axis.com [10.94.180.48])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 6FFC62877;
	Wed, 20 May 2026 16:49:17 +0200 (CEST)
Received: by pc62507-2516.se.axis.com (Postfix, from userid 13629)
	id 6B7F542098CB; Wed, 20 May 2026 16:49:17 +0200 (CEST)
From: Fredrik M Olsson <fredrik.m.olsson@axis.com>
Date: Wed, 20 May 2026 16:48:53 +0200
Subject: [PATCH v2 1/3] dt-bindings: rtc: ds1307: Add epson,rx8901
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260520-ds1307-rx8901-add-v2-1-e069ea32e1db@axis.com>
References: <20260520-ds1307-rx8901-add-v2-0-e069ea32e1db@axis.com>
In-Reply-To: <20260520-ds1307-rx8901-add-v2-0-e069ea32e1db@axis.com>
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
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D10:EE_|AS4PR02MB8694:EE_
X-MS-Office365-Filtering-Correlation-Id: da0662ba-8a77-44f8-be91-08deb67ef857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|1800799024|18002099003|22082099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	OZCnWR7y469JrFgTMNmafTuzpbJVvtYRrbbBwRyHHgZxZDOpjqsaHa4YI4EMdPNHxJVoVtF6L9ztpf6I/1dsQYtdlElF+bJDEs3x7fWXFCN5Ba7ItNE/dJJL+Z5sD9ZdKZ8ujB43TjCfrPOrYw6Vd84Fn2dqRZhlQ0sPw2GpSqw9W86Rd9hhH6TDt8hpApkbW2Zwlc/rSewBhtTzQvX6hPEUtYdN3JY9AR1y/ZSW3xs/swBF7uNi/i6dssmaKtXNH71aA15+zmZK+qeL0CjR5UKVBl89Hrk8VKTcHK3rB3tIR/IRJNQL+KCJ4WAvrFKIx8monMOR6mO3JE389xrcXAIsEKtpzvx97ig/HndwsTY1NEqLfgKr+JTgIfgnf4yN/AZJJLatm7TtyzyLSAXel4K4t1X9B3Tu5uoK0nqi1+PEZ/jo5NSWBbow1CBDY8r4cH0ll14RcWB4yDoQinS3aUIdUa7pFVnpQdGXOraylzcMANJGFZQrTSA3vtyRaVeyP73v05Vuy/T7mTiciSUJ90Lu+B5LoKCNn0CqAP5NCcnB0C6+0bUtRtFD9mO8T94KqWwiBWPTtmP1CR7WtrX+R4H0kJsGymdc/qOkjsLI+JDGAEYL+a3h9uf5yQKdRcCPbmkqZh5jXNVAL4evarhcoUfH6aT2+UMoT1NqAYPcprNfm12ABLjlMnAL17b5ubl/FMglUKtfRKZ6FNwUgeY75wEPC3uStNFQ1n9j/GYfi4U=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(1800799024)(18002099003)(22082099003)(56012099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	m3kpYVJJykPvSn6EmTFIuajHfnc8Mpd8ATUr96VkC9POWjpfPk6Aa5ET8RCcLAuJGpCsDK7CUd4KW76CfnnS+Ypfd1Kz26HqrarGIHSMBlhyIhYxNMIf5qx4p/YcbbmYsnHww+dYKlqc3nf+J3ozxB8NljnsaCp8TzC6szlIkofBRCf0h+c2+pzMXR8JzRxRzHYnipR5B9PdyGOXlrqni5kMjH0tyBFQkupBMj8B5T9va6mNzMZ3h9ll5/swqQAnop7IoCYxQCeBY6r654kDhN35gzvJ+hlw712sI57bwM4a8saVLZDtq/wte5dNOKBJWQlf5QB/pO0JHJ+kkgeHjKqXPwpn58b83ojcT7qwCCQ7sY+oaLqHCQLJbrhve9sZ3bsd9CHUMsRWhFQQ6yKD80crjQg+YSA3dcisQnPYDugj58gf9AXukUJQY20VwURP
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 14:49:18.1308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da0662ba-8a77-44f8-be91-08deb67ef857
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8694
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[axis.com,none];
	R_DKIM_ALLOW(-0.20)[axis.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-6555-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.toshiba:email,axis.com:email,axis.com:mid,axis.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fredrik.m.olsson@axis.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[axis.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 64612590992
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add compatible string epson,rx8901 for the Epson RX8901CE RTC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@mail.toshiba>
Signed-off-by: Fredrik M Olsson <fredrik.m.olsson@axis.com>
---
 Documentation/devicetree/bindings/rtc/rtc-ds1307.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rtc/rtc-ds1307.yaml b/Documentation/devicetree/bindings/rtc/rtc-ds1307.yaml
index 98d10e680144..9b2796804f07 100644
--- a/Documentation/devicetree/bindings/rtc/rtc-ds1307.yaml
+++ b/Documentation/devicetree/bindings/rtc/rtc-ds1307.yaml
@@ -31,6 +31,7 @@ properties:
           - epson,rx8025
           - isil,isl12057
           - epson,rx8130
+          - epson,rx8901
 
       - items:
           - enum:

-- 
2.43.0


