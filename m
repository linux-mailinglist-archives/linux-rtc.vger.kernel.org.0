Return-Path: <linux-rtc+bounces-1551-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 188CF9348F3
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jul 2024 09:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3818283BA9
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jul 2024 07:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381E58120D;
	Thu, 18 Jul 2024 07:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="P4SUAsDn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011062.outbound.protection.outlook.com [52.101.65.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A8480638;
	Thu, 18 Jul 2024 07:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721288020; cv=fail; b=MmTLSHrIN8sTJxH570BgVi2g0+fC9MQAKrK6Z0cdBtJe3L/tkUiILrHN5a3/wjQgK/8tbvyUcBZcQFexcnKvA6sHNxm+JbufpgiHY03cSpiUZNArYoKbXLTOrqvw1KfymNfnEUfR+O9FOhRG4NK2Kz638J6uCBa3KRrYejLsP+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721288020; c=relaxed/simple;
	bh=lB0din7YUuASkUYMScY/zMN+DX9irTFze5qsm4nmRik=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=QIWN5ZsQ6fM/BjSHhjxQq0BU0t16qY6pW/AoNgUL8OI4WkTlpjW+ZmZWZUbeLE48Br/r+9Am+xrvMeWB3ppwWnhEeOSlHC+aX07ORW+9i4mqvsK7v7WRZmnDzlcvhcT78QSbpDwv+XbL8oFR/Wvs4jF5C8SoSKwqQo4m9n4QZaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=P4SUAsDn; arc=fail smtp.client-ip=52.101.65.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ev0FjIhoobc34/HglEqRtqErXYfc6PWqS6yKbs8mI3IcKuGrfOWfpmtfmfq0MAmfqvja95NDecnnogVIIPNaUolExownZ0WYfsyjBYmvxEGjzS05dV3lQTm96wmiu0r9jMwFhkAtDfv8oodk2nL/R5V+ygjzFSlUT6xuoNOANah3ARQ4OFOvAYYsT91nWtIMVYCPuqyQf4oQ0Bs14YjrBbSQvNq/onKpvrPpISb177XWqqk23/NQi1CPPQgSN31ED+LJzoN2EUw3M6dVBJ3mQQ/zAGB7oSWWjuI4zkgQ6MkfDlBTXPdrEQHtd3ihhxPWt1WpjpbMMR8Q/jgs8QGaig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2y1quUvokU0Up4oQp8r3/9zDfWHRyol2aqI1a4ysBr4=;
 b=RIyzEJsFepTE9C44vFUwaMgi8bwrxksCvYsy4FMCgH0PmzSSxr1v2rN0lEPv3f14H0zNaYOsJqUCJ/TJLg2GdTOPhBPMwzBfzxnNjrxeNDGD4OvqGSk7CSAIsl5GNYqipDRocYc9qBRq0zSkET6OJ9RbejPU6nFJtGJkPaoLLp4qLVnULKfYKxwDMDt/9FDcNUgJ/vSWTvqSzUqF0h+7PHHcOCwZtPgo5Zr0JsBvkaoJEiUKIOsv0DdH9Zm3txexL5FMAVcp/IFlL2DvYDTAqkd0uDAvwYlfWXg9zlJiFW/eXuAZh4i7rcqj92vUCAmSQoUpBIaeLbi9eZ6UBfihoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2y1quUvokU0Up4oQp8r3/9zDfWHRyol2aqI1a4ysBr4=;
 b=P4SUAsDnjgox1+Hghb8BkHqO85PiHEm8gtbAoSvMAZU8VzXmGhZIDutEv+jIOMwqL3RkvVJrHIEGvzB/Q2fApJrsPs4Ybgse6TpT5qC9zcQTLYE7cTKhCVsoCr3JjaFwiHUC8CbVA9v2bHK2/6XvO2O3jyUpa/2xOPzTLbycECM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU4PR04MB10457.eurprd04.prod.outlook.com (2603:10a6:10:561::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 18 Jul
 2024 07:33:35 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7762.020; Thu, 18 Jul 2024
 07:33:34 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 18 Jul 2024 15:41:58 +0800
Subject: [PATCH v6 6/7] rtc: support i.MX95 BBM RTC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240718-imx95-bbm-misc-v2-v6-6-18f008e16e9d@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721288528; l=6360;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Oy5Gyoso0Y/G/kwZwRlXVgA45ZaX4xes2SzW2BSybKo=;
 b=UooGqUwQLeY4oe45kIQCm7dZbgJOYK8IfktPuFuUCX4/fVei42lH1hL/3EhMfMtvSbbhLchNK
 MVqqgU+QZVyAstleaZVKdySeDh+NFDrwbIFAmbCup6kIxHucKN8o2uB
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
X-MS-Office365-Filtering-Correlation-Id: 475db741-ad46-48b5-cfe4-08dca6fbee7f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWtkWVlEWEFJTzFodEVmTU5teUIvYjUveERqV2RWQytYQ3RJcWxDUHViSjht?=
 =?utf-8?B?alJxRU1xSmpERGhTbnhBd2RlalNkR3Y3VVM4dWxpSE9xSWpNb1lSUmhUNURj?=
 =?utf-8?B?L3Fqc29MUjhBSytlNEVjQnlhVTcvamZvKy9uNEUvR1dUeUtTbFlBZU9QSzZU?=
 =?utf-8?B?d1lXSlBtU1duTkt6QnJoQlU4NmkrQlJUeU8rbnlLMjFoS0JwVkZrbC9zY0Nv?=
 =?utf-8?B?L3doTHFET1N5bTJDMUhuWmN6cFJYQ1JIRDc5WE5WUTJOalMvbVhRemdsd3RB?=
 =?utf-8?B?eUNOYmt3dkw5eWNKMFJVZDc5cnd0cFlYVFVVQTZtUEszSk9lMWxTeVduN0R5?=
 =?utf-8?B?aHhPMDBwdmVwTmI5dU00K3VtSklCMFpYNGgwTGRydXFtZ0RsbkpWSGM2aXIz?=
 =?utf-8?B?UXppS1h4Mk0xcDlEL1Y5TzNEaENpcjZ2TzF5ZzlZdktTOVN6bklmOENGMk56?=
 =?utf-8?B?d0djNW5LK2hpeHlGbzdvc2h1eWwyZnF5czlYNVpUN21WNUR4QUxtenJjY2F6?=
 =?utf-8?B?Zm9qNkdpWkRXWWpUN21lYk5SZUpqTjN6eW1QeVBmaVc3MUttMWVuUmtoQU51?=
 =?utf-8?B?R09GcitoQTVUQmtJbW94RVJta01XLzdqSVpLZGg2b2RZT1liWityTCtOZjNz?=
 =?utf-8?B?azUycTU2eCt5OG1BTDVEQUY0UVNtUjlIbGFSNE9sVFI5NEg1VkQvYUhaSG5N?=
 =?utf-8?B?a0NVTUV4NmxPZVIzczZhbWlUWVkwQlBSa1BQSGltRWZmRHh4Q2loVzdKVjlT?=
 =?utf-8?B?alNFS2dYa3J6ZzlmOGo3ZFJyOElWSjhTTnBmUHdTOUsvWG1mRks2SGlYcHQ3?=
 =?utf-8?B?RkFYYlF1RWRMeVVrcUVwSHRsY0svaFJBUTI4eHVLNU5nS2RBME1aWUhwcUxX?=
 =?utf-8?B?azVDcWtxWklnd0RxNEdnT1dNYU5MYmU3UG4yM0hoRFRHZ1ExY01rZXRYR3pt?=
 =?utf-8?B?NyswazhxZkgwTDVYbTJTRXNhREMxN2thYTFnQUpPaFYzcEFpUk5LNURNcVhD?=
 =?utf-8?B?b1dYditPb2x3bWUvVlB3VkdpNkFRQnhvbWZZaVU1TlVMQ3Z4M0p0WmtxZzc3?=
 =?utf-8?B?ZXIzVjBqS3hCWnI0akRTVWFSbDlwbFdRcnpGbUZ4emkyeXpNMFQ2RWxyK25q?=
 =?utf-8?B?S0lhaWN5VHpMcmVtb2tEQ1dnOEMzamZ2SkV2MFNMSG8zaVdYeVVSWHpFc0h2?=
 =?utf-8?B?ZVpJVkNlM3pwUEZINjROeTZjTG9adW9tdEZWSklOT3lCNFJadW41MzVVSWdG?=
 =?utf-8?B?SzNPTnRjRDBRZ2VyZlFXMm0vQWZ5dVQzWlpjNUlvcE9SNFRyaERFS3ZyemQx?=
 =?utf-8?B?dEFMR1JEbEoxZTViSGpUVXEweUY2TGpFZnBWUW5xZC9XaHNpK0E3VjdQNDE5?=
 =?utf-8?B?OVFDdEVYSStLU05JZDhablFGMnN4YWJyWFkvNEZtZU1EYmxrYk44NHNGaG5N?=
 =?utf-8?B?Z0Y5QUVTRHZYVDBwRHA3MWhzampQUlZybFJCWU1LNzJ2WEVTbjUzZzRSZkhn?=
 =?utf-8?B?OGJuNVJuc1J1VnN1cmZqZFVkSTY4NVFpRWpDMlBKeWxqenZhTlFsU2k3eWVF?=
 =?utf-8?B?VzdVZ1hUa3BzMm1BWjBCSGRtV2pHblYzZm1RQ2FTOFpUTHVScFAxZzRJM1Zm?=
 =?utf-8?B?Z20wdTlMcmJndzF5aVMvZTNWMEpQdXBFQ09sNmR4T2sxVXZRdDRMK0tqYkVI?=
 =?utf-8?B?ZkYrMlV3T21nQzhYTXA1YllXdyt3WllXcFRwYnczUnJ3RDhwc0V5aTV5NzNk?=
 =?utf-8?B?cXBpQkF5ZGJhdFd3YlE2M0dobHA5THdhcFoxcmZHZ25JYmhKQWRadWJJa2xl?=
 =?utf-8?B?cTVkMU9ONG94MHB2b2xKZ1NUS05IeUp4cDNHcjFHT2tJbi81em9TWEFlb2hW?=
 =?utf-8?B?MlFaTlFaWko0ZmJ0ZXFSLzVZRjN2NDh5VXBBWGZNZUM2azlBOFN5MXVRZVRu?=
 =?utf-8?Q?m7cr9Cy5JpM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUM4dk9pcFBwV29XMTliWk9ZOGhheEtlU0g1cFFwM1BjY0t0cHRVOHNlUlh6?=
 =?utf-8?B?M3huYjUxdmlTdHdHTWhIbXBDZHpLNDgvcFVDSkI1dHpiWkx0Q1hleEtxYzQ2?=
 =?utf-8?B?SmtRT0dYazhtUEFxYTd3TmVaRlM4OFdlSmF1YlNJT1R5VEdZWEtSZnJHVzhD?=
 =?utf-8?B?WjdWaVlsZHlMb0txT24rNk1DQmJRTk8yeFpIdS9kdGVuQS9SeFV6VDMzbjl5?=
 =?utf-8?B?Zm43ZURxamNybUpjUm9FT0RRL3VzYTYxOFFGYi9TS240dTA2ZDdnWW83RWU3?=
 =?utf-8?B?UmV0NEsxb3NUbjdxVzJFRGZybGdPajJ2R2ZmTG5zMG8yb3lMcm5Qa3l2WjEr?=
 =?utf-8?B?NldDbE9lNXdGWEpKNGtybnd5ZWIrQ2xJRjRGcFhvMEpwMDFzNXc1eFEwbElV?=
 =?utf-8?B?MDVsaGVHRjFBeVIycklONmdTT0lNbjZ5TjRDWERJeFdHUlZRdE9ZTTQvam1Z?=
 =?utf-8?B?QUt2Q04yN1lKbXNRb21JQW9YMGRMbUs0aG5VdWY3MWFZanh2NWhDeW5NaEZD?=
 =?utf-8?B?ZkdkVzh3dDZ4UmVZdVN4dmVuY0JnYW9sSXliSnZDeFJMS0FTMkdrYTkzazJ3?=
 =?utf-8?B?dFRSd1JrWkVPMENZQm9TRVQxNytmL2xSZjdnUjdPbDlLOVVJTDJpOUZod0Nh?=
 =?utf-8?B?UkVjTXM0c0Vqb1JuZDNNeXMvRFlUTHFKZkZxajhkOWhjeUh2VEZaSG80cllG?=
 =?utf-8?B?NmtPQ3NaMjkrVHFBeXNCRnhleHRDUEFNaDRJaDd3UTdVRG0yUEp6b0hncTF6?=
 =?utf-8?B?QmR6aG94OFlaT2tIZ2RGaE5tWXFiVDlzbTBDcXd0YlNnVlRuek04MEJUQjRz?=
 =?utf-8?B?UFBPM2sxa1cvS1Fnei9aL096QkorUWU4R09aMExmMWxwanVYQWYzU21UbFc2?=
 =?utf-8?B?a3NSTGZscVR2Wlc1UkpvRHFsRWpsR0ZEdThaQXhjY1RPc3k0MHlFdWNUMnFG?=
 =?utf-8?B?SXJNKzVkZVBHVFVSdGRCUXJyTTNKNitGeFZMamhCeUJqVEprSkFnb0tja3FZ?=
 =?utf-8?B?eXlESE1pcmJTVGZ1bzlqcjRNMTNBTEIvQkltTE54QitHMzN0QVY2UUUwVGsz?=
 =?utf-8?B?U1dkQVRUNmgzN1BMN3pBMXlZbXRMZHZqaGJlTWY4WjNweVVOa2RHVHhlMzFj?=
 =?utf-8?B?RUJna1hTb1JRSEE1MnBFVDBCakhEaHBpQTFuUHFkWFJJRlZWa0QzNHZwamlN?=
 =?utf-8?B?ZmdoTERPeXhiTUhST1FKSDBFdG05SGlEZFZ5cU1JOXZZUFlpaHFnb2JpQ3N5?=
 =?utf-8?B?TUowWUowdzRSSjJUdjBnQk9XaUVmUjloeXM0cVhWMSsvODJWK0IyYXVpbDV5?=
 =?utf-8?B?OFh1MFNaQkk2Tlk3OVhDM0JMZUducDIrcGF1S1VhcmNaV09JYlpMdWh2dHlF?=
 =?utf-8?B?VWFpdW44TVgvdUtRcW5wVlF5NjllY3JhVkFsS09zbm1WRWxoMzkwSm0wbWVZ?=
 =?utf-8?B?VmxqcUFsb3F3L201NmVQTm1XUGNPVnhiWCtnQ0tlaUVWalRYTkxaVnU1dGxt?=
 =?utf-8?B?TEdHTDJSZ3J0VmkwZVA5TWtxRHc0Wmt5bkhoL1ZTc0pwNXBId0hXVEZXS1Y4?=
 =?utf-8?B?d0lieU1NdTRrcVJsMmR2M1ZUU0NoWTl0bHdsZm51blRoTVJsR0VTbGw0Sk5O?=
 =?utf-8?B?eWhLajFRYm45MFYzdFpGcnBIMXlhaWZtNTNhcXhJWm04MFJsa0NLT0Z5Vmcr?=
 =?utf-8?B?TXJXVkFaN3kxbzR0RnNTVG03RjZvNmloUlhHWmhuanNHVlcwRklCN3pvWDhn?=
 =?utf-8?B?dFRyUVFQU01tY0dTK2FpckRWRjdaa3grTGN0U1pNWk9ML21BU0l6RzVNMnJ6?=
 =?utf-8?B?bDdSWGRndnA0Wm8ybFpoQmdqMk1vTmpRaVNaZGxuODE1VE9hZ2Z4eGpXVHBm?=
 =?utf-8?B?RmRNUXdTNG5WaThRSFVqZU5SOVdaelliV1lvMlR5L2l6YmpMUUJEQ1VtVTdC?=
 =?utf-8?B?a2xCTFI5dGU3dUZKTlFnaWZRQUI1NytvUzI2eXFFUFN1eHhDT3VjclluSFZn?=
 =?utf-8?B?bFR2YVNNQXNGSDdZa3J6L3MrOG1NRVF6M3hVckowSWZZS2drcEFwZUpkcTJM?=
 =?utf-8?B?YTB5MWN1M2tiRW1lTHc4ZWJINXBlRXhBNkNnZ2VYUlBzV1luTWpJRnhkWkZi?=
 =?utf-8?Q?QYgmbNnqtO3X/qHH3irupXJsG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 475db741-ad46-48b5-cfe4-08dca6fbee7f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 07:33:34.9005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hE2p74/rIiNvChS+MEZpKWFcyASgI9ELRR4Tdyy/wTHKuTFj5JegEtUyOogAguJXatPKVhxFXLumo/poaea96g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10457

From: Peng Fan <peng.fan@nxp.com>

The BBM module provides RTC feature. To i.MX95, this module is managed by
System Manager and exported System Control Management Interface(SCMI).
Linux could use i.MX SCMI BBM Extension protocol to use RTC feature.

This driver is to use SCMI interface to get/set RTC.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/rtc/Kconfig          |   8 +++
 drivers/rtc/Makefile         |   1 +
 drivers/rtc/rtc-imx-sm-bbm.c | 162 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 171 insertions(+)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 2a95b05982ad..8122bfeba8c0 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1827,6 +1827,14 @@ config RTC_DRV_BBNSM
 	   This driver can also be built as a module, if so, the module
 	   will be called "rtc-bbnsm".
 
+config RTC_DRV_IMX_BBM_SCMI
+	depends on IMX_SCMI_BBM_EXT || COMPILE_TEST
+	default y if ARCH_MXC
+	tristate "NXP i.MX BBM SCMI RTC support"
+	help
+	   If you say yes here you get support for the NXP i.MX BBSM SCMI
+	   RTC module.
+
 config RTC_DRV_IMX_SC
 	depends on IMX_SCU
 	depends on HAVE_ARM_SMCCC
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 3004e372f25f..8ee79cb18322 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -74,6 +74,7 @@ obj-$(CONFIG_RTC_DRV_HID_SENSOR_TIME) += rtc-hid-sensor-time.o
 obj-$(CONFIG_RTC_DRV_HYM8563)	+= rtc-hym8563.o
 obj-$(CONFIG_RTC_DRV_IMXDI)	+= rtc-imxdi.o
 obj-$(CONFIG_RTC_DRV_IMX_SC)	+= rtc-imx-sc.o
+obj-$(CONFIG_RTC_DRV_IMX_BBM_SCMI)	+= rtc-imx-sm-bbm.o
 obj-$(CONFIG_RTC_DRV_ISL12022)	+= rtc-isl12022.o
 obj-$(CONFIG_RTC_DRV_ISL12026)	+= rtc-isl12026.o
 obj-$(CONFIG_RTC_DRV_ISL1208)	+= rtc-isl1208.o
diff --git a/drivers/rtc/rtc-imx-sm-bbm.c b/drivers/rtc/rtc-imx-sm-bbm.c
new file mode 100644
index 000000000000..daa472be7c80
--- /dev/null
+++ b/drivers/rtc/rtc-imx-sm-bbm.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP.
+ */
+
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+#include <linux/scmi_protocol.h>
+#include <linux/scmi_imx_protocol.h>
+
+struct scmi_imx_bbm {
+	const struct scmi_imx_bbm_proto_ops *ops;
+	struct rtc_device *rtc_dev;
+	struct scmi_protocol_handle *ph;
+	struct notifier_block nb;
+};
+
+static int scmi_imx_bbm_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
+	struct scmi_protocol_handle *ph = bbnsm->ph;
+	u64 val;
+	int ret;
+
+	ret = bbnsm->ops->rtc_time_get(ph, 0, &val);
+	if (ret)
+		return ret;
+
+	rtc_time64_to_tm(val, tm);
+
+	return 0;
+}
+
+static int scmi_imx_bbm_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
+	struct scmi_protocol_handle *ph = bbnsm->ph;
+	u64 val;
+
+	val = rtc_tm_to_time64(tm);
+
+	return bbnsm->ops->rtc_time_set(ph, 0, val);
+}
+
+static int scmi_imx_bbm_alarm_irq_enable(struct device *dev, unsigned int enable)
+{
+	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
+	struct scmi_protocol_handle *ph = bbnsm->ph;
+
+	/* scmi_imx_bbm_set_alarm enables the irq, just handle disable here */
+	if (!enable)
+		return bbnsm->ops->rtc_alarm_set(ph, 0, false, 0);
+
+	return 0;
+}
+
+static int scmi_imx_bbm_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
+	struct scmi_protocol_handle *ph = bbnsm->ph;
+	struct rtc_time *alrm_tm = &alrm->time;
+	u64 val;
+
+	val = rtc_tm_to_time64(alrm_tm);
+
+	return bbnsm->ops->rtc_alarm_set(ph, 0, true, val);
+}
+
+static const struct rtc_class_ops smci_imx_bbm_rtc_ops = {
+	.read_time = scmi_imx_bbm_read_time,
+	.set_time = scmi_imx_bbm_set_time,
+	.set_alarm = scmi_imx_bbm_set_alarm,
+	.alarm_irq_enable = scmi_imx_bbm_alarm_irq_enable,
+};
+
+static int scmi_imx_bbm_rtc_notifier(struct notifier_block *nb, unsigned long event, void *data)
+{
+	struct scmi_imx_bbm *bbnsm = container_of(nb, struct scmi_imx_bbm, nb);
+	struct scmi_imx_bbm_notif_report *r = data;
+
+	if (r->is_rtc)
+		rtc_update_irq(bbnsm->rtc_dev, 1, RTC_AF | RTC_IRQF);
+	else
+		pr_err("Unexpected bbm event: %s\n", __func__);
+
+	return 0;
+}
+
+static int scmi_imx_bbm_rtc_init(struct scmi_device *sdev)
+{
+	const struct scmi_handle *handle = sdev->handle;
+	struct device *dev = &sdev->dev;
+	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
+	int ret;
+
+	bbnsm->rtc_dev = devm_rtc_allocate_device(dev);
+	if (IS_ERR(bbnsm->rtc_dev))
+		return PTR_ERR(bbnsm->rtc_dev);
+
+	bbnsm->rtc_dev->ops = &smci_imx_bbm_rtc_ops;
+	bbnsm->rtc_dev->range_max = U32_MAX;
+
+	bbnsm->nb.notifier_call = &scmi_imx_bbm_rtc_notifier;
+	ret = handle->notify_ops->devm_event_notifier_register(sdev, SCMI_PROTOCOL_IMX_BBM,
+							       SCMI_EVENT_IMX_BBM_RTC,
+							       NULL, &bbnsm->nb);
+	if (ret)
+		return ret;
+
+	return devm_rtc_register_device(bbnsm->rtc_dev);
+}
+
+static int scmi_imx_bbm_rtc_probe(struct scmi_device *sdev)
+{
+	const struct scmi_handle *handle = sdev->handle;
+	struct device *dev = &sdev->dev;
+	struct scmi_protocol_handle *ph;
+	struct scmi_imx_bbm *bbnsm;
+	int ret;
+
+	if (!handle)
+		return -ENODEV;
+
+	bbnsm = devm_kzalloc(dev, sizeof(*bbnsm), GFP_KERNEL);
+	if (!bbnsm)
+		return -ENOMEM;
+
+	bbnsm->ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_IMX_BBM, &ph);
+	if (IS_ERR(bbnsm->ops))
+		return PTR_ERR(bbnsm->ops);
+
+	bbnsm->ph = ph;
+
+	device_init_wakeup(dev, true);
+
+	dev_set_drvdata(dev, bbnsm);
+
+	ret = scmi_imx_bbm_rtc_init(sdev);
+	if (ret)
+		device_init_wakeup(dev, false);
+
+	return ret;
+}
+
+static const struct scmi_device_id scmi_id_table[] = {
+	{ SCMI_PROTOCOL_IMX_BBM, "imx-bbm-rtc" },
+	{ },
+};
+MODULE_DEVICE_TABLE(scmi, scmi_id_table);
+
+static struct scmi_driver scmi_imx_bbm_rtc_driver = {
+	.name = "scmi-imx-bbm-rtc",
+	.probe = scmi_imx_bbm_rtc_probe,
+	.id_table = scmi_id_table,
+};
+module_scmi_driver(scmi_imx_bbm_rtc_driver);
+
+MODULE_AUTHOR("Peng Fan <peng.fan@nxp.com>");
+MODULE_DESCRIPTION("IMX SM BBM RTC driver");
+MODULE_LICENSE("GPL");

-- 
2.37.1


