Return-Path: <linux-rtc+bounces-1758-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 468B7963CA9
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 09:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0F852867C8
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 07:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8924416D306;
	Thu, 29 Aug 2024 07:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="MtCp74/7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010048.outbound.protection.outlook.com [52.101.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CE9210EE;
	Thu, 29 Aug 2024 07:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724916158; cv=fail; b=kXTs7ZgfBJQr7CNwLVVm0jtN3h7fJtPPvZmxdrZKH5l3Yb4LbWDd35UXPMrZCFtZK9V6Ydd4I/TnEf5m/FReO7tYXD6ZPgRKu1VVAjfd24fHxW7ja4imQXNDfUGS/apntKw3TBP5yrORzdrfID79xd406xQFHqVRK/lcB6oOoik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724916158; c=relaxed/simple;
	bh=W5gEPoqUF9LVe6DPr6vDC1yWiXsIy3DpdsZuYoYqNcM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=lBd50U6IGfZoYfMo/BC88d9e04ByQSGdYxG/qP/Rnkg0C8smyhToB8oyVTXuPaJmITp80XHR9J/dKdLo0NL/kzlz6j7V6f/2x90TYM6n9mQwEkO7oXw2hzvplgl0mxUT3ILg4Sa7488Tb+8m8QtAuoiV1E3HWPltStYKZF16agU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=MtCp74/7; arc=fail smtp.client-ip=52.101.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okd49jy+NSoXeaHj5NsQLV8BkdFHD6QLYkkiuDOI8FWs1ZtVXgC3O9JLriABB2euuX88oCAgcYOxr+BSqzZwgCgFWPMp/rigqg/zeWvBwWeL0dlyv8gg3pRkVrtoAQwFeP/T36SI1N0qYI1vlLYqrwFHtDybp9/rTG+ORN8bTuLUp8nbrByRtTWsgqhQxo+vxUKBbT+Kkh67BzoZuYTcdW8qTYIXSfYMV2ZO10E+wVPtitL0Qs96tWPIsZtVlEVFNuIj1JsfDAiIyJMXfAH4OH1sCRQ02//ptxA2oDyBzaUMa6MMTo0fbYabSmjbSvHWFR+MXZqGvnROvbeNNJkPfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8X+83m+5XuhYvz/Yp1S+/Q0kKFiYxlY9fd08pa8ViAY=;
 b=IdPbOx9Vuvay3xO+mz5Vea4ZL+4jaJoQRiH98h4cq9UgifOnlmRgKvIDGzgXnKCgFzgHBC7yJkVRQNlKODvjE0+XVQhamEYmjS+UdEQ/E/6jzHcIOJQ5Y3kM+eOpX8HWMnzFkbhocg/SeyPAIAgeUm2FS39y4q8eIQlNx1u/jjizZF6mZlU+dPGniI1ODNi0lDXbNInn6oeHwrkn6YOV9pVzDxy/CJqwRDczAwibdWaSmjZvSXb8hMm7NIEovdEzzJtm6D5DPt22ApLkr0eg9X9yJYsBTJz6GcUMuc+GDACTKXJwT/U3rPj+WjWuBBrqS9F5B6c7xk8CxR+PDhTBSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8X+83m+5XuhYvz/Yp1S+/Q0kKFiYxlY9fd08pa8ViAY=;
 b=MtCp74/7+38mn0s6E9p5ZzqxBb13ppZIRcQA+M9aK7DdrN/ZZLsTakbUt3M4bfQWh1jOBFq5UNZO2cp1jHjdWXQiTCtKRaerAgNihLx9JcT/ZYOWyLUiTQPfJtvoi9NN8rnAJSZl8PRRgftcnhslvtYp3UlqZrw5j0IkGrNk10IOnZV09c98Q0FoxBqMIJw1YgODqyPJpl2y1Bv8HZoRncm84S2iR1OI7id8HaU4TNprojG+ws0bvlK3FazZSoUprY1eB8vdjoDpC8ogxoOCvXQYT7wXRuuryCGeR7kx5/X+JII++NgrgHzmnsC5lQE7UVSuIBNNda4RbQfov3ztAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SI2PR06MB5172.apcprd06.prod.outlook.com (2603:1096:4:1bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Thu, 29 Aug
 2024 07:22:31 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 07:22:31 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH v2 0/7] rtc:Use devm_clk_get_enabled() helpers
Date: Thu, 29 Aug 2024 15:22:02 +0800
Message-Id: <20240829072209.7253-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0010.jpnprd01.prod.outlook.com (2603:1096:405::22)
 To SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SI2PR06MB5172:EE_
