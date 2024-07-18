Return-Path: <linux-rtc+bounces-1550-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC3C9348EA
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jul 2024 09:34:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F000F1C2183D
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jul 2024 07:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF15B7E576;
	Thu, 18 Jul 2024 07:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="I6IdZLw4"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012059.outbound.protection.outlook.com [52.101.66.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70137E0F4;
	Thu, 18 Jul 2024 07:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721288013; cv=fail; b=gQm4J9VX/kMjKgexPKGb086rve9Bk7WiTyW+LolcBtubBkCmixv7D7IB7rp8cPCRIRCTzYHlo2M9PIMzfhYabbf8twIWwQxR4Fc02TW1myviWufLNwXaf0Rq672+FHeUxNwo9vh+4JF6sVvs2ntED06gQTeHbIkUNeX+r5GHGto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721288013; c=relaxed/simple;
	bh=LQvxg4wjhO9FWV8ybDeg50raOjfc2rJ4N3Rx1dkcBxg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=S4CE85c88UQj+BlFOtLfmBfX/6YCe1dL52uhKZ2dwF/64UgRzmh2Xisa7FbEbQyy5NeYNTvL09YO8vgs7I0N7VX2IWoCr3xBKhdMVzDxPk7AnMs0Cb+eocdQzs6Gdu3pQQiVBP141QBjypET9wo9qkcW0o7abUuX3ULQqCGHNNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=I6IdZLw4; arc=fail smtp.client-ip=52.101.66.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X5J8r8810dbs/UjZIfd2jcKokTZpdLiZh5DzK4R4l0mkM+3ccG4lLIj5Kx2M52wlQX4+mYwEKU3eQMR7NoVaYC2lMNzowEdqHiwrcKDAJ7pcsbOAPlFkn4D1axdPCKhkwKHrcfJ0mqjXrLS16cxaKxXHclIN/7uyXV89H2mNwtLf+JMpyr/zVIzqKfJooqWZh334Op7ysL8iXzcO0Ux7tmB4zH61TN2D2uFLQPJ3un6dVx08kXOndgpaxSETf+V+ViN8qfaEgptXwa5Tyt0hQlkgId8oaaFXlNzWOleH26ZFXMwZE0tPT0K3J0AF9p2Fz0fjvP7nVsY1fZQcH4jh+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJ9BbhLwFgdLZiK9h91g5ImtM5fDYlp3ZRSCHB3HgOI=;
 b=wXWnNyENFwvOOk436wZLzLy9EPECI/uYXMmSwHoLlF1/E7jCPFM+AUJeQJQXvqdN0pTzosGe+Im6xIVdPyRNPt5rsWam/RiFqX2a6d0WKWVFmKLB7u4TwePwP5Cq5IqWn6ucaIEDtwwov7IaNulvL6ogFu+QTAy0fTqMB7ITkw/bMmZKsNd2ooRbgfr+YA1z46/WicvXOpEmmcNx/KHFbQ8pSS2Zbv5ucq4MRyjc732n5NTqtTkxNu8FVF2vQWqIWdm2uHEI1LrOXY7CsCxLR6wcZrn1hslCxquRGT+AXR1b4fjDOca0B3ONs9Waob8V1U4mzk4ZR3KKMsifQQUEpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJ9BbhLwFgdLZiK9h91g5ImtM5fDYlp3ZRSCHB3HgOI=;
 b=I6IdZLw4HfeAyq0MCGesm/JikgEWbPoB8fyjfH6bZ3giJFo2RjrsKhNDUR3MQAnPljZ+vPImGC0dvm5jCmxjN7tijcATVzCNMjk1nNZWXb2sSXmWNbWDwkGhVpPTe5pQGbIxVhAf/5/xIPS2UJIka7nrUFh6rpiu3B+98lVY0ME=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU4PR04MB10457.eurprd04.prod.outlook.com (2603:10a6:10:561::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 18 Jul
 2024 07:33:29 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7762.020; Thu, 18 Jul 2024
 07:33:29 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 18 Jul 2024 15:41:57 +0800
Subject: [PATCH v6 5/7] firmware: imx: add i.MX95 MISC driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240718-imx95-bbm-misc-v2-v6-5-18f008e16e9d@nxp.com>
References: <20240718-imx95-bbm-misc-v2-v6-0-18f008e16e9d@nxp.com>
In-Reply-To: <20240718-imx95-bbm-misc-v2-v6-0-18f008e16e9d@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Peng Fan <peng.fan@nxp.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-rtc@vger.kernel.org, linux-input@vger.kernel.org
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721288528; l=6495;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=D48dI8TueQeMQCWqqGsKwb9eBu8K4dfQ0em7IUIjo5A=;
 b=/iwcRLeSIHH5tHMuu6/haDyGHy7tIQzTKG2eT1qAh/kf+UM12oUeVhXa6+Bf6m4bdvOdwt33+
 uTiWe3lLGJ1Cqt5/x5XE9AFulKaxfxX6tok9bWQRe//xH2zCBLU0EgL
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU4PR04MB10457:EE_
X-MS-Office365-Filtering-Correlation-Id: b81347d1-6d88-4744-80a7-08dca6fbeb49
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZzJlQWhYS0ZLYzBvMTkvQlAyUFZEN3Frb3FVSStGZ1hTRUhzNFMvcW94eHkr?=
 =?utf-8?B?MCtPSEtZVnFKdG82ZjJCZlNWajRQckVPbXBzdlFnN3lMSndxSElqdVQ0WVox?=
 =?utf-8?B?NWxTZmppUWpsWFg0SHF6Z3E2Um4zMi91RDhBcWxDa3dLTVZRazZ1aTdlKzA1?=
 =?utf-8?B?VzM3Q2lGUkJndUlNRjlhZ3RhY1ZEUlo0RmpWYTF0cURMNWhOQzJFMjVpeUM0?=
 =?utf-8?B?RFQ2UHpjbGtYa2FoRDVHRlBEYlBiOTBMa2NWU0xuRmg0ZEIxUnJvTzVnbUZF?=
 =?utf-8?B?SkRFaUNlejZ4ckt6bHFEdkxxbFpQaWxQSytkS1BNK1ltWUM0elJEYVNzNmMr?=
 =?utf-8?B?MzJjcUlxNWtUODA5alFNaDZaay8vMzJpeW1nTlc3b0VMbHZOcVB2bkNJLzVT?=
 =?utf-8?B?aFEyYlNrakg1dUx5Qy9CWlpjcEFRZWdUQ3MxYWlLdmsyN2ROKzVicmQvS1RP?=
 =?utf-8?B?cXhMTWp1aXFjcXZpM0sxRnY3OW1NWDJ0WHdSclBzTkhwQUs5VFBQNy90WSt0?=
 =?utf-8?B?ZGd6d3c2V2VhVThqcllVbHdDZ2hoNEMwRnN1YmR6U0hpUk5XSFNFU0hUT3My?=
 =?utf-8?B?cDlvVm95NUxUeXJzbWhFNTFUQjNWQXJQb2dlQndReDc1dEFtS0NBSExIS1ZZ?=
 =?utf-8?B?Uys5VzU2S0F5UURudjg3RFVOQ1hnQVN1N2E3Z3FrVStoVDNrQmlsL3JHQ2Y0?=
 =?utf-8?B?TWt4endQQVJ2OU83SUhKL3UrQUs4N2wvSUpmSmpaVzdmVGVoc0lqcEtrWXYz?=
 =?utf-8?B?Q0kvUEUzcjA5dmxxNzJLL0lpZmtFb0ZOOXVUTWpFaWV6ZkwrWnZpZjdIWEdj?=
 =?utf-8?B?YUZneWRtNVVDVXRkaitpdk9hVDVBdG9NMnR0VVE4ZWUvbWRYK1ZtTmRjYy9i?=
 =?utf-8?B?dDROcXA5UzkwdUJKQ0R5akt1T3NnK1FLaUk2cGVYRmRweDdlVUkxZXBhWUxK?=
 =?utf-8?B?T1lSSGpGMWFnMTVCbFJLRm9pVVNNVGNmUEV3RGN2K001RDVvdDdRbEkyTVNT?=
 =?utf-8?B?RTg1RGZzVDR2VmVFODJJYldnVjE5bFZQM2RNOTg1UXlEd2NEclZ5WEFHUXQz?=
 =?utf-8?B?YXBML2JqNTFsUlhsUHVtOGhvb2htYUlTcWorU2EwanA0MnhLZ3BmanB4S1Fm?=
 =?utf-8?B?M0dsWHNPYmxhcU1JZDR0cDJGUkROdHdLNTFyUG1BUU56MVdmNThXRFZLc3R4?=
 =?utf-8?B?Q1IweXdkbWFsTm5ndTR5QjVYckR2eVUxaWNXWUNUUjl3WUpxdFVKZU82amgz?=
 =?utf-8?B?WmdNT3pTOWRwazhaRXBJSjJtU0NyOUlQY2xhTnJURTFpTnVHRUhER0ZndXBG?=
 =?utf-8?B?TGZJQjhUenZMdmJXdDlrSHFEcmExWnliNHNzcXIrYytWWDl4aW04MWhuQ2dn?=
 =?utf-8?B?TkpZZ0k3MWU4akYrdnM5YlBDWkJWdHpiVTEzdW51Q1c5ZWFCM0E4SURtWG5O?=
 =?utf-8?B?WVZRTGgzUkEyNkRpa2JUcTVOcTlMZjNGaTFwa3Z0eUxPU2s5Q3BZS05aYmZz?=
 =?utf-8?B?VlRaVjV6Y0dwZGRxYndlQmRXaklIL0gyRG1xR1VvMzdtMGlIRGJtSm1MSWNV?=
 =?utf-8?B?ZUdjQ0F1NVhoaytMbGV3cWZURktBY3lLbkUwV3FIRVdsUmkvY2J5QkdJT1pm?=
 =?utf-8?B?MTN3VkhkWUVRVldZNFo4cHNoN0NvcE9vK0k3OHQ3ZkJlSmQzdnpTQXIzVFVv?=
 =?utf-8?B?OHJqR0djRDQrbEZubU9EelEyaTNDaVpQYUNyOWZ2Tkx1S1Z3RDQ0enA5Nmky?=
 =?utf-8?B?NGVodzljc2ZyYVZOYXp1aUdiVE1qTENHTkpoRXFMN1lqcHd0NTBZcU85MzUz?=
 =?utf-8?B?dDVXUGZxSWptUUd1QXdUUXVEckVlR3IySnc2UGI4bXhJc29lWHBkdXVXeml1?=
 =?utf-8?B?a1hrRkwxOGt4RFBzZDVaRk0zZk56aWVzOWUvckx0NWtmTm5lSjNUMW1Cdndu?=
 =?utf-8?Q?RJBRAt10IcI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1lqdVVUY201NDYzSkhwOENTR1N1aGw2a3hNVm5PZU05Ukg0enNXREJhQ1I4?=
 =?utf-8?B?eEFZWHJqWXRSOTF4SVhraFNNSlAzSTZxQlI4VUVpSkNCRnN5Zkwram4zcFdX?=
 =?utf-8?B?bXFLQVBvWUIveDNacWtwUTE1RzJOOXlNZFJFQVdBR01zQ1ZWVGZmakdYS08y?=
 =?utf-8?B?U3NEenlXR05NRFVHMzliSnV2aVV6NHRIbzVuUkFIWldyb2JMaXBCczJ6RVRk?=
 =?utf-8?B?TDVRQm5CU2dNMW1JNEJVNWREbnBWdXY0V0M1WjU5NjloSlZUMzMwOTB2c241?=
 =?utf-8?B?T3dBVksyQ0RLWjlqVVRuSk54OTFNMWFpZ2hZZzVUZjlmMWIyTEovSll0S2dE?=
 =?utf-8?B?WjdsZjRaQnJ1aEFKVmNyVlVNajQ4ZDFYcHpWbTNQa1hxbTJNUlNSUWlDakFn?=
 =?utf-8?B?S1BNeWR2ZisvK1NsY09wWDBYMWtFRStVWitGenNzQlZudzh6MlAzdDFjRWpz?=
 =?utf-8?B?U0FGTEtEcGM1Qy9rTkZvdVhPVWxlaTQvVjNFR1UrTnFnVXNtV29JaHJJc0lw?=
 =?utf-8?B?Q3ByQkF4c0JkcWNLQXozelY3MUxYRmtuOGViRGc2NHVxbFJwV3p5RmJnWkx3?=
 =?utf-8?B?YWFPcEh4Uko5MGF2TXlpNDRkbE1iNm1kM1QwNnFtcFN6VTNUSzMzQnBhV3RN?=
 =?utf-8?B?YWQ1T2UwdllnalFRVjd5ODNrUjZ5RDNIOWlhK1hRYnVBbGJ0Q3VJTzN4b08r?=
 =?utf-8?B?TVh3dmlLT0VFb0RaOHluSjhtZloxMWVFMFduRFhSd2k2djAxbHkxbmV3bm9o?=
 =?utf-8?B?bHZSWjk2SmxnYVB5RnQvRmx3VHdQRGgyWU4wQy9OZ3FBQ0pRQ1RrdUlyOWpG?=
 =?utf-8?B?Zk9DZVZtUVVnanNBeHl5L1h6Z0tXRkhjOFZTdldDQU8valpVcUJEMEtnc3pS?=
 =?utf-8?B?Q3VXNDBieElPUDdtbi9DRHlMbEs4NWJnRkN6WkFPTCtvcEowcU8vdHpDckdw?=
 =?utf-8?B?QTI3bVgyV3ZRWEUvaXRTdWZMT1k4bm5Bcm1rQlF1cWRkUlpvRk5EWS9WOUlT?=
 =?utf-8?B?OUFRSWFENGx5VldTMG9tUzhIVmRaOUtPOEp3Ukl4RnlMR2k4TDFYUW1nZGRK?=
 =?utf-8?B?VmJJc0RSREhKOXM4cWpkV2FaQy9sYXVJakMzczVleWdkOFhWNWhOeVVvUHVw?=
 =?utf-8?B?U3paUVk0eW1iNDVOWHdlajJiNFhVUWYxRWE2MDZCVHlMS0NwbG9tSms3Nm5W?=
 =?utf-8?B?VmZ3ZE9DQVhvdmd5NnlVd2t4K3o0dDAzL3VVWFNDOVduaUN6Y1REKy9EK3Np?=
 =?utf-8?B?cFo5bklrWGZrV1JKaHIyaTNkK3czcjZmN2NKQ25qYnNCV1ZmaWExMWlUSHlF?=
 =?utf-8?B?dXpheDdrak9HelZHazhhUHkwZmJKbkZ5bHR3M0cyRnl2T1dVaEcxdlZyaFpO?=
 =?utf-8?B?V3dEZk9xeHdhL2NFS2liOXZHRmNGa3oxNXNkY2lFcUk5RnRiRThGZVIxVllP?=
 =?utf-8?B?Y3lxc2EvU3VEdTB5cDJFd0V2VWNEUzl3bGdrNjRjUXk2bzQ0dzJ4UlBqU0dX?=
 =?utf-8?B?RVhOdlR4OEpsR1lybm5ZNDFNNWZVQ0VxMFBDV2NpZzNEUURYUkVHRzR1RFNq?=
 =?utf-8?B?SXgxeWlBWnJ6Vm9HdmQ1UXFETXFsN2tkRnI4eUd5N0ZhVmVERHZRU2FVbjJp?=
 =?utf-8?B?STlGa2w3WXNLMS84dDBiam11OVFHS29BMDlOdHBHOVN5SnNRaXFRNHNUSndV?=
 =?utf-8?B?cmp5d3o5VmJlUE5Pc2g1eXlTLzZPNkZDem5iS3NWMHRQZmlRU0xVa0lzZlFi?=
 =?utf-8?B?OGdpNXBkdWhEYjNmNTVUeUVzYk1nWEpYVzFnUHdPZTNVUnJJV1RvalRhYVl6?=
 =?utf-8?B?K0VWbWxhck93MFpBSFYvb2xDVE4vcjZVdm1wUTFOQ284dnJhQzhCdGtNMk9p?=
 =?utf-8?B?QXlJZjVtc0dxYnNJZFF0cG03Y0w2ZkZqUGZsMXF1cEk0OTFFangxV2FYZWlD?=
 =?utf-8?B?djdtLzhjbmVUVEdXd1hyZTVObWtBYm1UY2JDejlqZktxcTZEQmxwMUpiMy9D?=
 =?utf-8?B?V1dtTGZzanB5TzgzeGJxQzRJalVXeDR2WC9iWXRxalJBaUZ1MGZOaXZLMDhK?=
 =?utf-8?B?WnlGMUNhdHVqZUxDME9IMkRlbWNBeEpDVlc5L0ZETXFESmpUSkZlaTh4WEFL?=
 =?utf-8?Q?lJjILWrBHqUqss9eqFmvbW5kA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b81347d1-6d88-4744-80a7-08dca6fbeb49
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 07:33:29.5608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lqq5mxqtIOnzWje5AUl7JOytIJ40mg4vDvIs/Ck3We9a+G5DAqTYw/pdAWWjBaTqYUMCIxfF988XK0a5PeBz8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10457

From: Peng Fan <peng.fan@nxp.com>

The i.MX95 System manager exports SCMI MISC protocol for linux to do
various settings, such as set board gpio expander as wakeup source.

The driver is to add the support.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/imx/Kconfig    |  11 ++++
 drivers/firmware/imx/Makefile   |   1 +
 drivers/firmware/imx/sm-misc.c  | 119 ++++++++++++++++++++++++++++++++++++++++
 include/linux/firmware/imx/sm.h |  33 +++++++++++
 4 files changed, 164 insertions(+)

diff --git a/drivers/firmware/imx/Kconfig b/drivers/firmware/imx/Kconfig
index 183613f82a11..477d3f32d99a 100644
--- a/drivers/firmware/imx/Kconfig
+++ b/drivers/firmware/imx/Kconfig
@@ -22,3 +22,14 @@ config IMX_SCU
 
 	  This driver manages the IPC interface between host CPU and the
 	  SCU firmware running on M4.
+
+config IMX_SCMI_MISC_DRV
+	tristate "IMX SCMI MISC Protocol driver"
+	depends on IMX_SCMI_MISC_EXT || COMPILE_TEST
+	default y if ARCH_MXC
+	help
+	  The System Controller Management Interface firmware (SCMI FW) is
+	  a low-level system function which runs on a dedicated Cortex-M
+	  core that could provide misc functions such as board control.
+
+	  This driver can also be built as a module.
diff --git a/drivers/firmware/imx/Makefile b/drivers/firmware/imx/Makefile
index 8f9f04a513a8..8d046c341be8 100644
--- a/drivers/firmware/imx/Makefile
+++ b/drivers/firmware/imx/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_IMX_DSP)		+= imx-dsp.o
 obj-$(CONFIG_IMX_SCU)		+= imx-scu.o misc.o imx-scu-irq.o rm.o imx-scu-soc.o
+obj-${CONFIG_IMX_SCMI_MISC_DRV}	+= sm-misc.o
diff --git a/drivers/firmware/imx/sm-misc.c b/drivers/firmware/imx/sm-misc.c
new file mode 100644
index 000000000000..fc3ee12c2be8
--- /dev/null
+++ b/drivers/firmware/imx/sm-misc.c
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/firmware/imx/sm.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/scmi_protocol.h>
+#include <linux/scmi_imx_protocol.h>
+
+static const struct scmi_imx_misc_proto_ops *imx_misc_ctrl_ops;
+static struct scmi_protocol_handle *ph;
+struct notifier_block scmi_imx_misc_ctrl_nb;
+
+int scmi_imx_misc_ctrl_set(u32 id, u32 val)
+{
+	if (!ph)
+		return -EPROBE_DEFER;
+
+	return imx_misc_ctrl_ops->misc_ctrl_set(ph, id, 1, &val);
+};
+EXPORT_SYMBOL(scmi_imx_misc_ctrl_set);
+
+int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val)
+{
+	if (!ph)
+		return -EPROBE_DEFER;
+
+	return imx_misc_ctrl_ops->misc_ctrl_get(ph, id, num, val);
+}
+EXPORT_SYMBOL(scmi_imx_misc_ctrl_get);
+
+static int scmi_imx_misc_ctrl_notifier(struct notifier_block *nb,
+				       unsigned long event, void *data)
+{
+	/*
+	 * notifier_chain_register requires a valid notifier_block and
+	 * valid notifier_call. SCMI_EVENT_IMX_MISC_CONTROL is needed
+	 * to let SCMI firmware enable control events, but the hook here
+	 * is just a dummy function to avoid kernel panic as of now.
+	 */
+	return 0;
+}
+
+static int scmi_imx_misc_ctrl_probe(struct scmi_device *sdev)
+{
+	const struct scmi_handle *handle = sdev->handle;
+	struct device_node *np = sdev->dev.of_node;
+	u32 src_id, flags;
+	int ret, i, num;
+
+	if (!handle)
+		return -ENODEV;
+
+	if (imx_misc_ctrl_ops) {
+		dev_err(&sdev->dev, "misc ctrl already initialized\n");
+		return -EEXIST;
+	}
+
+	imx_misc_ctrl_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_IMX_MISC, &ph);
+	if (IS_ERR(imx_misc_ctrl_ops))
+		return PTR_ERR(imx_misc_ctrl_ops);
+
+	num = of_property_count_u32_elems(np, "nxp,ctrl-ids");
+	if (num % 2) {
+		dev_err(&sdev->dev, "Invalid wakeup-sources\n");
+		return -EINVAL;
+	}
+
+	scmi_imx_misc_ctrl_nb.notifier_call = &scmi_imx_misc_ctrl_notifier;
+	for (i = 0; i < num; i += 2) {
+		ret = of_property_read_u32_index(np, "nxp,ctrl-ids", i, &src_id);
+		if (ret) {
+			dev_err(&sdev->dev, "Failed to read ctrl-id: %i\n", i);
+			continue;
+		}
+
+		ret = of_property_read_u32_index(np, "nxp,ctrl-ids", i + 1, &flags);
+		if (ret) {
+			dev_err(&sdev->dev, "Failed to read ctrl-id value: %d\n", i + 1);
+			continue;
+		}
+
+		ret = handle->notify_ops->devm_event_notifier_register(sdev, SCMI_PROTOCOL_IMX_MISC,
+								       SCMI_EVENT_IMX_MISC_CONTROL,
+								       &src_id,
+								       &scmi_imx_misc_ctrl_nb);
+		if (ret) {
+			dev_err(&sdev->dev, "Failed to register scmi misc event: %d\n", src_id);
+		} else {
+			ret = imx_misc_ctrl_ops->misc_ctrl_req_notify(ph, src_id,
+								      SCMI_EVENT_IMX_MISC_CONTROL,
+								      flags);
+			if (ret)
+				dev_err(&sdev->dev, "Failed to req notify: %d\n", src_id);
+		}
+	}
+
+	return 0;
+}
+
+static const struct scmi_device_id scmi_id_table[] = {
+	{ SCMI_PROTOCOL_IMX_MISC, "imx-misc-ctrl" },
+	{ },
+};
+MODULE_DEVICE_TABLE(scmi, scmi_id_table);
+
+static struct scmi_driver scmi_imx_misc_ctrl_driver = {
+	.name = "scmi-imx-misc-ctrl",
+	.probe = scmi_imx_misc_ctrl_probe,
+	.id_table = scmi_id_table,
+};
+module_scmi_driver(scmi_imx_misc_ctrl_driver);
+
+MODULE_AUTHOR("Peng Fan <peng.fan@nxp.com>");
+MODULE_DESCRIPTION("IMX SM MISC driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/firmware/imx/sm.h b/include/linux/firmware/imx/sm.h
new file mode 100644
index 000000000000..daad4bdf7d1c
--- /dev/null
+++ b/include/linux/firmware/imx/sm.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2024 NXP
+ */
+
+#ifndef _SCMI_IMX_H
+#define _SCMI_IMX_H
+
+#include <linux/bitfield.h>
+#include <linux/types.h>
+
+#define SCMI_IMX_CTRL_PDM_CLK_SEL	0	/* AON PDM clock sel */
+#define SCMI_IMX_CTRL_MQS1_SETTINGS	1	/* AON MQS settings */
+#define SCMI_IMX_CTRL_SAI1_MCLK		2	/* AON SAI1 MCLK */
+#define SCMI_IMX_CTRL_SAI3_MCLK		3	/* WAKE SAI3 MCLK */
+#define SCMI_IMX_CTRL_SAI4_MCLK		4	/* WAKE SAI4 MCLK */
+#define SCMI_IMX_CTRL_SAI5_MCLK		5	/* WAKE SAI5 MCLK */
+
+#if IS_ENABLED(CONFIG_IMX_SCMI_MISC_EXT)
+int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val);
+int scmi_imx_misc_ctrl_set(u32 id, u32 val);
+#else
+static inline int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int scmi_imx_misc_ctrl_set(u32 id, u32 val);
+{
+	return -EOPNOTSUPP;
+}
+#endif
+#endif

-- 
2.37.1


