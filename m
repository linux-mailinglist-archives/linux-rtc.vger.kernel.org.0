Return-Path: <linux-rtc+bounces-1754-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F267B962706
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Aug 2024 14:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C8631F23D4E
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Aug 2024 12:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3D7B176248;
	Wed, 28 Aug 2024 12:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="dXxDIhaT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2071.outbound.protection.outlook.com [40.107.215.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03334175D28;
	Wed, 28 Aug 2024 12:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724847923; cv=fail; b=uaoQRkw9018kl94n29Wv6MyrokC9PBz4Fa2+uB8Vm0Vo6Gok6VZmTvv/zQim0F7aCtFEpJNFuxdsc4/X9MBjhd+nMJAG/eQYavIRATvvQXxciIv7UDwXjRSgp8Otwr+PTdmT/PoOA2XP0lC4VWSLFU49X+Bu9ysbz0cEmPQcgAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724847923; c=relaxed/simple;
	bh=o6NdZHjbJ5fXKeUxkEp7C4vpsCSlc+Z3r1Q4TIuQLrg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ADztXJLnJw57THfVONltiL9hJXG3qIiToj7O9JwbaTHUqkTRM1oyvvLygqjZ13RR+T+xrCK+SH6t1XQL9dL9lnXVGKFlRnJlUIgu3pnwfTjKFP0z/rlz09imEpvpHIeJ1WgupC+Fx7bi20hhoOiTCeW9NUYihbHTqo8FtOUG0VA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=dXxDIhaT; arc=fail smtp.client-ip=40.107.215.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HG3aNLYQrnh9csDHnkaNxWmFQbsK0lVtKmTd1+AmpwWgiHRCqULJC1+BRhANw6PoAuW2iZLIKtoE2PLZAqQ3T0f09Ak7X6zyj011qXpUu3SUY5PVWUM5kW/nDRhQ1iBJqGm2zvlelNz6mrxEzodtD3efGLZGmvJvdWaVV8yJ36ZyDpR3ghXPjoQVxoJnvK2CMMwURq4wdVwIxo5MRK8/wcwi3Vbxc+s81G5xTtOEYswlYH7+KymGRzgzerm8lzcClgM07UsGYLcHt7j+3SAjeDGezYOEgXpM1+QK+UIfP1hzT3BiWmd8Hz5iLii/KUM92XCXpqdXYUUu1sUt9ECq0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ojy4rbHwUy1jJhwVF5dBJZzOpMUBmKIqj2Otzsnr1T4=;
 b=Cx6a5hdOOC/7901rFBvm0RPwVGDPVM22cj40tL+APpMVti7uZ81xOfvbdkGQhprs+8cJDT2pMuZsLA27NNrZhGeDmLL6BfOvtJGCSty92ZqW9j5R7zfDxfqrhYFNBMSj046Wfc7U31ZJiQ8aCft7EoAJnbUIyeIQNULafi8shspWtDFuMV8DamS8ECedqaDiA4gEuvccHpf2sxOVuWjj280NSOGZiPz2C1/UOz4LBD9rPfxxVXFtpJYMyPABjvEmVxl2Dwb4IZQLzVnl5cmSL8AeRvPqvLVoVkEJ79XUdkUoQPA/m3ItmdZ1Ifn0rCAsh8Q6K/91bTXE2uPaEPqFdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ojy4rbHwUy1jJhwVF5dBJZzOpMUBmKIqj2Otzsnr1T4=;
 b=dXxDIhaTWmVIKNDsyxotwBRzGZ6iOGGrPhS5BBOGJ+WyNWkE2f1NAQy5vjG2/I0BPciKD2mWVGiVAbNMRYvhunzlWxenylMudocd1+I8tLjn/XH7a5kFiSdgUzc2PMAQy6SgHVeGO43LqqWgvLzfAqTpWSZS57EFTdLhRsFrmJibr3eSFZD/1VHoMOPvBkmchKXv4HHwY/s0o8+jzxUI24htxQ7zpgIyhnFT6OP7vCPWxBHFL6KinxeBnITufTO9I3cNe5ZtGr3GjmLHCC6qFoeyHAJY5Nq6w3JutSYjveFNLXgFar+OFBVje+p5xF+yYDV/ssLcsgrrESyCiydZDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB6263.apcprd06.prod.outlook.com (2603:1096:400:33d::14)
 by TY0PR06MB5625.apcprd06.prod.outlook.com (2603:1096:400:32d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Wed, 28 Aug
 2024 12:25:18 +0000
Received: from TYZPR06MB6263.apcprd06.prod.outlook.com
 ([fe80::bd8:d8ed:8dd5:3268]) by TYZPR06MB6263.apcprd06.prod.outlook.com
 ([fe80::bd8:d8ed:8dd5:3268%6]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 12:25:18 +0000
From: Yang Ruibin <11162571@vivo.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Yang Ruibin <11162571@vivo.com>
Subject: [PATCH v1] rtc: rtc-asm9260: Switch to use dev_err_probe()
Date: Wed, 28 Aug 2024 20:25:07 +0800
Message-Id: <20240828122507.1323928-1-11162571@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0053.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:115::6) To TYZPR06MB6263.apcprd06.prod.outlook.com
 (2603:1096:400:33d::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6263:EE_|TY0PR06MB5625:EE_
X-MS-Office365-Filtering-Correlation-Id: a89fa828-05c8-48fd-2b99-08dcc75c7a94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014|81742002;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wTtbtWi609/ZAH+1ubJWixWW7hUjSWAaYgaCTx1CtEWjGO+nkZXIndMKbUE0?=
 =?us-ascii?Q?5hEl0JF/1v5o3yU1V/TvKIJPq5W0zZFJyj2KHfAtynhx/5onL6RYljdy5EKh?=
 =?us-ascii?Q?H//9KnYGAibdn5UKBbbHipFOWDcOmOgnMZsvp2rXYVprgk6Qb76SiOO3TaD6?=
 =?us-ascii?Q?EwPyP4iJOaMZbDXTXU+q14NbDfIRswqSR7jCv9jX7ZYo37APYoyGwItFB9c9?=
 =?us-ascii?Q?YmT9D2nt1KHfBAPy8Lc82KlrTXa7AFe4WlTfOiTIpbg7QoLbS7suPtnzr2lq?=
 =?us-ascii?Q?pGGS6Sj95eRTbBag0vvUdQTv7FEQDWHOKhkbuOvffkOBH4ockuI+JLghC77h?=
 =?us-ascii?Q?QFRZc5fyXitxzB/DbXU2zRn+2KCCPqXlDISUBofVmyKNn3cg6DloGOJ7mvju?=
 =?us-ascii?Q?F9r2U3aSiUjVn7IPBsfpy5o5Hk409sv73/SppA9B6D2vH+olOd1RoCjMvYIT?=
 =?us-ascii?Q?/rEIsr5rxIl2Ad/XeKfPq6yPYBXYsfNTsIeQS3sDhwoITDevrTjoKOWBLnHa?=
 =?us-ascii?Q?ItchIyVHjDJoPkbcv3f7MQv74LEZHLZ0lqXX6G5DNo9D57qa4qaDF4gFr0fT?=
 =?us-ascii?Q?Tw49xSTqFrJqZuq4Z16gAeN551zmWVXGS0Z5Ie3YWW0WRddLAa8QyKgbxRE3?=
 =?us-ascii?Q?Olo0WOSecBVu07XzC+GNumrFu2iSx67tGpHVbAP6DhND2Epiy3rd2deACl5O?=
 =?us-ascii?Q?L2MOaqh204cexAZmozm/oTWFqg8aEHcwx+8QWkB39P0OlPoMuTli9MQ9s0Xi?=
 =?us-ascii?Q?hwJevhU6ZmblKf1s5aDcB5IfZ87yzN4PmT3B88oQWKjwYkE9EcCA+9FIYKTo?=
 =?us-ascii?Q?mtGiIgZr+1gnoLB0PH7venJCRTTS/gztpAQmS9fcELo+DgfS2AwzHwGgSuua?=
 =?us-ascii?Q?kWxYaqP3ujY3rP+tVI/8UpZ+kuchipwczGj+sQIBDhna0rvPgra8h2q8R2U2?=
 =?us-ascii?Q?Fmcwc0taUgHfbBebv4PtMv0kyVGuNB9xqVZHVdzvH8vfTAam+WoNpWto6AVY?=
 =?us-ascii?Q?6KxS4aDrCYqKx8s4SHhpJkj4P0EBFAc6T9dVQhsxvYUJPW6bikB9gwEP3ZRm?=
 =?us-ascii?Q?47//rEB0yztaLmTuY7JtsCIDMfen+3aTXYCc7Tl4UmFchyabOe0c/tGZNlIH?=
 =?us-ascii?Q?gk7HXEc9E8NkFIb5/gDVuCnnSQ+VwU7ygjRveSiPo1Uoyua78RvjboK+594G?=
 =?us-ascii?Q?+4K1/aAv9jgZEId8B3GtFSc+Mp8Vrrzmd6MBAUT+EnG35yChku5wpA1gzMkO?=
 =?us-ascii?Q?KN655LPhE2jtrfgChskNRb3JmaV9jNMpVqS3iLneH914MIRCRBTk/GJgnYk4?=
 =?us-ascii?Q?pBMphwgmPEXLJQVyFQkUa1h6is01aYBvtu4MWuNV1B3v2NADWLERTT4LbSj6?=
 =?us-ascii?Q?gMY4wFaxcm+QkW8kKM0jD/YVpO2yxffSMZo8b0D8WEJ1j0m5joeZPBNRkzJ6?=
 =?us-ascii?Q?6rQlLaF6mcU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6263.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014)(81742002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TIIyEGxn/5+ADlJFw43xIRXwXymLk9hFeK0vCvOGwztf9LJbRo8LHWA0ru0y?=
 =?us-ascii?Q?RCg6Xq1zPs2tJlVvYFu11hAgsYtlaIF5c/w5V6TdpsZTOZwsp1PBmOGOthBZ?=
 =?us-ascii?Q?OU4lbu7d/i/lwpP7lmM/iBeMbhuz+mzMH/kDI/+j5qXPIZ2ujlsU1kpSdtVW?=
 =?us-ascii?Q?RAJ06jtQ1P9C9XpfpDXJdbhRW322VvDfqFfS/Nu7FtrtEw3WtWvIXLBia9Hf?=
 =?us-ascii?Q?mkMuS3TIflmbIuN4FuBqndFKmt/ahxl4Pdo7O51NvXmmjMXCaZ+FfQhwaCM1?=
 =?us-ascii?Q?Gkpl9KzxYGqy1LG05jncXR1YiL6CovTZS2ASbczxwXd6oFUz3TgllzIUkHr9?=
 =?us-ascii?Q?yotBIBMi9WBTqlG6G8Mh9fpRFuxOTZs12I2uBRKJSyo26qriawgPvQaJg5Id?=
 =?us-ascii?Q?s5rbLlesxckZ4WE1yJ9s+gWes+hyapevAiM5OV/JrhTp85OhmSXlXRhgdcIX?=
 =?us-ascii?Q?gJBUNArEpDU366tK9U6HdC7rvfs3SPFqXeOzTdY8dJpWWC8KQFGbXvx8JJWf?=
 =?us-ascii?Q?/Unw6bS4/OKqaKEe7Dwbdy9ywOE2LXfpwS7x/b48B+YhuXyUxtDa9+2SngUT?=
 =?us-ascii?Q?yugjHtM9EXywcFHDtXMI9slDRv+8kGQ5d6rOAM+0NRcMPzFTezPYjl3BAWWO?=
 =?us-ascii?Q?wW3VjboWS1WvU6p0RmSdfcFlIcNKRlfs/AYyGNYMgglvF09No9UwMNTAolgu?=
 =?us-ascii?Q?x+Xge4n8Ul0Zzh0ooJYOfsMKPuvCx/nAOCBf8GJ9pYmo+OZ92ae8eLjiNB/o?=
 =?us-ascii?Q?KMvmrxHCK8ZrAJHjp/od8c00ilaFJHMHQFrunoIzoyfEfBP+uijujtznI5sy?=
 =?us-ascii?Q?+ax9QMYOAOX578DCK//bpABhS8dv8BCg32F/Lk79sV7GDzdNAcCNjH2DO/3l?=
 =?us-ascii?Q?KSaIGBLBkoMPNMQawF/TwmHZhBKDLsEBV5UzVrp/UmMPVfQBZgb/LN+p2bNY?=
 =?us-ascii?Q?fxjVROZnkS7BI+odzVVaVb5ECfyuE34uk4RfuBdITzX1ZUvBM0w+NGiO+IVq?=
 =?us-ascii?Q?fqyFvjljROPPJN8rmzbtA/RWEHF8CWDVMjcJuhsHg6WSopi/sFaIKgmklcut?=
 =?us-ascii?Q?b96VIlq9wMFa2jYvBFNiaj2tDjLuw827tzCd+JLMV6CW0POieHmUNJxsMOkw?=
 =?us-ascii?Q?wzN3hZgnM9eKnaYLJEx+XZsK941XIcxaWFNrah2kHtswlo9HZdYkLVKrcF8K?=
 =?us-ascii?Q?IE6Nh5u7DKrc26th/0r6fvyaYJe/NPw9bkTWafBr+RJOfLzIloMzMHilQWlq?=
 =?us-ascii?Q?wO956+MImAyHxzezVGWIe2lXXBhlMJCduCZgtVeo5iKf80QOYCVicAmvnFU5?=
 =?us-ascii?Q?JWK8dMRPwYv4XKX9Qj3+so0Kw53LBb3llNCNRMWaUTvwZNmXDe7FBvbxMlVZ?=
 =?us-ascii?Q?c6uSWJBeAWN+cKskvIvoIE/Cx8YZdonpMqT8seOhYoBunIu/H+ZYRq1XDLN6?=
 =?us-ascii?Q?iXYvTh6d4BVKx8Dt8G1evzfBZ1SUCHfb/MlU+RKU/qyTdZIyxPaiGZAABg1t?=
 =?us-ascii?Q?7+IxhhLEejUkhtgUQJgZ19gqNYeVJErp8BMtAL5CNPrpCJvXtZoj4j0NDv1k?=
 =?us-ascii?Q?/mle0mW3R+YkYVl7jOb5ihEw2dqQd9yXA+/MAXzG?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a89fa828-05c8-48fd-2b99-08dcc75c7a94
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6263.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 12:25:18.8949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ygZZ3k2A6bbahkWEqtbXH5bZKSIWYNFQmQwof3KINJCd4e7cjCL91Hn1LtgDgwcl5z3AlwyQkBfvexQCymq2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5625

use dev_err_probe() instead of dev_err() to simplify the error path and
standardize the format of the error code.

Signed-off-by: Yang Ruibin <11162571@vivo.com>
---
 drivers/rtc/rtc-asm9260.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-asm9260.c b/drivers/rtc/rtc-asm9260.c
index a83b47e0d..2b7058ebb 100644
--- a/drivers/rtc/rtc-asm9260.c
+++ b/drivers/rtc/rtc-asm9260.c
@@ -268,10 +268,8 @@ static int asm9260_rtc_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->clk);
 
 	ret = clk_prepare_enable(priv->clk);
-	if (ret) {
-		dev_err(dev, "Failed to enable clk!\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to prepare clk!\n");
 
 	ccr = ioread32(priv->iobase + HW_CCR);
 	/* if dev is not enabled, reset it */
-- 
2.34.1