X-MS-Office365-Filtering-Correlation-Id: d4818a24-2f1f-4679-2dde-08dcc7fb57fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tZteXWAkQSWPuXo1Ba/MxSx95ix+uwuX+JGh3HS0d7x/lvFXaDMTsRDaCDgc?=
 =?us-ascii?Q?j7shulN2YsGyGOYhh7qUlP1knIxEd8hs8Tt+XVJiObapIytIrFVY8NXIhDpS?=
 =?us-ascii?Q?tj6wFWJvjXwMW/RC/U6mFgCyxbT2BBv4VHM0LsHVBFw6+ObFFVfMZcRbGOXJ?=
 =?us-ascii?Q?fQZFFooTKMVsXk7Byr9Uq4b+NwvHrnGlYzom79vobESQ7w3ZMOrMSBPau9H6?=
 =?us-ascii?Q?yOnhbIsjCDxre4aFph1IGh3mlWaHARHkEtpzTilt6wqRsiBxFF+7ZtsitJ+J?=
 =?us-ascii?Q?QEGrX3v0Kdw/CMYWjNdY5D/VX00kuJRODSIRpdR0BqLGW67dyuiGkqHeiCN6?=
 =?us-ascii?Q?6GwlJRwapfwVk0/+oo7rQ4ysAMg8SokGIAqGGdDL4uHD62hdR4WwrEiBkpL5?=
 =?us-ascii?Q?67HIH/SL1igfrAPigBd/zJXVP0QiFDMRhVBDpFuVqOanMfn3TkEm0VtPSmzG?=
 =?us-ascii?Q?WObIRIWvXPTZK1RNqvMdhgbLClWdHiDKHVHYOv/tw6Je+QYhMv27YQsTd3PO?=
 =?us-ascii?Q?SpjuWyChGtBFnps+7JofqFuwEnklUyA7z7Bil+MluyLPXEeGVF6BC5+BB9EW?=
 =?us-ascii?Q?K3eahWM2pnmOyWyyD0wQpbaxxoWSul25ZhqGWWrHSzvESFBBoYP6ruxVoU8h?=
 =?us-ascii?Q?or/k+U86hYyHtu5JReVdVZ8TWA5pvBrTVo03G6/86IFDP8v/KP4vMS7cL1bc?=
 =?us-ascii?Q?kf7LK0bqoQDIGbj61XQJB/sPefvmhPjPBRWFCGNQqoZtzxG7TW06hTWXFr2H?=
 =?us-ascii?Q?7QMjADpUKcKC4tcjIB9+iGhQxZWRhy0kWYowkr3UH9KEvcpKo7GzC2PmYZQ3?=
 =?us-ascii?Q?uXsbtzOBkEgRuO2xEau7J5pP84xpjN4HFM1rwdRrkVc+BH8eKlJlOaRFdjuI?=
 =?us-ascii?Q?PDdcN+tNAYN1Bo4rdoYv16ntEB2gMGWhxW3KfiXzcnW/n5LNbVjXyx6LWxKr?=
 =?us-ascii?Q?ysUEprK4hwy0BlHmnQcluTRu8jGqCoTfVxKbMBGn92BorNfnFrKQ//V8AkEg?=
 =?us-ascii?Q?FKeJj4PqOQzeB1LqdITnNtfRi2tTxQ/VtKOyNMp6Y14uMJohZ+ro9XoZfSRh?=
 =?us-ascii?Q?NoeZFPkytZbvrHyR8bLF06e92AKjYOi/y+n4KUCMZIfL7kSFs/30xp/ryavu?=
 =?us-ascii?Q?1st2PIvsQFRO5RvxZvH+6OQDDFuk+lPrKUa63etYFqOmNL8aAwYo6SLxGbVL?=
 =?us-ascii?Q?DSBlGhxpNgbJkWr/KsLMoGJCEWk4y3SPxFCPAoWkeaNDn+GbDAMS5trCfCM8?=
 =?us-ascii?Q?AAXdLM28z/sAOff0EMD6LbEF1PYX7FvXnHAPINB+K66YD34ZW/QKRlCNUPfm?=
 =?us-ascii?Q?tRT16bAj6rWmspptI+22vguQfpp8SwAh70PaIx865MvMMHi2ZUNsiChBqTDk?=
 =?us-ascii?Q?1A3BYC31svI3t8wfd5VjoKGDpjaDG7ZUf/QzuUZJQRQveX9OvA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lMt1lT2HMy2Ay/U13CJoT5QtG5cbqtn5s7+3lXzgFTR1s6gqef/dDDDaViMY?=
 =?us-ascii?Q?9Vj8Bem6yZZYeCsnyu0YWgpqOkP585mjTPEeY9siZBeaJUswLhMj8oPWJ6fq?=
 =?us-ascii?Q?tDd7abD3VxdDBbJGrZCWGS22R6fWJuL6433L73eiSMWSOLz+ngON+y7h7mG1?=
 =?us-ascii?Q?lQqKygogYr6uzFPgeNuh3sx6dNSt/7e1Prxl6KTEs1wbGjibrxwZDTppjJt7?=
 =?us-ascii?Q?tClpUQ0s/K8+htA0Gn6h5YCqp7oeiajxm/hkq5nyniGCd57Jl5qZB9KeqOgn?=
 =?us-ascii?Q?APbnJa00S0tivOYvWHiSXuGzurq7ixTtzFM9BaYjqSfr46rlrSWiSbmNeSMT?=
 =?us-ascii?Q?cbmw024zKw6OXO6CeQDfnCi2b9CmYKuu1jg1RT1YF+fMtwxWpbiwDjGkOJ8v?=
 =?us-ascii?Q?ZLFNlKAa/ztz8bXIxHokEoyLZB0hxvzvSZmbVT02GBlg6jL8ZVrxXN89leol?=
 =?us-ascii?Q?L0khz27D7uKKB1EV/9hZ/nkE9GI6CdwZSHt/Smi8oBkrwYG3zMqAwJNDRYHT?=
 =?us-ascii?Q?maB/3ZEK+LqnIRg9kUStK7KK7AE0vHS5rQBmDEc5FAofz4ZiKr/6SXsfHppd?=
 =?us-ascii?Q?P6+v4cMKQr3JLhSNlRFcrrPhXSf4ciinnV7juU5Jr0YkDJBTQ2ZATCKTqc1a?=
 =?us-ascii?Q?/fFErnI0HMZUKmxFYHOwrwTaNyKTGPNwYubzihpa3YlKx13wRjcL61xAjcPV?=
 =?us-ascii?Q?Gl0KefWwXtJ9smYFZf0b73coTPLtIuOG4egCCUKXlFoJ/IdWfvp0tJZNp5n7?=
 =?us-ascii?Q?rtNBI8Z6S+TltgncU7vzJtuylCqmvbzW45VUYuI4dj7jzOLpiVewlaJ6o7lP?=
 =?us-ascii?Q?qCW6AhDoQe0pzQjw48VhOqJdQe1Md983Y3BScaGrFiMbVG4soT4jZXTJu8wH?=
 =?us-ascii?Q?EnufkFJ++jG5CP8f8oj7fSpc+UVKsuUqykMoTzfEauIXr8Dgnee2JtSbDTGL?=
 =?us-ascii?Q?/ITAhH3uroCleuUrvvVhyl2GArLHcQ05d5H0Dso5Yh6Unfsg3BAtVY70NQKz?=
 =?us-ascii?Q?1FTy8unOYUUsutJ6dMAvyYPR4wqXdNhyy3f0ISBFkx/bLWG0FmrsWvC1s68i?=
 =?us-ascii?Q?bsdWYw4v8a3EHNKi1/wlkNEDHR4MR+eZT5fa/zfN8cHn+Kew6QCLRt1Z+ukK?=
 =?us-ascii?Q?pJLb//eJWZYvSq3u+9RbKb++lB4aLO6Cke92DPkNKeILZE0qrc9MPQWBDO3g?=
 =?us-ascii?Q?694By1iy4SR7xMdIOBAD+1v4XkWhri5uLKEvRl7AU/eZ17E3p+pMs8K7MHdF?=
 =?us-ascii?Q?JsYv9/0h+gEKt3eBrfMm9a8sIBfK8iLvMZo8A49JWXT732vSWY79Due7B9mR?=
 =?us-ascii?Q?4zoqeIlDcg50yBtofklbhF50SVIYA7jEQmT/obIZu4n6WtJpbFLsTtznYTlr?=
 =?us-ascii?Q?rUcRXsAflJUavzYfDdycaEar9ry6UOwovTsT1cPw5FSC0wiLHPm8Mk7kh1aR?=
 =?us-ascii?Q?zpVh+YT7prRKNrYBZthEF4d/FqCmudcPz6dXRFCFU51/fY9gKazSRKTbi0MJ?=
 =?us-ascii?Q?J5Y+6WFZzzE6Ggr196DHu/zR0fcQmFgnQR9P/pGm7Ca0BQhgiLuTVKWj59jS?=
 =?us-ascii?Q?H9eLICM5ABhtvuAqS5Ip5AfG9uyzo7oTAQN7rQzl?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4818a24-2f1f-4679-2dde-08dcc7fb57fe
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 07:22:31.1086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cJ+/QuVV3Tjxi8XL2s6UE+bAjFZ4HpR2hV0VkvVEizIQYOKuO5xBMdboKIc2Qb3A8huLSxeVVOMVwe1Oh8ZUNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5172

The devm_clk_get_enabled() helpers:
    - call devm_clk_get()
    - call clk_prepare_enable() and register what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids the calls to clk_disable_unprepare().

---
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


