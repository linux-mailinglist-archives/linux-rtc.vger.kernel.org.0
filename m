Return-Path: <linux-rtc+bounces-4123-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25632ABEF18
	for <lists+linux-rtc@lfdr.de>; Wed, 21 May 2025 11:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A4323ACD06
	for <lists+linux-rtc@lfdr.de>; Wed, 21 May 2025 09:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B35238C3B;
	Wed, 21 May 2025 09:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="RSQN4GMB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2088.outbound.protection.outlook.com [40.107.20.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA6B1514E4;
	Wed, 21 May 2025 09:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818386; cv=fail; b=fExdchxD1gkivgsRGZ/1REuF16fm9C/5DShSUqweXC8JJAgcU94UXLHJ17izMnVczm78WV25AVG0JL/C/Id76LPvNPscoQOvwZO6HQIb4i3GOwD0kKKSXoXBpWhDzQ9k6KasIDSNmSNSV48xj9DZeQWK4B0nQ75iW1f/fRaWPp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818386; c=relaxed/simple;
	bh=JtwWCfsnLRCSle9IigsH1Mcm7KHQA6XlE2qlJZKCa28=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KaRljedgrUFAidyy3nfBf2ZWv0pxgJTST4xWPPiFY21p0RSNsNuPoRcLFRCn/1UvHcFqODPCJnNBDvDYyNO8qgs2zdwajw7GvnE3G0LNov3+eMOv48Y0PUt74dvLJzBYi9WqGOsva/8IsBgVuailrtMIRJcLlXmY11Fen6Wur2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=RSQN4GMB; arc=fail smtp.client-ip=40.107.20.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=spOFQ+5H+2pMPjBGHE2R7MeXmaDo8XUIbOb4YZ/ECg6rWBCFi9NwKCpIYqD+O+nB7IFPx9tH/iD2TZzqZXV2Bbcf1YagqwRdCjTWy7cV3dfQreuyhRAi4dDeQXv44XnasnN5k1I1jjEeJ7pag/U/9qspeSTexeC4WeTU8KK7cC8EpwYSp//7HhR2QmT/W+mLoNsAQg8LlHpw9gjYM4EvvWiO00wXjpyCkpKwa6R90/xIy+AZ7obCC367sKf/9+KchOD/vAhAIIqKFNv94Td6AtG/TRWyTAva22zAlUh6DLTeILyubyCzuoi9tDny3jSVDrZVu4X5x+bMxD+pMXWL4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+0A18aQs6LwmmFcOijBKrJZEbJh7/JXhgaoKMREink=;
 b=YzlDihFAhUU4XY2+HIyfJ2/w/4BMxqC6V9DpO96ocyFy9y35kEf8IoI7aSKraBHimgXjNoZiPmNAGCK1V/BVDRLkH6QxZ6E1ZfwXhG7r2bVsMf9Wrkgy9P6rpecBh5fYFDTl4ZTzLEK1Qfluyx2mMSWt9UOogH8nxKRocvwbyRXlVs/eE2ULWP27r/8anLblp9scfnEhUSBKPIb6xUq4Nis2LzA+zagALFSjKIQjsNJViukMkl//X/ID4r9Lre5mDYM6LtcadW+1Eex5log3zdg9bHCdZylm0yGVTkO2BbHFPvofMqxDXiEdu/g/G94dt+2WOX46RJA/5e2sphn1Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+0A18aQs6LwmmFcOijBKrJZEbJh7/JXhgaoKMREink=;
 b=RSQN4GMB4g3ettRgFVi4aTSdhUwWZMMhfgj6njJ6aJDojdDkOwHUBqgefCf8v4IyXPxngDA81iNguyXIu572dUO16t/ZxVqZUydtP8SwTYbwxX45jfeXYdw8FjopFfgYCvujqaBcZyt26tn9qNEcN8YtFvoMbO+edgevqP206dOFnwHr+4BgqDizv4skpizZshiOi0s3C0r6t+KGYuXpdUXRXdva1kdma7XMvNEPZnNuE3AgExXEjJj8O2tWjHPLbHKoyfixab7mDeMn2qKzDNhsp0oYXlqU5H+6gKA1KM0iZScQ/7JUW2OysRK220KEnbjujdSHw1nDszjUoAdszQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com (2603:10a6:6:36::19) by
 AS8PR03MB8088.eurprd03.prod.outlook.com (2603:10a6:20b:443::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.19; Wed, 21 May
 2025 09:06:21 +0000
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b]) by DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b%4]) with mapi id 15.20.8678.033; Wed, 21 May 2025
 09:06:21 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manuel Traut <manuel.traut@mt.com>,
	Marek Vasut <marex@denx.de>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Markus Burri <markus.burri@bbv.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/7] dt-bindings: rtc: add new type for epson,rx8901
