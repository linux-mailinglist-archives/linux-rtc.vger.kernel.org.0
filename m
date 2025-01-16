Return-Path: <linux-rtc+bounces-2933-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4489EA13AAA
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Jan 2025 14:16:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41E8C3A3DA4
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Jan 2025 13:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7C95224894;
	Thu, 16 Jan 2025 13:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="c8qqpbDS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2059.outbound.protection.outlook.com [40.107.22.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AF02236FE;
	Thu, 16 Jan 2025 13:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737033376; cv=fail; b=M9ABdLWean7+de2v+erum0UUJH3k1V6FDEVKkehh4oiOdgr+X8L+c4E2wJaWBb1lElPXC6ek3wZr7mXeISJEE6gO21+0DhP4DcVWyQOlpWTDADT/Lnmcbcjr3EJKqPm2D2/tDL7Q0z7HdvRyLPmq3YoVb6KbtnlnTfKRjzNMbq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737033376; c=relaxed/simple;
	bh=Z9zQDJM0nEfUKd3yvi64EMIKyQG/YKeB1YmNeEacJEU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=unBQoaEAry2Ryi8pVWEScl89WAfdNz0RCy1CI/ISNBbvmH3ebnBLZrQn+I0Mvbi23Utv8/CgFW9KxrPzqa9fS6WMlKsuB+hppL8hUb159aMOQ/X2muxWscCiOOXBMP92pz5casH4fLIW9wsXnssZRU+vsu5ZPPilhFhMfXY+Bhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=c8qqpbDS; arc=fail smtp.client-ip=40.107.22.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fYbhrKk4cVQ5ZyrJn3RV9uA33NEsUWWTthv/ORJdjh92oHeKyXrUaZcvUoWbjybwpvU1JuglPUwO3Ap8yVCheQi6ouAE0sDH/UBCvYRcRUy9kN5kptBA/kme+gj2vdqyuhOdVLDbNghEWqLK8rBD8DKi6VzcqkfPY9lpFLoctMZ6P5Lld93HkU/2CE0PLZvsyCEyN619HdZ5VrqTIA1QapoalBlyALyc/Kf5O9A7FpX/C7YzXQB/mLV/ULcL1wqxfNZpCntXWxIZn6cHkL8pHFyr+Kbl50Gq7MzrqCRhJ/nXsgq9jtYNFu0tW9NXWTod7EemBYxtFy61AoBFcDZojQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVQxjlV/6W7OY6dmSiZJ/Z/ecctgCoYoTI6maSJDIms=;
 b=aagkzUUZnaRW2b8bOidgNrgLiAwSt11M/q9RFpjaZ02p8zxgV1x5f3hf/l3PPUud5qjtNEoLKyMpIwV14SiuKiRwy9diBnC3Y45oPQMFmSUpO37kACzkBR46Jvw9jxlf+78GuO7ZwX0PtYIfy+2h3eTEyLkK4wb5XE1xgFK7p6txkmEV64TYpbBCoWbtab6yMX1hr85UIm4I6o+wOLAqdXSjyAXWmliPA43fno6WjIeES4tJeHTGcuwd3LmayJmelJnkRNuqv5mC1W9mg0wikqhB37qzjW58tg2C34JGHKLBiuVRVwoBimlB+cjXYoe1otbzpwF1dY9Cxa543ISacQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVQxjlV/6W7OY6dmSiZJ/Z/ecctgCoYoTI6maSJDIms=;
 b=c8qqpbDSdqt8LoAdiXWHWML9fHG8sZM+Ydz3Ejt+4GCjhXSWYv8hZbgsdh5NrOWsa8yCmhACtJlC0oikIOvrwERQ9Ux0kizB9kv4fpcJkKPsktCsHUkIYYvCuJaO2dwVUGMd/dM+/VP01gHbdOsaGUXO9cif6i8q7x9/bRDt8FfyFkiPnRPlYvI97AdY7AvMLHCmnBkhdQw1Q0/zxmU/Qivz6I4hrgsbwUrOZUdyypzXibTjcBTfyL5Bdg6haVHBLly6sWK/HrWc3bzajdf0kdNk9I58tbX/tLvuCOJEsFtGCbbACtzRMaIyRYVXvNepL5qJS7AAne69iw8myC3Wxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by GVXPR03MB10213.eurprd03.prod.outlook.com (2603:10a6:150:14b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Thu, 16 Jan
 2025 13:16:10 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%5]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 13:16:10 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Manuel Traut <manuel.traut@mt.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/5] dt-bindings: rtc: add new type for epson,rx8901
