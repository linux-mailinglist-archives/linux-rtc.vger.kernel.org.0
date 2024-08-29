Return-Path: <linux-rtc+bounces-1770-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 256D7964417
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 14:15:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 487811C2226C
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 12:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C70190052;
	Thu, 29 Aug 2024 12:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Kvt5mfjf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2084.outbound.protection.outlook.com [40.107.215.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0261190477;
	Thu, 29 Aug 2024 12:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724933718; cv=fail; b=NYlNlerIYD8qgta21ke2VhbKLlJVN8H8ggEqbswFlTSNjJyXzRcgP7iJ+7+drwUZ4SLkLWzi5NtkmRpa6WjMSzdD/RCU7INU/3nArKYFYXt3o2qIGRro3SOP/QwbS9SVD4xwtu6ihLjVOrQHQjsUi8p/QDSSAVKdhK4pwYmnVro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724933718; c=relaxed/simple;
	bh=UHoxwhqSSLjSx6zQsGmMoPMawvW2bXCZ/f0U2psq+d4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=syA7TXrDy5wJ1qe7KNoIYCRdE0M3HjZKhOkiCGCg+LIsYor1dToDLT7rPdNc+GbX8HodSKdWjCQqct7SYFSC3k4eVF1KnSSxIN/HkEZ6Yd6rKcvjmJcv+oWn+ROILoNUSpJM8PsB18fnOZGdf2oubULMsHFa34XvSQmaYoEEawE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Kvt5mfjf; arc=fail smtp.client-ip=40.107.215.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZeEmehs2fGP9TYAv4N7aTM/HajzxbhJvHPLAHb4by04lP2+PmKBRHMIlMrFAm2TRjoduJuP/ViUJuMj1Nw3PX1UMq6KsW9RttkS/ITmBiMhNgGHfrpLdOmHTjrmCxPsC2Bn9fglfR8FLJvcQWjIuTqwfIbUGbW6JPpIkIZQahitzCWlgWQJ0Mh1tGrwHebewPAD8Kci3ttGGCnH4PAnmADGBBfx9khwy02gIvy6RtL+p1MnG+bcIQye8/PgKfb3/o2PJz7ehO3TZPKEjGQQoeZnRU4nA9CxXoAlAF9eM/xSuktR09f45AyN6CBkjjLa1F/JQZfRyj+NXkgTd9Nx9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=is3pVNETF3x/n8Uu5vuQP5bN3K5WwU4WWUdnszQc+WM=;
 b=QGGtJXVneLQm5Jo6eTsOnJU9PruLZ4j3XU9dgAJvTjfTKfG+iyxuarH22AcoWP/CHpkJlJK2H23Ng4o+PiVKzRqGXjSkT5sscuB2QUMUIro6Jwgz3JQrnwq/gFm+NHnsZLaqsupQoWSzdGa1WBvIZwOGLGhY78lL+K97UwEhpz3xmfrhZFf2OOMxAW19dI9jPxkZskOCN40pJZrpqglLSR3YnXMRxC1wg9o3+4/SUhBs+XxLazBoa+R/fpy7MVNt15i2DEtzNFOPlQWYLFZYJ+oOjE5c79Mzdi/yUj/FVFulhFcPt+q+XIvH0UCbSVa8PBDpfma9PTR8JEdI6Qkobw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=is3pVNETF3x/n8Uu5vuQP5bN3K5WwU4WWUdnszQc+WM=;
 b=Kvt5mfjf2V4LjEyH0FKLvkEZ6S535UvlYBfuQ3CSazTJWle3MCI+SVrzgrsbwDtvexB8715lqK1BcDw3E+q3JROJAiEjQSVxSxmJWACtYyEpe7zS1mVmRmXHw96DozzytxQoFHG6I/eYYxtl2LPGovLCteRz+sKBEZ/knRJcZBgWLzFXxmVSioBiD7RKvAot2SsgxnyyVJvE8ue3MSosnJ/gkh+drk5tw8VMB3Z44hMOybCxSGWfYDMkqSG0CyhmtBkjSUBE65e+DLGcwjpN+r61sDCOrUfzSlEfkZZTnDVvINyWDd7atM8XVgnH/GKD7K2PL8a3toNRcI8uRZVBzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SEYPR06MB5352.apcprd06.prod.outlook.com (2603:1096:101:68::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Thu, 29 Aug
 2024 12:15:10 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 12:15:09 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH v3 0/7] rtc:Use devm_clk_get_enabled() helpers
Date: Thu, 29 Aug 2024 20:14:48 +0800
Message-Id: <20240829121455.16854-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SEYPR06MB5352:EE_
X-MS-Office365-Filtering-Correlation-Id: 564093a6-b7cb-417f-7d1b-08dcc824399c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F8WkSGZkxXkwnm5LxaD7O8Qsy9yVimzyxSYEsw9JNWrxD+unFM8n2aNuCZVT?=
 =?us-ascii?Q?6MQVyK0eR9te4NjnfOjCmyBMt7OiKJ2fyrIT8Dvic8V2ep/Hw310MpydQMme?=
 =?us-ascii?Q?OMuo17n4DxRhmXIKltPjCdY7FFCnMDWAL1OcqWZx3DfkFuWBjxDV7o6trrZR?=
 =?us-ascii?Q?IpJEnx0yj4nkFiSyObsKsXMj92ptnG6Rp8gWK5uWdtJrW481eHs9IY447gzT?=
 =?us-ascii?Q?QQTjWBikWkrHsDSkDFuF41K6jc+eBVdYsGfBwrlf6Ezv2/9c13jikO9LPknA?=
 =?us-ascii?Q?x2/yQYpR0WPQ9VY7XCerUjfx6NGPonO2seZoXmyj/tXRya7I61MGQA3HvnLi?=
 =?us-ascii?Q?qT2DmqY3pTx4S7Unmi1eYFGQ+tv+jz6DnLOweJ6t5ur2lqSu7HPnbCU9zfBf?=
 =?us-ascii?Q?X/RPica1Xkky/P95E6zjH8JVBZ9F3fuczgIW2ek7egdBGre9t1Xhnjl7sEGQ?=
 =?us-ascii?Q?e5sj6jGMNA3Bd8jAolqoaMX9kf4X77MvbN1gSkJdvjLnGeKFumiUvbql70eF?=
 =?us-ascii?Q?mIGD6RuYEkExylOxHhpbN7Z7quSH0sB1wQx7KuV0OjRQ+bpL1GsxEgiSNNrI?=
 =?us-ascii?Q?DKkAGC6RCE4uMIo3uRgjwAM5nNUMZpGSH3W1w3UAzaNYLmP5B4EVTTNJUVEl?=
 =?us-ascii?Q?0NaVGqhBxc/lm+Q2K8RlCdzwP1y3REQbjL+uSj+6pvAdbV68hETv69RgmKjw?=
 =?us-ascii?Q?060SQ51pW/zsdB3ysKCHhZXPUPZbY48ii1ZgHJBLMBkzDNLmAIYEUZaKLY/z?=
 =?us-ascii?Q?QfmJatAhWCaS0vZcLpRloG5DJPGK8kaD2BmyW9ue51+5VqrjUK3k9VNn8r1/?=
 =?us-ascii?Q?RpqwhA/rx3yMXQiEVDvdJ8Mx3PIkdgJ9ivBSP64aH+oB+8CfNnwZ7tccpvJn?=
 =?us-ascii?Q?Ox8SKHNmBAIxpzvfatyXcc565X6S+KYQSKhuKLly8gTOXjxnTFds/3bqMaUP?=
 =?us-ascii?Q?rnPLNQILmg7c34BRkG6red++BaH/T8mlLYXzmvfXoQFh+eN8M7K5zzjb61Q7?=
 =?us-ascii?Q?MWoZiVePB2/mg03lU7XgPXle6vwTbvs8fMRj5dyjcSdVs2TeCxgb9+Vx607x?=
 =?us-ascii?Q?jp7TnDv9NDpVhKdmnIHXlOyb/oygeJ1hqfY94QhfsPzfhYynRsEKn8dlt0NY?=
 =?us-ascii?Q?lwon5BpbZhuYiUvLbPZnV6ohHDwUR9GXjGQUprQAjBCubKz7Xsg0SPg0srVl?=
 =?us-ascii?Q?hrkcAvhUhmxzkJsAp+mn4vjY+vVJwlrMqJ49auX8qrHlbDyR/oC92Wr1AAix?=
 =?us-ascii?Q?cQH0kFGxUxuT1jxYr4nVdAPK6EbV2ez/spFW2L04gKtLH9m1HEXa0JaSynpp?=
 =?us-ascii?Q?CuBMJKQPfKK0J5ifhC57iPj6N59Ga95l9TOCO3pqMXJi7MLlTIB5+QEX+8Wu?=
 =?us-ascii?Q?NhSZ/xuEOVEdtiFQFNi2dX0Mtj6BzfgbVBqW6WyhqtII+ZuEqg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GwYLDRnSeSyvNDFy+XbAz84HpOy9HCZVqtUPNygz6bwba29AVgY29X/FbD42?=
 =?us-ascii?Q?rVAtJHed7wizb8pmgBVjUCjdZz2t7zzwpST0dW4U8jhOmN591AUmx3547oaa?=
 =?us-ascii?Q?VeTt1DsD0Nxb4M2daob4OntaNzq0T9m+mH6PirHkcogxZoOwk0nGbbolWegj?=
 =?us-ascii?Q?C7taEtWdljt1nc4RtrjdTne4kbEtiyAbw9wHK5rsXo/mfNJ8UCQW8/PA+MrZ?=
 =?us-ascii?Q?2SpnWtqONTYpfk/O/nNCMSN1gTOvlZghS4PUhW1B1xuDLaWd4uW4d20V8jBP?=
 =?us-ascii?Q?rhLkCRWqD4RB3+jeN4ElLjuDQnfEtoLREDqLKY9R8aL8RXEBthE4g3hm542G?=
 =?us-ascii?Q?NqOB2yR+L/dDt7nNO3P8yT6BrC4dZJFMZJhFlZ/y2befdJYvcPcvQPCGhfqj?=
 =?us-ascii?Q?+9KuUCBppiYmDiDI1gC8V6FbwgEN7pQJ51gJwpbuA9yrUL55wPO3tWrZ0R6u?=
 =?us-ascii?Q?NqBlSSdXatjuiJfHX/PEvvNouZpC9NvWRcjIIst5noOiMdv6AyqX25sJ4Jvt?=
 =?us-ascii?Q?WViY2okTKEDDNIRvGBPL2EHYlZVlcq7vnHorz7yBvqRvYB6fK5LrqKauqeBQ?=
 =?us-ascii?Q?umkS7ekb2TQttiWUL4l+ATCvuMFAcDTpvNrqZgqFNovzm4qLBURF2ebzW3hS?=
 =?us-ascii?Q?SJn+vWpJPHRKygCfVPPvWwcvH+wpA9dU/gA5jaRa0QPXpIXi3vTH4sDSajei?=
 =?us-ascii?Q?nBihdtymMh3yxBCzntEjuEcL5W2EvhfczjcS9FmVdjeBtBQPc6qqdlYCGS1d?=
 =?us-ascii?Q?vSbXtTjRU6h0BpjcvgS5eQqjNNGKNesqL+TFRD35WH1mglOvWNUCxzqWyC0t?=
 =?us-ascii?Q?TFiyTAx9lDiBYNTNGJA/2rs/NI4jZaFrkeG6fYU57FgaJrVFSDoEmfzBVM7E?=
 =?us-ascii?Q?fcemwNCBpy6weZezAzKC6QQEbzXXyCZscbTGChMjxoiMAT5WT8/p5QxjbntW?=
 =?us-ascii?Q?wBESjeAI5Wrf5vNmtlNFNdmVkODo2XKCniwIcgNGMHAF1GCovwTjHvsHWup/?=
 =?us-ascii?Q?8VDQ9at1Vw/4SlWLj+yYY7JhPGb4keLB3OFJxK8Cg5LLcJBZdqlc68mYH5i5?=
 =?us-ascii?Q?j0uF66gmR+ISPodb+OH9uaaWQwh7te3cqTOD6tOX+d7UBJc7oNEy42dDHCZK?=
 =?us-ascii?Q?zuHMZnoB3qg3D4YnI+soZdcnUPRVPzbDa/4emRGhcOCYk1qhl+QEUN3L3RxY?=
 =?us-ascii?Q?gHu6mB0vrOmIgXfXcXuLYlRduChg4GLTd1Me2cLxYhPFDM6YvkGoajtiAjFg?=
 =?us-ascii?Q?fdDCEUxh+oYdAF9PIJMvu/3uw7Atug5W0O8/dtYIzCJ49On2wKiUWoCLuqVI?=
 =?us-ascii?Q?U9w52IRS36Ayl9loYE9M0ZgR7+xb9fgtn3N5XF1ruIGQ5i0Dlkdlv83+Alh7?=
 =?us-ascii?Q?C7HMKWS7IR7ZcENv23/IopvWznXEjy3sJNkrkmdyP9dNqwKPrfjk+y7cJ8XF?=
 =?us-ascii?Q?AO/iINiFJH37Li0egkN5hn+KTDMhGaSBZPQLZ1uGVpy5axVtNTRKG+e5RYp3?=
 =?us-ascii?Q?fuyNvzqz9ukl2l9PDB3lOCdclnlwShHMt8irsQ8f7FzBuFc7WL3rdjciMwqK?=
 =?us-ascii?Q?8fQ090rRcvs3RljnXLIOE/ofIJWqihV/lD5bqUeL?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 564093a6-b7cb-417f-7d1b-08dcc824399c
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 12:15:09.3348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HRt4uaxeBU5fYnuqDMOkAujktQSUmsbTisOhiuzp9WBUm3fh3gubTA8i5sq2jKxrzoUOkBqcvV+dZXql4LXc6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5352

The devm_clk_get_enabled() helpers:
    - call devm_clk_get()
    - call clk_prepare_enable() and register what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids the calls to clk_disable_unprepare().

---
v3:Modify rtc-xgene, removed modifications to the resume function.
v2:Removed the global variable clk and replaced it with a local variable.
---

Liao Yuanhong (7):
  rtc:rtc-at91rm9200:Use devm_clk_get_enabled() helpers
  rtc:rtc-imxdi:Use devm_clk_get_enabled() helpers
  rtc:rtc-mt7622:Use devm_clk_get_enabled() helpers
  rtc:rtc-s3c:Use devm_clk_get_enabled() helpers
  rtc:rtc-sa1100:Use devm_clk_get_enabled() helpers
  rtc:rtc-tegra:Use devm_clk_get_enabled() helpers
  rtc:rtc-xgene:Use devm_clk_get_enabled() helpers

 drivers/rtc/rtc-at91rm9200.c | 21 ++++-----------------
 drivers/rtc/rtc-imxdi.c      | 18 ++++--------------
 drivers/rtc/rtc-mt7622.c     | 30 +++++++-----------------------
 drivers/rtc/rtc-s3c.c        | 17 +++--------------
 drivers/rtc/rtc-sa1100.c     | 15 +++++----------
 drivers/rtc/rtc-sa1100.h     |  2 --
 drivers/rtc/rtc-tegra.c      | 22 +++-------------------
 drivers/rtc/rtc-xgene.c      | 26 ++++----------------------
 8 files changed, 30 insertions(+), 121 deletions(-)

-- 
2.25.1


