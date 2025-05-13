Return-Path: <linux-rtc+bounces-4095-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F892AB59AD
	for <lists+linux-rtc@lfdr.de>; Tue, 13 May 2025 18:21:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD0684A47B0
	for <lists+linux-rtc@lfdr.de>; Tue, 13 May 2025 16:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC152BFC62;
	Tue, 13 May 2025 16:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="vpvGYokQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2043.outbound.protection.outlook.com [40.107.21.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DAE2BF3E5;
	Tue, 13 May 2025 16:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747153233; cv=fail; b=je00hr9BoLeB4/CCWZoCD8QUWEo+gp0S+wdyiSK9dywFIpQEKkKtd1M8kszw5kjKrrCHwv21TrTEtZdHlELqn7anvs/QJGgf7TEzy6KGhXRCcYIQnbs86DbiuGEOUtDQHIXvDoCzScZ8bj3kmCwrpfj8sES5HKTU94d01vv/SIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747153233; c=relaxed/simple;
	bh=tkTekrrVcC+3JMyJPy9oa1gIjWulsKuVoezLxp038ag=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P4qcMgJt3TdeTrVEWj18uxf2/RuM5rShkdgBKcGi3hxYx1l/0JvvQXjNFTjuhJUtIYQBLKcQLmMifZSduyHeXsaR/TKpSkBoLQEWGJ6mHdy8kbIg0BS5o1YjqYlUsYFMFcUigpbsAcoqZeXgtvsKt/NUdu6bqncj22UHwD+tnqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=vpvGYokQ; arc=fail smtp.client-ip=40.107.21.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QNEMH2F8dRujHCED9FBDXpKvPedYM5FZ3Xp8H71SkjpOrikWSXA/udbOsYKjHa8Sr8M5H08xBgA+qf7BVwTT7mXtKl/73EP3MIKkpr/eQ+nMJSCUQ5Lhx/1JstsYmoBpEeoXdu3tNE106TShqKdpT1KkYwEthZHTbP3D8rZNx5mI1t81zSHsAEj3c7a7eBuVkFaGnEcKE8K8kR3vbQD94vJcfCfrK1IKej1lbKAL9V5PVFyjd3VO1FR92UobO2URfyDOzDAKdaWzsdhgtgtGfNFaOPYMQM7g+STHBamSTkK/ZdTm8eCFjyNI0d/Rfy9YCAvAIgBpmBTo7izbrBW3yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2bMXwhyxCIPcYFXGaUnMloh8CzPoCMaEheDxe0yX4bI=;
 b=qG1LsxSt6zV5Rq+s6gT0fGDGugsXgnOKviliPAMyV7yLq3LXvqMrmRpy5mUi5BqNMY+h3aXVfvJx5WP003VUVC7v95TAkrPW/RhgEnhADoeN6ZeR9WeayLxvGaWgmFkKC/pSY83mm2QegVUUZBgsBbyKWk65tXMNaF+X4Jxha1niPb8wtsF2uTIGtuUJZcNwtyWZ7EO+1lZrmSl9/MbfBDXEZ0rXiAqyOIGcKIJgKviwChN8dk3z7MEU8/YegBaT4Rat6/tM6lUO9AcOUhJidM+mXUhkVLZA1sqr145NAGb4XSENvaae9iwcyOLdLNWryv5dsuQ3oka00gvPza0O7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2bMXwhyxCIPcYFXGaUnMloh8CzPoCMaEheDxe0yX4bI=;
 b=vpvGYokQ6XuRygNo2c+/MljPDW32etgPNcM0uaZxBOKzHcCuH6fMUewSGDk98GX856L6y5xoLujKImfksB7Mm8U5s/5cr3fsDsbNvpsanx+Lym6Pjwl/IOSXlqym7KY6ofPwZWS1E8cZRjnKRhN+efNE+wO5G+s7WfpVUefbqvya220nFZmjBbpjSA6TM/JegL6o3/Wj/qCgAOTR6RVf6fhwkcWzze4rBOAX9heoTTSZ949Mbp40aDPTuEUZ7vv/Lb6GvGa+tSRSymCA12nBvEkr6Cs/j3/qAnxtCBSvr8WCDqQVZ8KFzFSOKzjtF/8Ouj6cjlXeD4ObHJQZ5zgwiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com (2603:10a6:6:36::19) by
 AM9PR03MB6724.eurprd03.prod.outlook.com (2603:10a6:20b:280::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 16:20:27 +0000
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b]) by DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b%4]) with mapi id 15.20.8678.033; Tue, 13 May 2025
 16:20:27 +0000
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
	Markus Burri <markus.burri@bbv.ch>
