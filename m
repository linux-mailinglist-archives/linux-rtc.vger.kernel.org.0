Return-Path: <linux-rtc+bounces-2489-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFC19C38E6
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 08:11:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C407281678
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 07:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D600158208;
	Mon, 11 Nov 2024 07:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="i8Bapvn6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2041.outbound.protection.outlook.com [40.107.247.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EBB12CD96;
	Mon, 11 Nov 2024 07:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731309116; cv=fail; b=IrAvxdrCabrGI5WHwSdfbF+gzBFAx5RkQ/PViLOzBpFyNil1TpcKJarNAG73FOzFoX3HAuNNmvIsdO5IQEAWbt6hqMS89mJlqUFIZrx75un9S14J/Vd3i4TilvPXb8uaZ1ZO7We5v32BIiN1ezJcBi1RJqYAi+jM14awkbxdbAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731309116; c=relaxed/simple;
	bh=fgOI0cbNLurXX5sQZfc1Of6LW3D8nVwf2alsTqAOZPg=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ALYusrhBC8afzjFCQ0EavhovcuOwiA1/PEXfBCkJ2NBxy47pVosWTtVOrLFpLPhDKG2GerkDSch4QdMJ0d9SuCWf37ZXiK2ZVbbcTxz5Dum7iwiXZin7njul7ZqGbb0VLhwkaeG8JI9gNE51TkFlQPKmvsyGqaELWz2LOdk3gXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=i8Bapvn6; arc=fail smtp.client-ip=40.107.247.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K+htClZIFq2gQAOciGQXJ3QwkBpr4PG6u5lbLcARQwXa++NxK+P+X+3PMixlf3qSr8mqvKiO4CHeaFzMwK/r4EFbQF5ee3ypKJZWWkxwOqYmiu2q7w0U/I197iO8DvVM9m7fM+MADVnrQCdzFMRRfg3JJ5UcqAEUpXxrYyLuKBJRLgdTTlH0RN9fsVzStOPkRpDM/yxu2rKi9fq9Rii33KnQC2yiSuPxYbz45kTEPyxmT4sFspQOASeGOi76C23mdXgnSSxNZWGViM2QYgpNqZ9ST+F22yVHJ3krcIeW96pRnZXRCcyMBWdz7LJcMPhX5VzXpRehPk2QmFZ7RhSaXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BOnosDsXJgQQ0clzhsYdEZyi8bAAVz5gKtxnfn2Q+0=;
 b=DJloN3Egtx9T9gZa48s/B+UyXqIhw9Lhkvr3y6oh5pMoW/LntZp5iU+sCXY9Le+UDSh8ZR5F7z8YRDwBkkxOnPZhwKOFlFdry4qMLo06Q5VZLA77zhpxfsk+rC5N/1YNyQfm8VvWEXqYbNS2wjV69BNhfgHUSVAUrD9Cks3nnPcjKWfi/6yliOd7j8W+l31Gyng2iazaxU0sRNQOsLquj9XsFVDsUG+c3OhkiMEvZvSPmOKvfbO3maTzRXkglWYY6kkB9WCKyr2VQ7ietcezf5WLhpUxdcPfdnDAoXfAlF1C2ONcVidExXrJQFYV3wxm7iSL3pUC0XbY0Ual3M37dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BOnosDsXJgQQ0clzhsYdEZyi8bAAVz5gKtxnfn2Q+0=;
 b=i8Bapvn6DTcjc9hE/rGEEiImDg4PzeBoKtL1vjszBJXuzgu1w7zBZlCMINu5Xl/ZGvSIzgY7SMPR1yPFLilT6GZJTcAxL6mYALykQHu3oz0cWc+miSFEhlgW4DmtJl+ITMDp3NqZuvTWCDvj08G7cGE9X8gl1OETSkElEyQcBon2khJvqzuxffMACrArKYB96sWx6Qvb58LAH4NlnXoAr5AJA0+sUDVP3+4ujFwx4AjTvNtPsxLw6bT13gNE/b+VgVZmXE3Pa8TX+2KRsMFeTYvjk6Yk2UlT+FMAHltPmmnEfgAtrRZIXzYJkFjHQQ6JaI09d2e/VJLro1MzvwDUaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBBPR04MB8010.eurprd04.prod.outlook.com (2603:10a6:10:1f1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 07:11:50 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 07:11:50 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Peng Fan <peng.fan@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	linux-rtc@vger.kernel.org (open list:REAL TIME CLOCK (RTC) SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH V3] rtc: bbnsm: add remove hook
Date: Mon, 11 Nov 2024 15:11:30 +0800
Message-Id: <20241111071130.1099978-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0066.apcprd02.prod.outlook.com
 (2603:1096:4:54::30) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBBPR04MB8010:EE_
X-MS-Office365-Filtering-Correlation-Id: d435326e-7812-4c04-b002-08dd02201c85
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q7XrmJ7STnG0VCJBWD7Nak8oOfZpXQ3gaBRbwFSsSMKW2MJfstDDkRnRq0hu?=
 =?us-ascii?Q?VCsgFseAJH+/1ujjziu9GOXsXYxAU9Vy8aiymPEO4nQB76Tpa35b65jqhyxH?=
 =?us-ascii?Q?3ZNspjVRG/5r8npuc7BEY6OiHkf6x12IqxcZjetz6mq15tQ4MhkFEWbpdfpz?=
 =?us-ascii?Q?AbCsWKiPhwzd3lasbg1Nux9hrTgCKhNGvX4e2ByGjMOMx3LQ//93Qak/MYVo?=
 =?us-ascii?Q?+Lcewnr6e5WP1eQKPaqIZ/Q17j7ONyABfA/o22O8mM9Cb1taCQ1O9AC45kbS?=
 =?us-ascii?Q?YrIL9ME0Zx4L/aCHlb3B0qqKrZDSNTd74AUcxU6z6cy4WtNEOOuct65wEQmF?=
 =?us-ascii?Q?ZhbxiK8VK2m65F62SzNERnBhfNFaJ6ASGL+VYx4hGu353aweWl2yPxYVzQWE?=
 =?us-ascii?Q?xvSMKR/wcIMDmC/bPUb3vRDjEzf/Jr1nSMk9SgOnBUts+df3Kj12qXikLuCf?=
 =?us-ascii?Q?ZRMcDVWmB+JSUsTX2GoB/Xdjgm8wl07QdF2BprIqCQLBE/kbydVb5Vy+ttif?=
 =?us-ascii?Q?6+17iA1IVCHnaidrOWBBFa4xFSH3sH6I7ffHSynQZny1PnCm0CaB4wMAF9vY?=
 =?us-ascii?Q?75AMGf6XXruSV8vDHKvhNZ2w2VKj9Bx/f1WHGNYWJDUe/8rEGhNAmDsenQ2o?=
 =?us-ascii?Q?Zn5Cdm27Rk39b0Yxd0Qowt4KlfQArdLKpcPCnfc2vm2oqeD5OYQfHBIpynaH?=
 =?us-ascii?Q?d5O841HosEu8o7rO94KmYuzKJstI6IxpOQK7ataRmJYWVVjyqBaVdFaxaCpJ?=
 =?us-ascii?Q?HeGNOGu7loOBMV8lsSNH8ULrsOXyaR43b0iia4VTBpcey33qExE6KrxkjZao?=
 =?us-ascii?Q?Z0anPBq1yLokLaJAx/f9JI2DQddfFHak6M7Khrj0NRotHALc6OUOYtT2uo2y?=
 =?us-ascii?Q?gZK5SuN83X3aShDhDWy4s2vqHGqOD5wQrkECFwdaKwwiPgELx77frQOW20cn?=
 =?us-ascii?Q?khJSfL0v/twACqvSFuDU75Xh3xKXvXrvd6HXwccPgfoZE3FhGVyW2pzyvknK?=
 =?us-ascii?Q?1aLs/ifnv/waJeOmo4qBYgLOYZ3yK/XhzYJYvqgg/FcrOiXPKHUnMBCL1q7I?=
 =?us-ascii?Q?XFWzXEWejQKeFZJgyo1c1UEgUq6p45mqwTPWcrMeHCszyoAjWRbIObluxh26?=
 =?us-ascii?Q?4+LgqAm7eNVusqxNWcgEho86WYhHMJ3PaNOqr0wmrYnCjcOHH0JnRSaYhvDI?=
 =?us-ascii?Q?bsPgodKF2uPuwGPQPRmSbiF7Ro8PBUeESrzjg5z65JipIim5RrTkolDroo9E?=
 =?us-ascii?Q?YpvzG1WUbkFwTB3+ZOaoEbwmzZxetz5RK6wk45B9tlDYZFvML1R1AQKs9YGo?=
 =?us-ascii?Q?H8JkV+w/b4/3CH+V1Icn2NEgo31QqX7v3Js5NoVDYBPpYutHrmRPSZoPv2zg?=
 =?us-ascii?Q?Dm9EjWI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uxXYY/M4qbii09At2XhuuTc6WquxGpqJ9zss3m3uN9MffCDbTjwimb71x7pH?=
 =?us-ascii?Q?6oOwePqfKKdVMrECtCHnMs5T6PbWBjogC0deQXtmR9EerkcLUisxMl/u2U6D?=
 =?us-ascii?Q?hKJ0O9cy35CZG8wJ1hALhHtmT3ol5G+RYH72ApvjQN3JnJH81QhMmNs7GYnY?=
 =?us-ascii?Q?4sOjlHvNNWNAWLyCeJy0GEbf1tBix46Vm7OY13dqbznh3UDBb1N/sRbdXvaU?=
 =?us-ascii?Q?TRFXwfD24kuDhkCXHu5Z97vnY2vmhKhzK8H+GqEMHFwZaaa75cqmGeEErS1W?=
 =?us-ascii?Q?wI/zEjNBgF9NeTO0YaFA+0YvS1XOVko1o9FA5oEtrCA4J3YMRS03BgDeW8+p?=
 =?us-ascii?Q?hdroQFRwcYy5hrqzbF9L7BxcRvPAH1JXDC9GPJXXKDm3EWXPTJ3PmMVyZ0Y9?=
 =?us-ascii?Q?pgdfzgFBFcNMGJbhvvqQqOST9cj5c0314qcGdVLPW7WnE7aTInQYZmVbC5bX?=
 =?us-ascii?Q?zIUa7TBEVuoWjXFTr9d22AmjahRtzknm3mMPx1VoViAYs+2Hrf5nk4/lbqU6?=
 =?us-ascii?Q?CX2q4pQf1Ll9zN2VvI2kVu3Lv0EvMJSrG6gTqbZVqCBL+G8VaaJlnIl7bhGl?=
 =?us-ascii?Q?vtzj38oR1iswzoj558A2D06kvJM4XRnFdruHHEBbnOprW7BFHxpFFxFwQ8L+?=
 =?us-ascii?Q?UpH/oAtQ1SxdfVYeCMZZQkcmHQ3We2P6U2Gv2uQDKSV1Bi4KtW3BjQwv1s2o?=
 =?us-ascii?Q?5dRsjVEd/diXGiRpV5xLdCGjak7kNtGakjHEQtok3sydNK0SBLXwB5d76Oir?=
 =?us-ascii?Q?shSQTTIo2+4VwP/z6z7+mlNkdGzfhLEVs8z0jRmYsPvqHTECfpG2d+08u/wk?=
 =?us-ascii?Q?bmfREmp4wwb9YkBmR3PY2h4YA64RjoroqY4sShVlZuaqUPgcYcJ2OYC1ATbm?=
 =?us-ascii?Q?aCtiR9DeYh4s387bhimp5/oidVtdFbjhQoAjo+HNjBXfTIyArAnNEWRZCJb5?=
 =?us-ascii?Q?BGwH9AcxxNDGHq12dchkWXXnC0oYb9skjpCk3cKttJLxG0USM8dH9QzZa5FU?=
 =?us-ascii?Q?xp8orF7tVmIgZkbTHtAtGph1glhxI27I5c3XGUpxyrcdBA25jebr72d7JGJ4?=
 =?us-ascii?Q?BViKoDjZjF+xodJZvhUo6I7udM0JKochRjmsm0oQXsMP2KVa7ftC5z595c2f?=
 =?us-ascii?Q?bQvCiKYtaH+lkLcPuF4ZQUyExL8w9Fhh2hifgiRT2iCgyuSB6xjd189GzkdU?=
 =?us-ascii?Q?UvjZlJweYSEPqmTqmdXRI8BLBskkS9BSWPTBoTNGxP0ZP92xqkOyABRHsU0I?=
 =?us-ascii?Q?f7wpPhi/l2PLEIloUjPGfdOmP9BgbGlQuz4yfqgQ2P7byiBSqhtQV7xMxIy1?=
 =?us-ascii?Q?JbHEdYGc/4lGd3o8ioBT0Ms74Yxa7gUdKxghtvclh9H5/QGQ3m8hgLJCYSBQ?=
 =?us-ascii?Q?AgbHiFZ3SjtQT9/iu350eqK6C7NPe6Ml1IDhybJjkqfCrTjIr6ytgzt5/cm2?=
 =?us-ascii?Q?WlWTGPLztMAXM9R+P1wb6mkWR/KgO2CBUdDMVNIVie+blIOxdhwyHEcpQ2nO?=
 =?us-ascii?Q?IHo7kQDfsO5g6EZUpQwTeK7awKxNizP4kqZZeVtdL1vqBKijMBB34Ngx158U?=
 =?us-ascii?Q?itNeY8L9eph/mCLmpoCchCDDHOd5mwPe6OczMbtX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d435326e-7812-4c04-b002-08dd02201c85
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 07:11:50.0374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: piWRuBTWNLeVTQYgwGND6eQEc+T6tR9jgIROquiI3lNJwtryyWomno1pr46dKEXBvJPrBQJhKKT7luzIDf/h1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8010

From: Peng Fan <peng.fan@nxp.com>

Without remove hook to clear wake irq, there will be kernel dump when
doing module test.
"bbnsm_rtc 44440000.bbnsm:rtc: wake irq already initialized"

Add remove hook to clear wake irq and set wakeup to false.

Fixes: eb7b85853c38 ("rtc: bbnsm: Add the bbnsm rtc support")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V3:
 Drop ununeeded error message

V2:
  Per Christophe JAILLET
   Use remove, not remove_new
   Fix error handling in probe

 drivers/rtc/rtc-nxp-bbnsm.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-nxp-bbnsm.c b/drivers/rtc/rtc-nxp-bbnsm.c
index acbfbeb8b070..fa3b0328c7a2 100644
--- a/drivers/rtc/rtc-nxp-bbnsm.c
+++ b/drivers/rtc/rtc-nxp-bbnsm.c
@@ -197,13 +197,28 @@ static int bbnsm_rtc_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev, "failed to request irq %d: %d\n",
 			bbnsm->irq, ret);
-		return ret;
+		goto err;
 	}
 
 	bbnsm->rtc->ops = &bbnsm_rtc_ops;
 	bbnsm->rtc->range_max = U32_MAX;
 
-	return devm_rtc_register_device(bbnsm->rtc);
+	ret = devm_rtc_register_device(bbnsm->rtc);
+	if (ret)
+		goto err;
+
+	return 0;
+
+err:
+	dev_pm_clear_wake_irq(&pdev->dev);
+	device_init_wakeup(&pdev->dev, false);
+	return ret;
+}
+
+static void bbnsm_rtc_remove(struct platform_device *pdev)
+{
+	dev_pm_clear_wake_irq(&pdev->dev);
+	device_init_wakeup(&pdev->dev, false);
 }
 
 static const struct of_device_id bbnsm_dt_ids[] = {
@@ -218,6 +233,7 @@ static struct platform_driver bbnsm_rtc_driver = {
 		.of_match_table = bbnsm_dt_ids,
 	},
 	.probe = bbnsm_rtc_probe,
+	.remove = bbnsm_rtc_remove,
 };
 module_platform_driver(bbnsm_rtc_driver);
 
-- 
2.37.1