Date: Thu, 16 Jan 2025 14:15:28 +0100
Message-Id: <20250116131532.471040-2-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250116131532.471040-1-markus.burri@mt.com>
References: <20250116131532.471040-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0117.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::14) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|GVXPR03MB10213:EE_
X-MS-Office365-Filtering-Correlation-Id: 8507199b-a60c-4856-3ba0-08dd362ff180
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sWDAO0jB4g902eQfnPTJ9YpX15Yk+lP1gFoW3X5O058qtzOG6F5C9+rmSdSj?=
 =?us-ascii?Q?i9hkMGkdicVMlP/PVuyz/nwy6FinjnT1hogNmEHD/FAQimO05hWTv0f/UQ1c?=
 =?us-ascii?Q?l8vzjLmJ7zeN6WwVxpuW6+a9KN68EP4VE3wspsjBrPXP3u5MeV3Mcw4nQ4Bv?=
 =?us-ascii?Q?bpHvhDYMkL6+tqMGX8mTxt8IbqBOy5pM+iJi3X+vAJvy6Tvrf77JB41gCdtk?=
 =?us-ascii?Q?zXinZn5A3ec1xKqLxViIi+kxafmDVpQRneTU4k11wKjiaInt5FMBGIKKhW4W?=
 =?us-ascii?Q?/OSqELo2IejpNMUNxEQIlm+q6GEITAD5mPhn8mgPB4APPvuFBi0Mrk3Hezyn?=
 =?us-ascii?Q?T5wrdM20q07b2nnnZ+Ccf/tk5w2LV82V+qeOGWIq1uHsOoK2kky53EBErfaV?=
 =?us-ascii?Q?2jCsIrFoca/GZVetu//e68jw3Y8pBZTknpRqbIbzFy3muLLDeLIu/7MqdJPS?=
 =?us-ascii?Q?EWjaE7aC63SCQRIZxHCcBIeTHytecSOcbqmXYLUnFUoqakPskGcudg08UP2x?=
 =?us-ascii?Q?BGOPZH8FUk10jgIDac4a0m7CrB9JXRPK/UGst3srnYcRX9RNFtPTGyytUWpg?=
 =?us-ascii?Q?LupDLr6BGx4NaDAOM4DVrGwD+bzS/RWUnpB++WvjIkwKHLvX6+M8f7hWyBTN?=
 =?us-ascii?Q?xvI7XmYVNt55XEwBflVZcm1C/1ZaJlN92uSOcG+OAMjkpsw6/jtYhp+Tih3m?=
 =?us-ascii?Q?PrDm5DWNBCM1xtELaSvV3jGAeSNPBWbJ6ABivXZrFniCOCqdCEzGzap1ZNrL?=
 =?us-ascii?Q?2MyonpLrH9T/xJclXet22HcOZlLISgw/2hCiBa7oULdzFC2suDVG1IxSs+Gx?=
 =?us-ascii?Q?qz6/NzmqRwxrSXNkx7tUtoA9GrNZI3pZbm67q+qup211wYjG9A1St4XY5aWO?=
 =?us-ascii?Q?iYmmhkk27fw6AdwFqPshBt43wtMkzO7SfThxvxaAwvlQeGafGBwF1Qce+8fc?=
 =?us-ascii?Q?ZdtycA606Q5O9nDfesW8UaPNCw7TSieUvoDg9QV5UNhFru1ZjYrIiMfO1SRM?=
 =?us-ascii?Q?qX1R3aPtIZJCzmfh+jdPyUTw+tLksnttgH0hIIqak3BYmjEk4voA9vqdG6+x?=
 =?us-ascii?Q?wr/iqMDgKq6J66LBczWda/8o3kBJIwzd0libt3CYukQJb74Prm1t5C22Q4iG?=
 =?us-ascii?Q?9bvlyCCe4XRNcvwWJVTnb6M1H/wse5xX1UujW1yPqxYnG1ZBSbHHGRYw1QVq?=
 =?us-ascii?Q?76/kWqprZtEz+KOs6iHVy8DNUGNQNhZKCI1ydRiC1x7g//5BZCuN7/DiYD+O?=
 =?us-ascii?Q?4TEay9GLMPDnxeCRh9jq4A6RyR+iM3LHAdhfypk4ma9LsoxBuC/WmSkYaFsb?=
 =?us-ascii?Q?aTYE/Y1rwEQMMbhE1OaC5uKwaFOHX1e+RsUiGP2ZGTbdGvAJvZYtXzMeORmc?=
 =?us-ascii?Q?lPFwG5WhMbBPhuH0cpEfzM5ehz4q2YtOBsQX/LFmUzGBo4nqwn2vi4lHmaGP?=
 =?us-ascii?Q?EZIBBO46CUKCMukWyORIfkdVeSrmIGcg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7DMKk0CKPiH3LfCbnYbqRziQX/V82QFO3aWoWlbFb3swPYWhgOz+fLGINQdz?=
 =?us-ascii?Q?jciWU1L0ESGawx4m1FzKbBvoiPTjKfunJEa0KP0pfN2bOUXvmORjTFRs2xJ+?=
 =?us-ascii?Q?GVenfkKvd85gmMMvGwivVlEGpi6wOHB9nL0cBR4gSggz2noz+caABmgOBoOc?=
 =?us-ascii?Q?6o5gnmVgXtv1XkjxHx9NncntC49v3b+Wc7Ekn7RxCpTKFnbMKnO5IPzLNGFK?=
 =?us-ascii?Q?uMH9+AHGCwC+QN+Tg+abn9ZVcoxueh8em66dJ5UwACBbEhhLAgSamx1c3oBl?=
 =?us-ascii?Q?zUw8e/kMndLSxOhrd4h0zpmGlMcYxrB6ogwoAmPK5lR0E0gHCcfLKh1SDDuh?=
 =?us-ascii?Q?S4E+w0mw7ghClbJpYIcmFFEaRuUhQtu3b5wB7s48szxtx1uQD6WAkztzZCeE?=
 =?us-ascii?Q?thv6Wu22tjbg9iU3wue/l2k3Uy0fPFG7wpnSprThyX+/9WuQgUNXA4/lnclA?=
 =?us-ascii?Q?xAbf73sSsuJjFw9WNhmHyG8Uu9ibpg28lXQO0ZCJ74cJ3UYArxbh//VENwzd?=
 =?us-ascii?Q?jXHEbmCbQyOyfhS/nusYfeyK7G+2lfuZyWTseX5M0BQrFPhwkUGS5tzVYC88?=
 =?us-ascii?Q?3vnd9o+ubjzoUFh/fpROyLs0JuNBWXxjIy7U1BK1zWQtLEUuRGQ85XA+V2+w?=
 =?us-ascii?Q?MzAu2TntIMz/yBa4Mhuv6bXpW5n2TGqxOys7FFylqgIJJNsheszYYonDpAoV?=
 =?us-ascii?Q?anLrCRkwrX/0Ou6NrEVzHLJb79scoB2v9xdx7VAbnZjMDWeZqhF2emIo8boS?=
 =?us-ascii?Q?5zu4qmwRvUo9MjONULoDtmesISrmY5dWOCJianXsXi/m0qBvomZqjCp0FV9F?=
 =?us-ascii?Q?glmr2uhlQudHgRNxihcWKDDzPLD3+LWjRUpMT4GkKzeZp7zOJUFD+AWIKJ7x?=
 =?us-ascii?Q?0zQSBCnQ/EUH9bVlDvPFOzLoUn4gBx23RUBlH7HLjwHUlZXq1wkaKIvpH6/t?=
 =?us-ascii?Q?6FfxqlDB76TtuaVHJeyFMBuEJK8j0d/kf+du9tQimcTOTe/9Aud2/XYPNY5F?=
 =?us-ascii?Q?e/HzYeJoHkOtAAjOJ/8UdZQJehMtUgHACj1gDShYQ+Mvk4fiBGwr8A1+bAG2?=
 =?us-ascii?Q?r47rfV0N0x0DD36yVxXK+r93RC49gqbJ4FJ12T+PQ3d7+CSINgzRTM1XXdrA?=
 =?us-ascii?Q?RxkWM/meReUmDhLCJxi5O694H8Fumr/h0d5ZR/d/n8IKSJzBHCXl7Nm21jvq?=
 =?us-ascii?Q?EvQRNQtcYmLaAfn+MHcIiVsa2jTNbJK66p2iFkMSnc+1aDR2EGl8gbOM8LBB?=
 =?us-ascii?Q?4wqUb2kK/48A+yR7tYUhRNI/SN9e7wnXZuoxGUCSzexsTitDclDqYboURy8A?=
 =?us-ascii?Q?RinED9da20UucVfxw7K83WTENKEE3JeQfMwtH6cxtZYL58A8a4NBpJLmJh8e?=
 =?us-ascii?Q?7R05gxYPjEhoiDqE2mCZ/F8LG3inKGD9XUHWl4DGcvETovM7kUSrcqe+y7Qi?=
 =?us-ascii?Q?gNG4kFmVtek1TtmNXz1f4MC9C3gljSWwr8SHywUHl730Pd1JWGXzM+3TecMc?=
 =?us-ascii?Q?zt8CLbHLXDZr5F9kiiNR39WDapkyniWimeXZMSPSv3YsdVz2o75455svDavz?=
 =?us-ascii?Q?hm1xXBX2hx+6N0p4dzcP+5+ybgKxUKSCr6kTa1ci?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8507199b-a60c-4856-3ba0-08dd362ff180
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 13:16:10.0688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ka6vN5zDskw+69oM6z7P2SX5uTl32b1FFx+5VkY+BoGP2StK5z9AKMyBdz4uD3E0K8KU6tb2dLleAKm+erx4lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10213

Document compatibles for:
 - RX8803: already used by the driver
 - RX8901: new device supporting also tamper detection and pinctrl

Signed-off-by: Markus Burri <markus.burri@mt.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/rtc/epson,rx8900.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml b/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
index b770149c5..03af81754 100644
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