Subject: [PATCH v3 6/7] dt-bindings: rtc-rv8803: add tamper detection property node
Date: Tue, 13 May 2025 18:19:21 +0200
Message-Id: <20250513161922.4064-7-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250513161922.4064-1-markus.burri@mt.com>
References: <20250513161922.4064-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0154.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::9) To DB6PR03MB3062.eurprd03.prod.outlook.com
 (2603:10a6:6:36::19)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB6PR03MB3062:EE_|AM9PR03MB6724:EE_
X-MS-Office365-Filtering-Correlation-Id: 83784d45-96ba-4ba7-e1e9-08dd923a12b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m1JHhqeA0z8puv9Aa03ycSW9h8ecTJggSx4O1j+KVHrVOfUHttlAm9cvHeoQ?=
 =?us-ascii?Q?n/CLrFfWj2kT73dF0Iz0v0LGOK09YTz5EWkF/vhhhiOeDpYEDf58HcJ6qnQ1?=
 =?us-ascii?Q?bJN36Gca48ksFQomqBKfivcRciqpK7oO3jwCRrzvQ3JRvSQBBEDcgwmOLTSZ?=
 =?us-ascii?Q?KiRjd59bgz7dXQhaDbzaKUOAiKqUjaOkk21hpIVsxpPbjShT8BLe2FFDI0nv?=
 =?us-ascii?Q?qRuAji5LoyAE7dsAFWWgYPJOex8mT176jFH4nC89W+upwscDjNoMx4jE6izU?=
 =?us-ascii?Q?lmHlJ8IPNizropMV+lRJdzllmqls9irWrO4LE/iloci/iYh7ohtbHrGIhsHw?=
 =?us-ascii?Q?HKXHcJssOgY7jv8qaKDOH/KqOJm9WmCWv+M36PzbIqssbgMZd53wmG3fHQk/?=
 =?us-ascii?Q?b/30nzEeuotIVF2VF8fYsjspWBeyynpI5QgU/FRObzFZibuqE9h50uUwUq63?=
 =?us-ascii?Q?DLgOBGKIhhxIlrj9ezBxGSVjIoakaY4zetVSWLgyVtNLTUA5hvxxaAmVVqpN?=
 =?us-ascii?Q?NKxxKacczJoJTeb+JCZSeOaa0ntKMHZoe4a9pcWzJ5kRQXKPLvkGQNlAl6fE?=
 =?us-ascii?Q?ddiXWjN8e8mCz/HVbiPpNymLEifAnu9VKYrEqEmplvJd5Lcwf+wfi4syBd7F?=
 =?us-ascii?Q?Xe3pQQzoX2uIJfp4xCU/IRReZYsbYmJVezbU1TuxuSz61HErh36JqMzWn8ia?=
 =?us-ascii?Q?538nLkdOoqlxrTsEhuSALUXrTgs7UaOApa5/USwqbco2srjVngjWog7gZgdI?=
 =?us-ascii?Q?CjpZaNJeoUJSLiYNMTqVexUCBD9Wavz1pqvqhH5nu61ELdb1OhU7qTvEWgK5?=
 =?us-ascii?Q?bbk9ACua0sdOmK60FJU7g1+BTmKkw9VeQbrJ4gnq7y5Qi1z8Conx7ulMDd5R?=
 =?us-ascii?Q?ZSrF4yeH6mzVGZsGgo2+BlwafICAx11JfHU1B4GPT7S9ZXtDmLTqa6p3oGit?=
 =?us-ascii?Q?oOeZXo/MkLiW0M7xL9f/koC5FFXXT35TbCpxc7sUR1bpXfyVBv6XlDcDowBC?=
 =?us-ascii?Q?mTIu4NxlZxqyHjmg+kflHbkmJklW2vM0CZtsDNuHq4g9m4a6MDH7Bvv+MuAK?=
 =?us-ascii?Q?1O0/I7yM73xJ0tTnZf3p+7sauVc5xpAh9IBZWaaI5rMVq6YdQtF8C0g62UaR?=
 =?us-ascii?Q?Omt7S87c5k745TfrRB8SlCo+7uLfEbXkkeulF2uC9ibBz2a8LIRTvnPpqFtH?=
 =?us-ascii?Q?qTt/O7bnPY6mg0FS1tzDD1QaEogAEzQhKm845GQXzwOT9HDCpBI0fjLDc7G+?=
 =?us-ascii?Q?crxk2jQ7g7953GeAG910ayoXmPQl1sMxss3gSkOMJlUQB78Vl5/SjwIgEaog?=
 =?us-ascii?Q?IMSCGTY4/MCsr5DQ3RNiuvpGoh2nFmupighajKrX6AN2cZTk4vyE6h+qcUrw?=
 =?us-ascii?Q?NT0Ny9xNncKexlgFs9uEY0Ssuhx2JOewrRibkBDuBZHPYfrxrp5w3JMfieo+?=
 =?us-ascii?Q?QwS/spXDtRrnZaT1in2dN7CR13MNV1B/xTCS4PKvr0GDDKZYS/zAJw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3062.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vlSsiAV3Jv7EutaLRqqN1VsXEcO3Vxlf98ixE8yozmTosIUGCwtPRASpa8SR?=
 =?us-ascii?Q?YmnItZCgm+IHhFFTNIi5arA982zmhkQa4tm3DE6uV/esd7EuccXNd8Yp21aS?=
 =?us-ascii?Q?mRO4koRqMh9SVl29+9f0wc3ftH6WmqGXlOACSXbqSg97IbfAUH/0+TdvHS8K?=
 =?us-ascii?Q?TGUZUYks5QvZ+2wDME1fKcsnZnl/Q4xPVaWa1XHC3jBsumq8r/9mLVQdRYdS?=
 =?us-ascii?Q?uf/psXdld5GPLsS6B6PliJb+CGFJhK43LgdSE5DGiAeqYqiat4+xwoGkNR2X?=
 =?us-ascii?Q?LC4IQYiXbg79Z6lzjxxvVdWT0P016SU+3/dB8YwC07soFNdDH08HXXxQVzOu?=
 =?us-ascii?Q?HgiBS1OiZm2x91stnFlZV3zdSSz5dO6Csphs5FqS64rsceBgO7X9E25AFcYv?=
 =?us-ascii?Q?mBHJU616ymR9XmeAMO6npbFxadcWfjBZqw37BwSjo7L7aMZnHtzxLuTYDxP4?=
 =?us-ascii?Q?fZ6XL3gkSDN7ecr2fj9P8dO40VYiixtAp3LX1gQgBNEBwud/CIj5P0vQncwQ?=
 =?us-ascii?Q?uzIEfHQ1TQqybrLNtGQTcprLdWrTedlMsNBKi+bpmm2krwQofklyFBrMGpvF?=
 =?us-ascii?Q?ORefsWCokq+B3sQ+ihhhwJfw/CE4FVa/4AsMUxKbV1zC+MrFPLlYqZPD5F2R?=
 =?us-ascii?Q?Q771W84zaCCG2ql/R0GL/aHiCAWWk794uLbrC92lkAPSkS1oUdpFjvzuw1KL?=
 =?us-ascii?Q?WjBBmPc5Xj3+ABjqmGbsixfCzuQ0XkZ9x5Ie0lPLhZmc9WhZ13NiALucters?=
 =?us-ascii?Q?jxvt/D66SGuGZW0irEj03L15V5IDRfxNWG3rECHcoa5ybvvb1FfiIV4NBtiA?=
 =?us-ascii?Q?vysOkxWtPig6F6vMPwTrZ+HzdrBZTzKcEVw8+FpFzRm+BzIHR3kvo7wtqqi2?=
 =?us-ascii?Q?hNvImPE3Qt8vDqmNLxqnnD0Pc/O5bwFgyuXF839CvqhhmiQx+pfQCero5Ih3?=
 =?us-ascii?Q?Ik3OYcbea8dxfQojpbPkDiJhOhQhQBIG7COfX6eJM2a0XL6Ws3hOwAfWAWKh?=
 =?us-ascii?Q?3JKn4oEsmkASWNb9Zf0Rnyp1RSqnXQ9eqevH8SaRmscVLACYDtj9plj/8tKN?=
 =?us-ascii?Q?0rde5baPRKemHZzXcboyo2Zo4ydshqewdcY/XieJ6qhsCXVZ4LywawLXimo3?=
 =?us-ascii?Q?rrHMVtw6Y1SoJvBe7BoZA914NimWRpWN1HbiIN8hFAfULhrFGrm+VykThYzc?=
 =?us-ascii?Q?/zUJsLuF80AUU4h0ZPhvv96K7P/ipZDTmHTo684d84B49UrqqpCYnWF6FEwR?=
 =?us-ascii?Q?BlrXAAn7qFSjLK9R9p4jOgySDvnzzIJ8W9klxdktVYbsER5d/e3UvqlU71Lm?=
 =?us-ascii?Q?i0HoFSMXLAVE6TC/Y2uxLqJK2vq90gdQ1p34Dy2ctpiroC76/GRW170bE5SU?=
 =?us-ascii?Q?OCmEodXwiwLmB3+6zGQplrOnO4NdjeRauRoW97VrZNSmvN3GLv15lGWYILPO?=
 =?us-ascii?Q?PcTCI+s2qINxg/wxlw511lg4SEs35FU5UGCmzoI4tDrqcjfCBVqpVZyfGlvS?=
 =?us-ascii?Q?ztSTJn4cQfcD2l+bgAqDKpw0ovYyIoy3udZuPkOchwun3qvoo2UZGvG/Yg8d?=
 =?us-ascii?Q?x4y6Cncfhi/q5MSOspj+PGGoIY9qh/LSncx9MS7F?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83784d45-96ba-4ba7-e1e9-08dd923a12b7
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3062.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 16:20:27.7563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Y0BhInhY8eXSB1jwKI4fjqH/6jp4//27AkISYw1ksZ9AGAft3Tz1AoGCtJvouhpG5tM9mbA4Flxlydn5AIing==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6724

