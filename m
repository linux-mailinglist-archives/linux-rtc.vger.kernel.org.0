Return-Path: <linux-rtc+bounces-1774-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E7E964422
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 14:16:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3221C1F25DFC
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 12:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E7D11A3BCF;
	Thu, 29 Aug 2024 12:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="b0OKrm1c"
X-Original-To: linux-rtc@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010027.outbound.protection.outlook.com [52.101.128.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BD61A2540;
	Thu, 29 Aug 2024 12:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724933728; cv=fail; b=j1FnNsHyGB1CvfPASRhbKaV3Dma064xm6fbPJI2C5KLjDhJo72G6ipVwlJjfD53lZU3csPyZsROa6bl2ZJ7xkIvb2QoqndGzhmwquYXnRx3dTpIWg7oZgQ0bgk/eywmgcmxrQd3vY5smZC0d9Jid2Vqz5efh5BVcCbap+mfwjTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724933728; c=relaxed/simple;
	bh=pBOUDwfAj957ocT1D5WwhW/HJIWvfdLKJC+CdSjpf0g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dhrVMGtoFUxEwmmQ7e0SFWR1cHLnygKqa2plR+8HYdYChf2QGbmBmtm3zMiXD2sTzHyx84VEysHKl4LNffrDwXN2R8aTovh2vkiziKu84vmRB4Bt9K1/DxMp/QfHA6C2XulY2716XDNV55cdrsdHaNc4hDrkLs9iw2Car3AWL1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=b0OKrm1c; arc=fail smtp.client-ip=52.101.128.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RDzktYH4PK+Z/NV62YOdSTsg1l0ATbt+uZ7vwM6FH4EiBuIiwij3h2jFgD2FEWBvAhTw2dSuvYyydBRbtyoGXMQq7sHQpasq5/MAwV3cWgej1yXrolsmXOwXRiZsNR79iJ5uEiaMO0gcUSul9wsRz9nVSo6rNsgF0E5oP/9sHxWcgHTmNe6HSrE1T6BbQ6fh6FRk79XBvfQis2owQJpu8sOysZK00Eko5dowt16oXiipH9XcCwh2JJaJWX338r5bW5b2GCTFeFFyU5e6Gl1IbA+4HPW6y+dz1gWuPa6rHyEEaajsCBciBEmEPG62ksHo+zrxQQ/DYIxYAXosNouSxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwfsmnUNMTALBVZuXoh7YtP3zSRvNNe2aT7Tli4xyMQ=;
 b=kjnHXNyvIzx5VBscV0rGBsHOl60GI6WZUoK3IPOxw4AlvC79lXr7ZFfVm0k+UbBHsEewVGEArYe7bj2gGVQOD0prk0efPBPPSJtnunNtizEu/X7dMzyuAGZTXuEs9YbwVlzBtcStemMoDk5vFOkj03XCjsLm52FGFXkC/5gRUSjk5UHEoPjBQjgKKUmDHNU1dAgfjOMxmgPh+b7Hog2vKFFu2NYHj5GfmQKkXbAAUZinnR7qUFrqcCZjrlrqiqLbDt4BSrX/WQmOOZ5NEvuCeTjkD7UfZibkSstAI202Xfpb4/JJSn5r9M/hTYzVoEHic6Ixzd0dxx5b4j7scQfztA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pwfsmnUNMTALBVZuXoh7YtP3zSRvNNe2aT7Tli4xyMQ=;
 b=b0OKrm1c7FTzHMHM+y4durnL/gWJodtx/boGFOfxiyJ3QN1pX366zMMUDR62WtLOqrf0tJ/kpldIzveRqdnkiR5QTQitkU12m9giFvkSGVW+O1wLU+cgbkC0h0AM/u4Aa51IqL7/8+REoJeh/LkijzWgpKjBwEiBB34eI695cn1/GcsDmPsqEQNLIF9MBrpnMcoq42iYh+26KMlrKP3ZehtLjzCxiTKxbqp/LS4g3YoZCzlM6ronFdKnz9Oe5pD6A5sa9pHn4TglBFJrHGzFcBApYufz1IgeI/gkKZ7+Iq4KhXdiL121rI2m8AzEYkStYORf+Kc7KzT2rBdANhe+Rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SEYPR06MB5376.apcprd06.prod.outlook.com (2603:1096:101:8f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Thu, 29 Aug
 2024 12:15:20 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 12:15:20 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH v3 4/7] rtc:rtc-s3c:Use devm_clk_get_enabled() helpers
Date: Thu, 29 Aug 2024 20:14:52 +0800
Message-Id: <20240829121455.16854-5-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240829121455.16854-1-liaoyuanhong@vivo.com>
References: <20240829121455.16854-1-liaoyuanhong@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0156.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::24) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SEYPR06MB5376:EE_
X-MS-Office365-Filtering-Correlation-Id: abfdcfe3-19dd-4d00-99a0-08dcc8243ffb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e+062dDFVSIxcsrCz+o1yClN2Gq+AUfTTVosRdF13cHFiWlg4GVm4E2VL1An?=
 =?us-ascii?Q?8qVA7oVWp2dPmHTkL2pz+ZTf1xHO8SHSLCBeuBNsAht9Y/eDjcTivIl/xnuY?=
 =?us-ascii?Q?FusC7o0wdB2bUrhaCvzPRI0MyqHeg7a8YxwuLD5tRnkFJsgxTKg9Psf1GLuZ?=
 =?us-ascii?Q?/TgAu3tGvErd/PNsXGdnq5/4hwvDHCZdF/8rBi0Obrl0r6hM6BeeWJ+YAQcH?=
 =?us-ascii?Q?OMfg5WFeyMI5boRrGfdFSFkQMj2vX3aPTa0YWajtsSnM7uh1Wf3eYOkxYmAy?=
 =?us-ascii?Q?fDhm3O3raEZrMAC6jD8zAHUJXEQaHMKzEJhg82xMiSpvPRMx+UL6NRBX/xS7?=
 =?us-ascii?Q?5NDUymj9ZLyE3wqw0KbS0ZbzJP9z4XS4m6I3x+lBrIUAyYPgN16Ma6Wcm6fF?=
 =?us-ascii?Q?e6Yi0sMug6H6hQK17YzArN2d8sR64WG7QYJdVxBumptFTRG7GNBWvtmo0DB5?=
 =?us-ascii?Q?Gl8f9PHkFTWS4rymTjbHetDX9vORCAhtGabZ6p6t4xm7lntJa6TmfDvgYUm9?=
 =?us-ascii?Q?kKKNzqiEpzJwXtmg/f0srA6CGJ9I8NAnUTUObl2SpIJNwtk/87zdmUcsxrdQ?=
 =?us-ascii?Q?w8DZMrb5UPzWjPW6UA63cK/C3VqiIagvJ+3xRpP/UlN2QGq6fwD8kmYOnKUD?=
 =?us-ascii?Q?KCYQtCcmIkMKsjWYU5+LHVcGHIsUGunHTairyntvd+N2vTLvROh+wIzGbEfU?=
 =?us-ascii?Q?36IYO30sQNO6n9TpQr/7I1OaP9cl5OyistJuNGPepRED4DT+TvcGTc1L9nla?=
 =?us-ascii?Q?pzN02pYdFwW/5PUozbaSuYE0R50UlD2B5SEkcg5W/hcCCvy8jsJIfUD0IfZQ?=
 =?us-ascii?Q?w+vyae4fcX+1uE0yjX2pZsMiD4mCnQgG1r6fOv2QG5bbgeaciqMsZUsY3C+i?=
 =?us-ascii?Q?H94FXHLks2HzrW4UEyxZAebahL5xZEKgVWncA9rDdQBn28Y0fArU/YWKtJhp?=
 =?us-ascii?Q?Qskg4LNq7WpceKQKoIaQ0xlFRyT6XcpPVR93e5/bULqJ9oSK+I7H5joQytea?=
 =?us-ascii?Q?i8O92STK/cwSYHAHC6YrvfxTd1nkQq1Rgob88ztOK3zzgxu7i3JcIulSvy8C?=
 =?us-ascii?Q?OqKKExRJ3uuO4NPqa7WrsP89rls3a7ZAP+u431Bfl7crXPmP0/hINMrSPFH4?=
 =?us-ascii?Q?n9XjaE+2c/NnqHVaHXaDjztfje+Mp6jVwl0X2OPdNenMpz8ob0e0zngRYqsQ?=
 =?us-ascii?Q?zjRcBz6KGSmQXzOjIT/2HoRZdpC0Vd7OfkG5aGsHDfpdk1yFQzNxy5mwmULP?=
 =?us-ascii?Q?4kPs45SnP/pl9Yz1QRSBk4+0wgOH+6Svr3V+aXJi1b5QmgMU04vbgN5Nflm9?=
 =?us-ascii?Q?f7SE1PBWeigmzL5rFz1pmHJGBLxR93/uaSdSP0QinUziiuqN7IlFVMsYojdD?=
 =?us-ascii?Q?r2zihH1DzxxHOa03pxJ0mapTFFRi2CNs2iDTXtg4SaAYEayP/g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qtxgH/jrZ8CbebfWis2y0UyMwgjDgg2qOfkVEeVCoSKby1VkPq4vAI19YaHj?=
 =?us-ascii?Q?gYMasneSMmUPcjXWRhskq/XLCHB8eaw3OmfnFmNtvMYwT1+ebI/TE7e8A90y?=
 =?us-ascii?Q?QrdJvkXQeZr/x4bC8UHZPWYEqJ3FggdpYzmavI2PAkBLGVq19nwYV9fMi+tp?=
 =?us-ascii?Q?IF/tpsZ1FHTsB25f7W7XqAWlq9dfiPgmifV6FD7CFBz//EoqGXEb1f0NvQQc?=
 =?us-ascii?Q?K1Hzi9R4ZV7DCwltvD+pnZD6GBxqzgWiJ5auo/QfNVo5y2RVr0NVCdcl78er?=
 =?us-ascii?Q?TG4OBwHXAH593+KU+4YIuToe+iLGX4H6xfSS283byN9UxWQZH74S5gjUN4ny?=
 =?us-ascii?Q?H0qqNTawPUR+QR3G0DwPlkMIjl+xDOCFdt1IQcNSqcEIl+MUE5rX3gak0WMp?=
 =?us-ascii?Q?RJenCcrSTrlNYtXqmKac71Yk57bz0Vza/t2MlaaL1RzVyJuPvmrzAWmXM6N9?=
 =?us-ascii?Q?IyGe8cMAjxl1bI7kag+YEIa6LpkCn50lYjUaDxc3SCPEcx0qM/DPUztHUuQD?=
 =?us-ascii?Q?IYxU1IZtMrGSOC+fIi4XaZ8HrxEUvxiYv5dKtCzr1hYdkCm5o8QExn7V3thl?=
 =?us-ascii?Q?RpqeFdOdvDWVMSjrr8lZGz9bxk2FQ4l9Bq/h+wY5EEuZFeYhO0P+jHQFE6i0?=
 =?us-ascii?Q?Bx8WKK1Tko0MCTfERdeJaVHjpVRvTpKlMOqB+QysJeHhY+EUBF/3cB2ayB7e?=
 =?us-ascii?Q?p0JS39svJyGmh562b4z5s6aKWV3dz3i0Etq2WfuejSkILZ5fF2pfeKT6rFzP?=
 =?us-ascii?Q?QR//wYx9Lvrl3ACy4Y8ggjMv2FqIRWn5HRuyU4Rb+B6y36DrYMJs79P4/TJ1?=
 =?us-ascii?Q?Yq5ibNRJ24jWfRUn97u1r0NzFNGkrlzbqpp9mY2oZdK9fFBzM/VFNay3TBS0?=
 =?us-ascii?Q?X7A4WOoVLpRqjjl1nZwdhRSSxOv1VZBTtEqvRKyQC4MNGFbPQhQsAidNivN7?=
 =?us-ascii?Q?UTv68JLwlaDUarKSnXUCAkt4u2IzvSJ1motQiieE2fcav2CKo9hWtB3mwftK?=
 =?us-ascii?Q?dq0G1vyoEsGfqKI9X8YoYmyVyFse4sMvOkadqjKiLqU/6V+vBG0YmW07QfsI?=
 =?us-ascii?Q?RLR8HL46OZHqlkDAFWd5AkG89GCVHSywkaNIO8yTqS0o2OiaDDOoxqbnuU2E?=
 =?us-ascii?Q?qhYhokXcEcYe7hMQrvgXscUbn/m5gMS3bPXwyuzHuY4N8V12uW088TmfOfsz?=
 =?us-ascii?Q?4YP1G5hE8AtWOw0HoUSS0gmrQP9kIakr8YUHGK+l4pjiXCbjqgnhrMYD885X?=
 =?us-ascii?Q?RblRA/JRF7gYCRylZIfYAb5s0tcnARBg3pO7ivqhZAvoiT/sWS+iAlNXXS4e?=
 =?us-ascii?Q?17n62SORcT9u7xLoxkbJ6BESrRJxTTRaxXmm4CcWua56YudFJWeLestZ4q/t?=
 =?us-ascii?Q?7zGbPWHRsN7jZC9ia/qli2F+oXRCazE638FE4fKut9rcCqbbyliOuDIUyTMu?=
 =?us-ascii?Q?lkKjVoWa1pT70vVLYtzAswixzBPVoOLPHyxIYZQJ3n6Nfvl6Mp5NHW0faG70?=
 =?us-ascii?Q?+W4vM1RdQ73nYBytDfBcDe/chieiiMaMQ1RnOieAEfaMj8jx8F7qxwgCH+nt?=
 =?us-ascii?Q?HjrfVBfgMHTKTxR2WyOu852MDfxmc0RuN3rSYwSU?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abfdcfe3-19dd-4d00-99a0-08dcc8243ffb
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 12:15:20.0022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w4AZQwsSgFF/o8dm1EKNTadHG1AJXTnp6fCCGc7OXvCXPOr9OcJ4UShC2n16YW223So+KZx3HguRlnmmSGOB4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5376

