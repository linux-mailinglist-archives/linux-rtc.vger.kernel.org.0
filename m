Return-Path: <linux-rtc+bounces-1645-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD77942EFF
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 14:48:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E7B42883E3
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 12:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B9C71B29D0;
	Wed, 31 Jul 2024 12:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KWNKWQxt"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013028.outbound.protection.outlook.com [52.101.67.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272611B29C7;
	Wed, 31 Jul 2024 12:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722430065; cv=fail; b=WxQI/Ao3jTOCMwk3xb+njDmJJkkI7bJLdzXc5o88OPHeCflxm5VDnCK9ID7jUptuq6/2+HIFber05FJoWCr/la5W/XXaonzTcL+i2QcjP/b4rmD0MmHOdL3UVWiF00VQ3XYqsUFcDcySr8wDf1fBmlOWT/aKHoTfZnURlErac0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722430065; c=relaxed/simple;
	bh=LQvxg4wjhO9FWV8ybDeg50raOjfc2rJ4N3Rx1dkcBxg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=oL+Ve1/dVVStfg/ipadTBZ4nogMP1WFSICGRVGavwfuo+MRSwogWjXpciRortfoqoHjgSeB+63a3ZymP8IEEUrU8TRwUb+bFSUSziEfnr1Ht+0TBokSzHiE/0m8lmsMiJjubDLaDSUh3yJ/SfFhk6ZXnAQwW+kZV1Rf6UflXvqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KWNKWQxt; arc=fail smtp.client-ip=52.101.67.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kuanl3bY0ekqKdEGEJHplHXRETAzqYK76UuxOrjkYk9hXQ/cW3ZqBuf5EVe9s5Rv0wptQ3tIJDY6ta1w29/UxiW9KiA63AVyG6Q3jHUUlfZm5MsIveqtla/nYywOW+Wzx1KTsGGAbURJl9ociCjLlAHWbZS0gQHTs+5nr2m5IH67RFm9ED9HISe90q0BkyJBqxg7ivb6fIupIHO060hih8S8bzEKSLeOK7NnxHAbtU7vmE5taKeVsTmMBIY+suiWpiLoWGqnlrSQqCbcqDOVJ423Oq7O6iwzrcxYOIumeZFZS43tzIzaURF6wUsTB6iVgp2tqouVfAXD/ixsTHgmLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJ9BbhLwFgdLZiK9h91g5ImtM5fDYlp3ZRSCHB3HgOI=;
 b=mwNXwtLt6Fglik/UnsnZY+S+ByT8DT9DYkaJy1z+n6wV7l+GtiaEmxMigCgxy36KnhXy2d7coPC1GerBvpTzcAPY0Qi4HtxZBdC8ud6mwPfv0jjq5nmYIQbOaf3fqYbdPo9HRLJmLDvh4lMzeuK4gowVyMLu0XWd9ZzUBSgUskPHmGRs3HcL5x613Ufk7MCRV5JglyYcufP70atg6/uasVspRWz59rlGYR4BsHIBYY4CiXfZQLCSr++xUI1hKrwykySSV+NKWwu7Bme8FyRk2bqAKGgo4PhYgISAUyLl7uwVbP5ORn05ew5B1ph5JowzpfQBtO+KTJBBSJEtEJAUXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJ9BbhLwFgdLZiK9h91g5ImtM5fDYlp3ZRSCHB3HgOI=;
 b=KWNKWQxt6yHUN5FH3VpRF9NnN2Z+ZrbxbN7x7z7MJU9ZBKbinpmxXTQzPCY4FMTYjgO/fBSIZE1b30uDwttl2dYdl4xuEPLKQDnTS0nwM0LZTqygkmtQ1EkBQ0QolGJYzveoj+DFrmkxizV6IV7ATE3+k6Cmv91XlyJSb8+mkpxXIGhhnEl7QSt3zkDdV4fGoDNYpka7E/coDpFKw8zSLIVwMIViGEHwI0pUQpdBGyg2zh9pC/W82+xbPYI6NkxhZ+vf+xTdLHU96yKEYosH10XfKo21QwqgtNzxAhI2qlDJHSdfA6EVW35dwSFq3mW+5hNBUaVqyYu9UG3+LQE9wQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7735.eurprd04.prod.outlook.com (2603:10a6:20b:2a5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19; Wed, 31 Jul
 2024 12:47:39 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7784.020; Wed, 31 Jul 2024
 12:47:39 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 31 Jul 2024 20:56:09 +0800
Subject: [PATCH v7 5/7] firmware: imx: add i.MX95 MISC driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-imx95-bbm-misc-v2-v7-5-a41394365602@nxp.com>
References: <20240731-imx95-bbm-misc-v2-v7-0-a41394365602@nxp.com>
In-Reply-To: <20240731-imx95-bbm-misc-v2-v7-0-a41394365602@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-rtc@vger.kernel.org, linux-input@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722430577; l=6495;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=D48dI8TueQeMQCWqqGsKwb9eBu8K4dfQ0em7IUIjo5A=;
 b=dud87r8AcWyVvperzZ8k/QH74Iwl2SpWgy2/HzNr4DoV2VzygOjY0bELANXYgqble5ECcXM53
 g4HCj7Y0UsLCCCEsOWQfmQ/GJbgQlRRfn6rb7Y3YfflIY1QA8P4Hbug
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:195::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB7735:EE_
X-MS-Office365-Filtering-Correlation-Id: cac3b897-70ce-4cc9-3ef4-08dcb15ef650
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L1ZzS1NObnRUUlF0VGwxdEZKU2UxS0dQZ2NBamhVZE9YdVh5L3BSSDVyVCth?=
 =?utf-8?B?Q2lzN1ZTQnRERVBBTVlQMW0rdGdVM1o0Zk5KcE1Jdi9Tbi9ibWttK3ArMkR0?=
 =?utf-8?B?aE9SNzQ0VTFCYThNUWFRckZGRkF0TlRVWDVDRm13REtzRDk4blN0UkNaZDZz?=
 =?utf-8?B?K3pwTlNBRnRGU01PYy83ZHJ1YVphSlNUKzF4N2NrcXk0OS9jWFR1Y0x4WWRT?=
 =?utf-8?B?ZnpMY0xpeE1lVkp3ZThkTHRTZjBEeEc2NzBkVm03L0VuUVRDVmlqT1crNVdM?=
 =?utf-8?B?dXlaS1YzeG1Rck5KSzQzSTdhTGgrMCtoaHBYNmZXc0E4WkNTUGJqL29KOXFk?=
 =?utf-8?B?UktPMDVvQkhSZXpVRkZPQjlNVCtYSmZCaUROeWhreUtVMXlUb051OWRCWThu?=
 =?utf-8?B?UWhjMWloZjFydk1lbDErbFNxcEY0c0xVYUU3alZLeVk0MmpuRDEyNzZOVVdL?=
 =?utf-8?B?bUZSWXpuTVVkZVRrNXlwRnRkcEIxYWkxREduOEwrYTdEeUQ5bTFjbEk3MXZl?=
 =?utf-8?B?UUM2QmwxSFRSVVNXTGh5RlhKcmRqZm9uSms1TWJSd2xLZklucVcyNFR3RHd4?=
 =?utf-8?B?MWcyWXBqTTFycmNDWm1PN0hpd1NRNEFhWVdxNDE4cElIeDUwMFREMjYyeGVn?=
 =?utf-8?B?N29ueHliM2JmZnI5ZU1ZUzFSNnFnRWkvUXRkTHdITU5Zam9jcVlLb210dmVZ?=
 =?utf-8?B?dEdSdzVkTUMrRkszSDJwcXVpUXhHSWZyTVVZSmI2VFJqd2tEbVVrTzV2bFQw?=
 =?utf-8?B?OEkrNUVHYlBGV2dHNE9WM2lZc0d6eXB3R0R4SlVQS0tJMHRrZGlHL1NvSHVF?=
 =?utf-8?B?c0JhdTB0Rk8rQ3dFRjRGOXFSenAxNzFVdDZCNkVZUHlWcjU1TjN6U2t2Nkcr?=
 =?utf-8?B?R0FFbnV3TEl4ZkQxM2tFM0ErbDNXRzRBdUlyOHBlcWZDZFpkVWlUaDQvSU56?=
 =?utf-8?B?ZmpEMytmUHIwb2lZZ3kwYmhnRXZ4SmE2RHJjVjFnZmJOT2V5NTRkVENrUEJU?=
 =?utf-8?B?Tm4rUDBvMEd6V3drL3FLaDY5SUpnTDJyMmo5MHhUUkY2WSt2NjU2MksrUXg0?=
 =?utf-8?B?dW02U21Jd2dqaEpQQ1ZQUE1CcmZQT0xISWo1UzJHdEJDaHB1bTJqRXFHbHBx?=
 =?utf-8?B?b0NJSUlrTi9NNUlsODFlN05XQjh1SXd1ZHJxY0VwUVBBU2ZKY2VjZUw1QnpG?=
 =?utf-8?B?T0dHcUJRZW1URDBrcFdia3dDMUhJRWdWWU9Bc0dNaU9FZG1uck81UTUreEpI?=
 =?utf-8?B?TEQ1cWIxR1VEWnl6MWs4RTJ0L0tROVRpRG1ramdlUENYQmtEK1dnY1JWUXF4?=
 =?utf-8?B?SXE1ZmR2UjRRaWpZL1lsODl0cW5wTVhMbXZmZEt0YmdPYjZuV0FJYnF6THhQ?=
 =?utf-8?B?UVI4ZFI1NWJ2RG5uMFJwSDhuS3gwdEFabmo5a0lCdFJ1VWN5Y1FSTWVQYnBK?=
 =?utf-8?B?UndmWWxURmZMSk5OeHErT2kwNnc3cHpoeE1IeWdPQ2FHc2YvellvVmFoZDB6?=
 =?utf-8?B?L0w1eElOZmUrVXZqK3dqVUpHTXFpRlZQYzhKcDlsbVBjK1d4UmpCVkk1cUdF?=
 =?utf-8?B?UWdzUHJrZDhyY2EvVmd5VlhKMGZoV1JuQzY1ZDBXM2xzQmRnTTFiL1YzYy9y?=
 =?utf-8?B?MEVGUVpzR1VITmR3Q01YL1VVL2ovenh3SHhxbXN2ZEc4ald2V3NlTy9RU3pn?=
 =?utf-8?B?M1JyaHk2WHJvb1h2aGszTkdZYW0zYldJSHI4anptUURMeU5jaG5KeVBRQ0hO?=
 =?utf-8?B?c05wWjNYV094eFhQKzJ4S2J4NzlOM2d5Ym8yQ2N1dk8vdzFxSkVib3B3eC92?=
 =?utf-8?B?bzBUMUFUUHBGUmhsbkVCR2w0S043aUZrU1ZuNEkzWCtkNmtXZUc3YU0yazlZ?=
 =?utf-8?B?SElWcmF3RWNkMEhTenZackdYWHpGN0tCaWxXN05SZXpTcFZYbWEyZlkxaVQx?=
 =?utf-8?Q?04EvTXra5Ek=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czgwVmVodTlJaEZMSUF0cEhGZDFQQWMyckxPLzAyVjlHN1JKaDJadE53V1ht?=
 =?utf-8?B?VklSQ3JlL2hKbWY2dzVVbjYyeUI3UEMxRmFVS2tmS2NwcXBjTHgzTzFxVm9R?=
 =?utf-8?B?cWpOVk8zb1Z5TnB4UkpEMjFYY3VjZEl5aUJqaHJWNVJpbUtJaDVkeTllVjRB?=
 =?utf-8?B?MVY1bkJDcERFekZIYkdNV09uLzcxUGo3eE9EdVJUOURad3h5empxbWM3Y0R2?=
 =?utf-8?B?amRzOXFCai9YSXA2ZVBWSWxRSTVEL1JabE8xei8xNit6bG10QjdQRFJYS3Rx?=
 =?utf-8?B?a3NjOUlsbzM2ckIzMVlLc3RyZHdSY3BzN3dVTy9qd0pnUkU1RkNUMGNWUWpv?=
 =?utf-8?B?RTFtazcxbGFIOFZxTUF1QmFuUThyYU5NT0NxOXF2ZmVaQ0dpazJpME9FVHhl?=
 =?utf-8?B?OTRqMGo5MTJlbG1KYUhLUHFCVWYzUklGOWhWczREdi84SHVpL1pHVzFLYkNX?=
 =?utf-8?B?NmxtR2xOVWZKZU5XaFp3Z0d4aW1DQTBBSzdDTGtBTXNTN3FES3g2ZVkwckpU?=
 =?utf-8?B?L2M1dW8yTmVQaktwRmVJeEx5dFlCZ1JOTjV0U2hob1E2TmtzM2xadEN2dXZF?=
 =?utf-8?B?VGJodGIzankwZXZwYms4VFBFZE5USzk3V1dGakQzazNwYnBnUVI2ajUyVjBD?=
 =?utf-8?B?ZExTTUIxeHNyVldUZnJlYTZQODE1VzVHUzJDdVp2QSt6RDlBZWV0cWUxK0Ft?=
 =?utf-8?B?eWtTNUY2eGFiWitEMHBDMG16TVY3V3JRbkRmZHc1aDJGdTJpUXI4K3YyUnpG?=
 =?utf-8?B?dVlxQUdhL09hcW5zOThzZG1xa000eGtyM2hqN0Q3eWV0UWZZYlNGWjNBQXZz?=
 =?utf-8?B?ZVJDUnA2R3B0QXkyQXVYaWFnUCtxejNJaitkbCtkaUxmbS8rTEt4a1g2bk1r?=
 =?utf-8?B?RXdpcWtpRTNDUUNqbWo5UWhKUmp6NlA1WDV6Um9jM0NYVTVGWDgzSm44UlJB?=
 =?utf-8?B?eWFna0xWMzhGbWxIYVdJdkRCV2lNclJCR1kzWTNpR1J2dEtQT3RtKzdKVkJU?=
 =?utf-8?B?L1d6aDBDbnJkOEM1V2Q4RmppbHVaT2dDNVlsckNVb0dhQ3owZ2dZeUJhelQy?=
 =?utf-8?B?T2VZWGFNVmNzWFBLWEFqRHNodm9TamxNeC91ZFRoaWZuWDVHZDkrMWdKV0JI?=
 =?utf-8?B?UXB0MFpvYkRocEJBZ20yWEdCZEwzVlBqUnU1SHlscWFRV0M2cytJYVJYWVNl?=
 =?utf-8?B?SUhSUEJZRTg5c00xQS9qM0E1U0NWSjRMZzJodjhaNThQTW93RTVDaVVKa2o3?=
 =?utf-8?B?d3BlRnBTZ3VJY1JVUGVXZXV6dW92SDhWdW55aS9tNlZLbFFBT09Lb3hQcXpF?=
 =?utf-8?B?TkJGN3oraHJzcEQrWkJYcm4vbTFhYSsvY3hCeUZJdEJOcENnQS9Sck54Mjdx?=
 =?utf-8?B?bzNZSjFpZFV2aW1tQ0dnRW1iNmxqNWd2ZFM1VktLSjR2TVVNN1B4VzliM1VH?=
 =?utf-8?B?bUs4eGxVaVhsQmtwZVVZemowbmpxQUV3OU9neGRhRkpYT0FxUUFaVHhZTUd0?=
 =?utf-8?B?Ykt1Zi9hOGRjRHdwMHI0VXlUOGppSCs2dDRMTURtd0ZQUVo0UUhVQjlXeHN0?=
 =?utf-8?B?MWphc295UWtDYkJNYmdva001VGhiYjFicHdnaVE1M0pSclBjWm1tdmZzVmpB?=
 =?utf-8?B?Z3V0MTk5ZkVqL3E4RHpBeWlGUG9vY2VYazlNbXR5T2dxVTVMb1hyUkdTWHZL?=
 =?utf-8?B?aEFNNUV1NFNSOVB5Y014WkR3Z0lEN1cvSnVPTWFZaXYwRVdUZzl5YWpaUXZG?=
 =?utf-8?B?SDdXWEhuZHRXUGtackcyMDdTNWFZdWwrUWdOL1d6L2JSL3Y5dllmR2R5YU5m?=
 =?utf-8?B?WHBUanJnVjdLd1Jaa25jZ0Jidk95SUFzSGNrYUtPaGlXK1V6ZDBEcmtRSldZ?=
 =?utf-8?B?YmR6eEE2MUs4R0xUenJxK2g0VURUUlgvQkhBYUU5THFPOHRYa01JVVE4djE0?=
 =?utf-8?B?YjB4NENtQzh5eVVBeXNkbjkxbjJUZlFER2RDWWJiUi9lNkZuS3d2ci9mbGwv?=
 =?utf-8?B?MXRrUG84M0hGNll3ZG5sUUpybnRwTkg1ejN6ZlpFTkJXVkYzOXY3bUtUSUhn?=
 =?utf-8?B?VTg4Y0RUbnNNTjdrS0J2dDRJQytBWDZKYkNHTW5vZWs4Wllwd3RIZkgxU3hZ?=
 =?utf-8?Q?de9IcuqGUbSB6ePYEHDC5YZBO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cac3b897-70ce-4cc9-3ef4-08dcb15ef650
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 12:47:39.8402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fa8LHzsF0HvFmwDqXXU2TQC0COzkyvVJlMgFmuWqzrmtvsqzKq3o9H4OmZ0qj2pbhem+skgRVuLiE7fSukTheA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7735

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


