Return-Path: <linux-rtc+bounces-1377-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C217E911C46
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Jun 2024 08:57:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2EBE2B24932
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Jun 2024 06:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6369A16D306;
	Fri, 21 Jun 2024 06:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="R9t8s0Uu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2050.outbound.protection.outlook.com [40.107.22.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E19116C87C;
	Fri, 21 Jun 2024 06:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718952977; cv=fail; b=uQTFebu5jpvnCbYCrqjjEkiFwDxquipk4ZC7OQUw/fetMY5MPjz1ULDNbo0OjkCmlzSLR5HnLiBL/WyO4vePiU2j5TzCEaGfYiQ1dlJfMWHbb89aOIDoLYQL7gZt4Ox2rAfOmDgMgYz9Gx+qRSmgksOcHh+HAqcoDkKhfjN8dG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718952977; c=relaxed/simple;
	bh=znwwOZYcZ/cOQiRbIjSJ/wWzMCcmPndge6mLJ8jCWiQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CZ7VJf5wFi5zeXztirQ/h5RbJtoCGvIHwXCHXKoUjTW0gEzY0ZWOZC3HqTspeX2nsxp07jvc0MybRK0fE0QFxtzqVv0pciEUf1o+4VNZEyiCkPHBfbWL+M1xGL78D+whs5//9BVRFN+nHiqjAgLUj5oArFUAal0HrtIsLNUMmKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=R9t8s0Uu; arc=fail smtp.client-ip=40.107.22.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/vPhHHiC7Xi6JRXjisKdhkhg1WAcjV8kq5CfirTgRg9aE8GLE/P6J2lunzsrF+6EvsPtfCpmELp9jFWkNubcdCRELZGeGHTU2ZvLEV8wbM6bxi16xoiYm53N9oXadaF8yylvTbHk6KwxFR4e9cvjCKyJHGX+LY76qlfbnOUrxTzbROzulzqv4IHvuAaVwSTENa0Qx/xWFdnHbD2XMS8iKlp9At7Rz6C8Aimt4oa86hTj86vCReRaQr9w0zf+vm7gkSky2S+p6LvisgqM/yeSDdFjPCclTcH53kyghY3l9bwgUEoGHsD6eo5ceDrqr9FicufGXARUrqgawGh74SOqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LVaQmxewtWgDieWlVI4F6SboEGpS/btxQN0knD2YWM=;
 b=Jo8sq/SnrBBw2qd5j1b7ZUNobA9ae0HrRd9pEjPO/X10HBZH1C4mayZktNf0RjDJQgIvfbeciMC7YYPKW7hgIB0b7kc7ZTAGO/nChmHZrdwC7wYdHAaBNSvbMR40wWl4Pg0rOMMzKP3pLm6/QtkrQC/sE8OzFMRJvvPI4NViaFUXhko1Le3qWS9s4LtxV1kCu/QGvbw2Eh3Zz0OuIBjwhO+jzr3ILJpA1t5fRiqST4T8DNIln1x8WMUOG46h5lhcTjWMFXDHa3jlR28eIiyqrjnEmzPKM/JH/+Q1te/B1VSyo2RjuFrbtDGVE1YLpAIASWsoGgFjzUTbTk+W9BARuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LVaQmxewtWgDieWlVI4F6SboEGpS/btxQN0knD2YWM=;
 b=R9t8s0Uu/QrFyhQmeWs05Pnf7WYkvgZxC5jlOmzv2gx0hZiBGiKuxEpXX+UaVjCCZeQlltNbu89JMiW6YYqdK1XYRIxw/Bpvrv8xgxY8jvWpqJ8HJg+QVWMkZBrATVpLoN6o4SJAGeD9dfUXBk0q8iN2mmd1LuDrGi5DDl5QPBg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com (2603:10a6:20b:9e::16)
 by GV1PR04MB10426.eurprd04.prod.outlook.com (2603:10a6:150:1cc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Fri, 21 Jun
 2024 06:56:12 +0000
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256]) by AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256%4]) with mapi id 15.20.7698.017; Fri, 21 Jun 2024
 06:56:12 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 21 Jun 2024 15:04:40 +0800