Date: Wed, 21 May 2025 11:05:46 +0200
Message-Id: <20250521090552.3173-2-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250521090552.3173-1-markus.burri@mt.com>
References: <20250521090552.3173-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0173.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::8) To DB6PR03MB3062.eurprd03.prod.outlook.com
 (2603:10a6:6:36::19)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB6PR03MB3062:EE_|AS8PR03MB8088:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d5c0886-2c78-4b8e-bb5e-08dd9846c123
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SzM/22fPcN1zK6/46+0hpHOwq2c7e4PYW5GaRansaHWpCvHOFfc3Hapacs14?=
 =?us-ascii?Q?MEqhETJnq4CxUpvsX9hTNiDplKsQ9zhUUqX91kEk6W6qOvLbqBsrKLYxY2TD?=
 =?us-ascii?Q?s6kv+Nvx69Yu+JAndV2FNMKY5Lx935r+J5TFbXYx/f5hT8oSi25Cj2Vtwbmh?=
 =?us-ascii?Q?SZ6DvegG+DLq3tl0SxmDhshVgRCj9d+eJoI5IofwRxNzKY70sYU3niUVSZOl?=
 =?us-ascii?Q?wHG7KU0mhFfLnSB6sQkE6E9UupWojy6YQTCHDnqpA9BiBz/bxLd3fAnLh9KT?=
 =?us-ascii?Q?cl8XXazmxdc6DoT299rRdfiYimFFmw1UE0odOpokYd1tKUVsWUDQTTILwDay?=
 =?us-ascii?Q?mxSrvzva1NYQlUe3Xh/NcrUJ3f4phw6Ap99+DmmU3MDAXctW/RE7cIJzhTGR?=
 =?us-ascii?Q?1+ms+ebMchemqt/sR//eghJnzRs9+7f24wu/No+nkQj3Q4cJUtWzLwHzbOpb?=
 =?us-ascii?Q?ms2Q4ilhZCP3tXGhmmN2QhApljvN4vb9S2N7nzYzu6bbFporm6izrIj78z4g?=
 =?us-ascii?Q?MoSoLOGAPP2oPIpHmsQyti+t/OmRHeLjmh/kxsYtXCV3ixomRRXTo1uNwZOg?=
 =?us-ascii?Q?yv+8S+Ljtp6V8dum0++3PCYd/7Uy3z5CmGNkguyyq7DuN0rnTulXRjYUJRfc?=
 =?us-ascii?Q?dU66HHh2PH2wWE8casLRUZKUyxvKZeJUJQxDCnahnE++A1kPZodMujBLcPgl?=
 =?us-ascii?Q?OC9og60cmQCGIlv7oOGeOlOpjHJ+JEcj6hujS7XPht3xmPmqJ7ysab0aDh4w?=
 =?us-ascii?Q?De50HDYONtIcxH3kPLxIaBMvCOXWbfNlIFsHyctqc8Ba5ItOTjuaLTdjjBJQ?=
 =?us-ascii?Q?UamiHaQqmjL7g+RN/EqAqPT225G/BIfhZSqb4bDX2lCLOfTdmZPcXroDAs8j?=
 =?us-ascii?Q?zGmG9LbO0p5xn282nLuAjmpeGuOI0z5ymj6xT3FR3q3/OC21NgEawvjQ/cuT?=
 =?us-ascii?Q?imrMKzZdu1/VfO6fcXEKVQAw9hZivesvMKH/yAk1oHm1d0GZWZdKNDs//zBx?=
 =?us-ascii?Q?zaFNykQ0/IwQxrxfma3eUxME39ZAwtH0psw03hEvkTdY0MMfrDknzcdi7ll1?=
 =?us-ascii?Q?RXb/9GDApXTftMx8MjqiWKAKlX+HeOZW9zYorfe9n00VAa3yJEkj48o2G3NE?=
 =?us-ascii?Q?o/g/LG6hASoeJjS5bZaMJifjLuzMhVd+u6ryIh0NJ4iXNgp4XNUqjPX+AaUG?=
 =?us-ascii?Q?hROcqq2vNDqXR4V4aG4CODufBfNJT0yNMJkmMU8EJLJ1zzeQ7A5SGbArUHXY?=
 =?us-ascii?Q?yK/fj0fKCSbzMjV9Grk2AYDyUNbtOzKMuvjWUHDmCLIigd+4ZhiygtVjgHnd?=
 =?us-ascii?Q?9VRSIWRq/A+TigmiIrUVf2SxCf9ah9nuUkldU/ujueT9Ttk9CFUw8XajXTzT?=
 =?us-ascii?Q?9AHJb7VqW6F3S8/dAqDnwczsoYiXQ5OV6GN7T634bf88qBiFBsecdljKUn0L?=
 =?us-ascii?Q?iJgumMMF/G6PXklOTA5vpnCiD56jP8pBAhPjZz18Aq+2MwdOqUmLGA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3062.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ADc/rF6zUlLq6ZiiKk2j0cahC7Mjhun8D80oE41Q6zMAGbyS+5FGtM5IRmjG?=
 =?us-ascii?Q?NxInjjJgXZqsnVTF3xdLs7v7sCGix9Fk0a/XPXEri3mgGWn3WnEV5CiRk2lm?=
 =?us-ascii?Q?vMOsTYK9+lcVFB+qvLG7GqYt50a+PvbNkCMR3OpPlg9SMGOiBBbNU3daUo6e?=
 =?us-ascii?Q?4KQg4JgSe4QuqOiKMb23D6xX+hMdgJbSEarIDSVjO52xQ4bIPLe5qZCPDQh+?=
 =?us-ascii?Q?IsrrDQvXIgYcGj1ExgTR6c/3ex2wCRYxt5wbQZpS5VsjwYD880OBvot/ckVw?=
 =?us-ascii?Q?9Y5edU9RI7wsd2crydh/NSac3OBpe/+euhlhCwGUqUjmE2+JItA+/CLQEBmY?=
 =?us-ascii?Q?qKgtSM1opKnsfCaM5E30UD4rJJ1uzedCMKJ7n+M1MSaiD+ldCWtkTrJp5JCT?=
 =?us-ascii?Q?SUXcoEdBo1TJj7asS4kwPlaockucJsn8/zHhFzIpSgVbbg4tgvPYdt1voCG4?=
 =?us-ascii?Q?bvD217YiEzqVZmuR0/ZVAl75Xox5sXEet5HSwJKTjgGXI2D2taHy+LaJhD3Z?=
 =?us-ascii?Q?CPSALKqLhc6ARxmslA17GTC+GZZNnERtSe6PqkJUQKE2p8W2H00emDE8Pr1K?=
 =?us-ascii?Q?wPmLS07IPJ7x6yNqTAPFWqkgmq1h0C6tEsx09ynCOieCgYtM7Jv4ZcVJV/4E?=
 =?us-ascii?Q?UbvFydFwS+evJq9mZ0rZVJj//Xndkx+ik9NzoVZd3UOzyXBnUh2T4zVnNQGi?=
 =?us-ascii?Q?2Wzhqc/exVtPo1ZkuWg3JOuTjEc27uf5ZEW1PoDiGVngqAXjUZllXRQN0M4c?=
 =?us-ascii?Q?0Xw+eYYKcgJsm832AjIzkRoGLE+agJVbD325OBn6hoyN5MG0w+FWGDpeKMt9?=
 =?us-ascii?Q?DFcHFBlaltnhk95SWkZIDlJTOCmO2l1kasBFYWr9+5U12T/QvE/KbuCSXZkP?=
 =?us-ascii?Q?WBggvs1eSbUU5SDgQEzlDeFR1+QHldLNtFB27kix3md8sgKQSNmtW8OFFOqK?=
 =?us-ascii?Q?t0QcQQKc/CX2V4lukJfY8wr2keF90qYE3HVMLI0vtU7fv7CtFNQt2W+wjAn0?=
 =?us-ascii?Q?cBqHWLQIj3zwfJM02SQ/5we+vmvl387geI0V9r48Ko7SCMr8eldFognil3TY?=
 =?us-ascii?Q?asAAnKckSowq25HrmN2QSlRsyvOLgYW+WzhztXxk9IKguXjIwpjCh4GG6FR/?=
 =?us-ascii?Q?9uMOZK37cM3YuvuerLwG5PlEVElF7C00kX9vFzufEypIvYXlb6z0DU+lkbfo?=
 =?us-ascii?Q?QDEzd99kpfyULK+5NL81v4HVFUCHWTBGvCiA2bKbhZ/xiHBJ4Ah1SKxJOL9u?=
 =?us-ascii?Q?tp2Pvx9ThS9yRpkiQ+46fST0pYX4WNFGy9oD9gpEU2idOv4Uqex3JZmR64jS?=
 =?us-ascii?Q?pa6TCLopYIaLiTR+Xa7+eRwlpwCBUZiB6aosQb1nwmrhZZsIdmbICcJbAqPS?=
 =?us-ascii?Q?DXvqbyVDgOP+efq61YkcODIm48+SZuH8mjTsQFJcNc1HE0sdBrNwQyubEeun?=
 =?us-ascii?Q?2kNdNxwkEoQ9CgXwFT6llzJ4+JQn2GFx4vngU4qQQtWmK4NsTDyUGPyr5WO/?=
 =?us-ascii?Q?yOh2jMtJ+hTghf4QgjZlsy1RDyWHpF1L0eiZBubZCe/pUXORBqFm0oCcXKsd?=
 =?us-ascii?Q?TOFUGAyCg3FxQnW72XxXivKFQw+5V6Khx+lksgqU?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d5c0886-2c78-4b8e-bb5e-08dd9846c123
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3062.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 09:06:21.2997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ng+Bi48oZIF/BES7JIew+qlRnOQXd2ZHwaNz1HLohJ26zFBc+83h6vBruNcwPwkClVQ7Llkc+Rsg+ohB9MtZRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8088

Document compatibles for:
 - RX8803: already used by the driver
 - RX8901: new device supporting also tamper detection and pinctrl

Signed-off-by: Markus Burri <markus.burri@mt.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Manuel Traut <manuel.traut@mt.com>
---
 Documentation/devicetree/bindings/rtc/epson,rx8900.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml b/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
index b770149c5fd6..03af81754482 100644
--- a/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
+++ b/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
@@ -15,8 +15,10 @@ allOf:
 properties:
   compatible:
     enum:
+      - epson,rx8803
       - epson,rx8804
       - epson,rx8900
+      - epson,rx8901
       - microcrystal,rv8803
 
   reg:
-- 
2.39.5