Document tamper detection property for epson,rx8901 rtc chip.

Signed-off-by: Markus Burri <markus.burri@mt.com>
---
 .../devicetree/bindings/rtc/epson,rx8900.yaml | 40 +++++++++++++++++--
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml b/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
index 03af81754482..c2e542c9bdc6 100644
--- a/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
+++ b/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
@@ -9,9 +9,6 @@ title: EPSON RX8900 / Microcrystal RV8803 Real-Time Clock
 maintainers:
   - Marek Vasut <marex@denx.de>
 
-allOf:
-  - $ref: rtc.yaml#
-
 properties:
   compatible:
     enum:
@@ -33,6 +30,43 @@ properties:
 
   wakeup-source: true
 
+  tamper:
+    description: Subnode for tamper configuration. This
+      subnode is only available for epson,rx8901.
+    type: object
+    additionalProperties: false
+    properties:
+      buffer-mode:
+        description: Set the buffer mode to inhibit (0) or overwrite (1).
+        minimum: 0
+        maximum: 1
+    patternProperties:
+      "^evin-[0-3]$":
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 3
+        maxItems: 3
+        description: |
+          Event input pin configuration.
+          The configuration is an array of tree values and contains
+          "pull-resistore", "trigger" and "filter".
+          For a detaild description, see epson-rx8901 datasheet.
+
+allOf:
+  - $ref: rtc.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - epson,rx8901
+    then:
+      properties:
+        tamper: true
+    else:
+      # property is not allowed:
+      properties:
+        tamper: false
+
 required:
   - compatible
   - reg
-- 
2.39.5