Use devm_clk_get_enabled() instead of clk functions in rtc-s3c.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/rtc/rtc-s3c.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 282238818f63..ecceffee7118 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -425,24 +425,18 @@ static int s3c_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(info->base))
 		return PTR_ERR(info->base);
 
-	info->rtc_clk = devm_clk_get(&pdev->dev, "rtc");
+	info->rtc_clk = devm_clk_get_enabled(&pdev->dev, "rtc");
 	if (IS_ERR(info->rtc_clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(info->rtc_clk),
 				     "failed to find rtc clock\n");
-	ret = clk_prepare_enable(info->rtc_clk);
-	if (ret)
-		return ret;
 
 	if (info->data->needs_src_clk) {
-		info->rtc_src_clk = devm_clk_get(&pdev->dev, "rtc_src");
+		info->rtc_src_clk = devm_clk_get_enabled(&pdev->dev, "rtc_src");
 		if (IS_ERR(info->rtc_src_clk)) {
 			ret = dev_err_probe(&pdev->dev, PTR_ERR(info->rtc_src_clk),
 					    "failed to find rtc source clock\n");
-			goto err_src_clk;
+			return ret;
 		}
-		ret = clk_prepare_enable(info->rtc_src_clk);
-		if (ret)
-			goto err_src_clk;
 	}
 
 	/* disable RTC enable bits potentially set by the bootloader */
@@ -487,11 +481,6 @@ static int s3c_rtc_probe(struct platform_device *pdev)
 	if (info->data->disable)
 		info->data->disable(info);
 
-	if (info->data->needs_src_clk)
-		clk_disable_unprepare(info->rtc_src_clk);
-err_src_clk:
-	clk_disable_unprepare(info->rtc_clk);
-
 	return ret;
 }
 
-- 
2.25.1