Subject: [PATCH v5 5/7] firmware: imx: add i.MX95 MISC driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240621-imx95-bbm-misc-v2-v5-5-b85a6bf778cb@nxp.com>
References: <20240621-imx95-bbm-misc-v2-v5-0-b85a6bf778cb@nxp.com>
In-Reply-To: <20240621-imx95-bbm-misc-v2-v5-0-b85a6bf778cb@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-input@vger.kernel.org
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718953487; l=6433;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=6mJryA2gjuHsLRyd9bfAMdNInUOb690lV8nR15s/uP4=;
 b=HVOZ0M8O0QK/VT0rwIgpBNRRnE0B9sW7iPNmUNYOQTEdL4mZm93qBOKNC9gs+nnxVOxTYJqPJ
 tDYyzIuTPblBuZi/ZkizIxInPuhc5Ug0dojz8M4dy3pPhpOaSdp3Ad4
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0122.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::26) To AM6PR04MB5941.eurprd04.prod.outlook.com
 (2603:10a6:20b:9e::16)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5941:EE_|GV1PR04MB10426:EE_
X-MS-Office365-Filtering-Correlation-Id: f217f2de-d50a-46e6-06b5-08dc91bf3c75
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|1800799021|366013|52116011|7416011|376011|921017|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?azdiL1lsaFRnWFZKZmJkMkxSeUR5dnlsZ2IrZ2ZkOFRsQ3ZaZ3N1Umsrb2J4?=
 =?utf-8?B?TU9wV1hHblozK2NnZTEybUh4WGhVNk1XRlNvTjlQV29KaVBzQS8wSk9JWkNY?=
 =?utf-8?B?Z05Td3J6OEsvemQzRlZVcDM4NTRMeWgzVC9WbU82blFMaCs4VnREM1hJa2I5?=
 =?utf-8?B?RVVGdVQ4WVVWcDl6YzhHQTJUK3I5NmZDQWtNU2hFMEpUVHJPMlp1WHdWZmdu?=
 =?utf-8?B?WG0xS09Eb1ozMTZMRG8xUVJRSlRrNUVhYnNxVG5mNmpSRjcrVGk2VXVGMU9J?=
 =?utf-8?B?QlE2STd0QU9xb0szMzJKWk1OLzFIU3NZeVF1SG96MTViOUxrdkp4K3FCdlNv?=
 =?utf-8?B?S0tiK3hYS1pJSFlTcmRBTzlUd1V6K2sxUHBXWjJPQ0ZpR1VMVVc2aTFwNzdh?=
 =?utf-8?B?QnNmNDBuRGtyNzZUQndBdUxiaTVoUXRrd3BTeEQxeXlEa2VIUjFJNHNvNmR6?=
 =?utf-8?B?Q21VZUxIZzEyZHluWHdQdXM4cVpzZ2l2c0hXTjBQdHBxbytlbUZlUmZjUTJ0?=
 =?utf-8?B?NXVrcExpSEZ2bnI0YStMNUcyclNxNkZIalMxNENCZDVnR3QzTUEwc2FkUlFn?=
 =?utf-8?B?T3JqRFQ1MDhzRE11NUZFc21rMzY5by90aVFzcm5JZzBlLzZ5ZTkrcUptcHls?=
 =?utf-8?B?UHR6QnlpakZrejZ3ajZGUkRqWVJWY0ZCRXA4d1djNEZZYm56dkU0UUc3V0to?=
 =?utf-8?B?aHFmdFZvTC9kSkRZQXBxdDVvYlYvUGNYSXpxSm50SDhhZDhqbkhVbjl0d0E3?=
 =?utf-8?B?UDRmcU1adWpwR01GOVQrcWRwZ1RkVUdISTJKY2NreEJQeTYxc2NzcncwM0tH?=
 =?utf-8?B?ZHFQNWw5Uit0SjlCNTdPazNYN3NRVGd4a0xwbmtBbXRyNnBpSUJqbDFycHhH?=
 =?utf-8?B?amNmUU1leURoQkRNYmx2TVJyNHVZVXF4VDhkUG9XN2ZVTjR1b2VZWU9QSFlM?=
 =?utf-8?B?UnB5cy90WVRRelIwbVl1K3RSYzc1RjRpK3ltaHMzcnMxVjRRWmtOeSthOTNF?=
 =?utf-8?B?TXdIV3BzUUVlSldINTgwWHplVTVybmVMYkJDU0VyakRmZW5WblRtak1qRWZP?=
 =?utf-8?B?Vjdtdm1pczRaaVFUK1hvL0NTS2tKRm9MVGh3MjVKdnhpL290RFh5Q1E2NFM3?=
 =?utf-8?B?V0NrSy8ybjBvUlRFZE1wMnZZMmRZeHI2TnpPODJKR1lHWEVjd3poWEZ1Qm1w?=
 =?utf-8?B?TlB5OWNQU3ZRUStFSm5HT0FvdFczUVhLWEMrb2s3RUFVRzRWd2RwcWN1ZGFz?=
 =?utf-8?B?TEZ3VENSbFZ4amQ4NVpoNThETGlZVG9UM0F2ZXJUMEtaVzlMa3hLRlVEd0FM?=
 =?utf-8?B?aDdnYzhkOFhtektJUjZDMkFTdUp2b1FqSExNRThKVXF0S21xdUZtOXBwdldE?=
 =?utf-8?B?REdtc3NwQUJRZVhvNU1nU3Jhdnp1M0EyWDExRnY3VkR1QVQxREpyczUwMGtJ?=
 =?utf-8?B?U3AxWWlQY3dJMkVyUituRlJwUitSUjBHeXBnNXdPSGZFc3U1dk5OblJ0NVUw?=
 =?utf-8?B?YW5yWFZ2dWpwd2hBYndFZEY3emdQQm01a0U5RWxRdTBpUGx2VUdLS0RoN0pV?=
 =?utf-8?B?RkZqNmdDVlBFNDMwS0x2ak4rSlhFUC9RZHVvUXNhWjB0QkRIWWlQTEVIcEg1?=
 =?utf-8?B?NmZhM0E5ZERmWEtOZCtNMWdDTXp0U3J1KyswNVhmSjZWQ2hEc0tHVTV3QkZB?=
 =?utf-8?B?eXN2YW1QWUtoS1N5Z0dGSldtTk9LMGtMMklLa1VTeXE5YnhOR1F2WmRBZ0c3?=
 =?utf-8?B?QUJLRmduZGFNVXZVLzVkT0g2d1Bzd2JMTGZsRWFJZy9yR0RFdHJyT2hoVXV5?=
 =?utf-8?B?Y3V6OFNTZGNSV3JmaUpydzc5UUxnb0daOU1ELy9uTitmZk9lSXRha2taZk8x?=
 =?utf-8?Q?rsa3hJl0nsKza?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5941.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(52116011)(7416011)(376011)(921017)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enJ5N0VQZ0VOSUF5VUhEQm56b0hZUzhKSDAzc0x0UUc5cEZDSnJSelVqbnVq?=
 =?utf-8?B?dDRydFNRalNnQkhQSENkZWx2ZmV5UFQ1clBXVUpBbDhJdi9TTjl2Rm1LZ2dQ?=
 =?utf-8?B?VFdha2xDcXl0MURjamM5VVhQUnl5eHFqcTBtR1hIM0U1T25WZWo1WEdJZnBI?=
 =?utf-8?B?d1h2R3dTSXBpbnNtRGJuaEJPSUtLY0dwNDhpUDgyRlhaTFdCTExKRGdTRWpv?=
 =?utf-8?B?RzVFRW9jOGFrVm0rZU9mUWNhWEY5NHNyeEc0ZzNVRTJoOU4yL0lFcThUQSsr?=
 =?utf-8?B?OEEvRkRwb1NmVDRsTnJWWC81SHZZdVRtVHFwcnh3ZFVwemtlQ3Z6TmpWK1Bx?=
 =?utf-8?B?NWNWU3BZMGFaOGdQTXFXZlA2aGY3NnFNTkdrM1RHK3NWVzkyWEd1d0gvMFBI?=
 =?utf-8?B?WXphZDNYdVJjU0tzTExBUUVMTmp5SlZkYTUvSTFCVFBNUXRxcGxVelVNbUV2?=
 =?utf-8?B?bzhWU21FTVFTUzZWcnVtUlV3MldadTlTOEFwTUdXOWcxM0R0ZFpTTHNKYTFV?=
 =?utf-8?B?VFZsMklRdk9qZS9jRWFKdUJoSEtDTWtOUGVvbmJmS29tMzlER01mZ0hRYXRH?=
 =?utf-8?B?bmtjOEZBQVl2Y2cySUU2c0kySXljU3dsTzBMQ1dNQ1BzTEF0clJpTnNvejU4?=
 =?utf-8?B?T2liS1Y2am9PajBJR2RPOXgxMWVYanIrbXV3VTUxRUNqcmUvVFJFQWEyMmlv?=
 =?utf-8?B?d283VElNR1Vpa2twaUg1SExscGM2R256SmFoTSt0SENuZ0RzQ0dFdnJQa3FI?=
 =?utf-8?B?emNObWFrU2ZoV3A4YmV0NkZuSXkyVEpabzdNYnhqTXRvdk50YUVVL1hrZExs?=
 =?utf-8?B?OVdhNC9iYTZ6RVk4akRmVzA1YnJIdDh4dGY1UTM5RFd5ZHpGR0hSSm5qK0xh?=
 =?utf-8?B?ODFNUWZJQ0NNeXIyd0REaTVjeEQ4dkZzWU12UUUxdnFwRVZUVWQ0T2dBMmRP?=
 =?utf-8?B?K0VTRkU4cW1qNlQ0SmlhRTBHQmE5RlAveHF2M0FzeENWMm16NzBGSktCdVdM?=
 =?utf-8?B?TTVScnZ4ZVBLSEdiT0xjdURTWFlsNWJhOHlkd04zaTBrMk11bld5U0hGMnlX?=
 =?utf-8?B?Wnlya3YxL0FFa2tUckhzbHpHRTRRaUc1ZFdlTU9HbjBWa21QeDVQSTU1aEhm?=
 =?utf-8?B?MlRCc2U1Rkprd0FINExYVGF4dWJvdkYyZlY0aHBxSFFtNGFINGJjZnVGczBZ?=
 =?utf-8?B?VUJtU0tDL3dMUGd3TG5oOFRmQXdDbXp5WDlVMXVXZm1NRFpNdWpXQmZYaW15?=
 =?utf-8?B?K2h3MGtHdmkyUTZ1S08zeXAvdGRxTEx4ckhwTDM5TWZHTnEyM1hOV2ZXVnhp?=
 =?utf-8?B?N2lyOW1DdnV5Wk9YMUZ2dytNRHlMVnlRUDhBOWhGb2M5OGhiZGhMVks1WTh3?=
 =?utf-8?B?S20rOXA1TFpXRW1EUThwWnlUbE1VaWVIcnQ4cmRYNVI0dE9rSW12eXRSbkxW?=
 =?utf-8?B?UVpaakdYbFhqS3RmeG5BYjFPZHhxLzBDTDZSb09oMjBrb2g0Z3Eyb1ladWZL?=
 =?utf-8?B?TXNIRUpMN3pPNlhQUm1acEROTGRPZ0ZRMHJ0SmZ2Vlo5Vjl2SEo1ZTNWNVh4?=
 =?utf-8?B?RDhxMUMyV0NyZDZ4RllKTDN2VVF2UHZXc2t5RDdMMkJNSjBVcmlFREhSYzN6?=
 =?utf-8?B?THI3QmpFQTNoVlNXZlVMOENGYkRRdG1mY2M5T051cUFlNzEwbWJnS2pFQlo4?=
 =?utf-8?B?UUM4VnZWK2E2cStmaC9JSUJwakdHclhBZTVvSHJDb1IwN0FhT1p4aTdzQ05D?=
 =?utf-8?B?OFZMNVMyZ21IRUl0cGdMSTVTQzIvdXhpdFpwd25PNDlXTW1nWndOdHdoTzZO?=
 =?utf-8?B?ZmFOeXVLeFRLRjFXMXlpT2hxb0RXQTVJakI0N0RPZkhTaThQV2NaNkxRZTNu?=
 =?utf-8?B?UDVKcHo2RTkwWHYxZHF0SEF6eUV3RDhRY3JQbW4rdWx4RlJuQXFpRTd0d0pY?=
 =?utf-8?B?aEFmdm5MOUVpVkE5OS9MNVlGVkpTbzBqRERZUEpSUWhjL1dkOUNlaVZBOUpk?=
 =?utf-8?B?bGRoaWVGUEJ6U1RHSmVtVnZUMnl4dnR2VzQrOVBiMWhucXdGRkxFbVZWQTJC?=
 =?utf-8?B?b1FZdU9YSXRFODRYMldyd0xWdFNNbDgxbzJZR2IwbnhkZ0dzb1hJQzlNTmRp?=
 =?utf-8?Q?eARGRCIk6M6pfGacZfKcUxgbX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f217f2de-d50a-46e6-06b5-08dc91bf3c75
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5941.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 06:56:12.1161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ppkx2QiVEH+EDgOBCe8Pu3ZnnvUnJptFzTPsmbMoIrOvb2Oz8k7ecZMdnk+ikCu72fZq0TBEiDP8Nim7s4DA9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10426

From: Peng Fan <peng.fan@nxp.com>

The i.MX95 System manager exports SCMI MISC protocol for linux to do
various settings, such as set board gpio expander as wakeup source.

The driver is to add the support.

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
index 000000000000..342e1254a356
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
+		if (ret)
+			dev_err(&sdev->dev, "Failed to register scmi misc event: %d\n", src_id);
+		else {
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


