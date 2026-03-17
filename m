Return-Path: <linux-rtc+bounces-6228-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +G9KEdrouGkllQEAu9opvQ
	(envelope-from <linux-rtc+bounces-6228-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Mar 2026 06:38:34 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 992DC2A405D
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Mar 2026 06:38:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A14F3009B27
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Mar 2026 05:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E438C37EFF6;
	Tue, 17 Mar 2026 05:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="j9/3UNGJ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013066.outbound.protection.outlook.com [40.107.159.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E14137E317;
	Tue, 17 Mar 2026 05:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773725911; cv=fail; b=Ed5iaacH1WeKDyY6aHbnEXjA1k9jZmUHNT1F/bNQFUqaLHRwqUTgKTzpY2kVGROrLJ2Aq1pAbrfpEcbhPBHBHP9C3vou8Z+wHB1JLOS/vlZdFpswR5V6VIcrRYYEZ/3z1yakZwzD0d1Jl2sx7LVAp6N8+ony2qdRXa+bOuRe4zg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773725911; c=relaxed/simple;
	bh=wSh89j/hfFpDGucHz7U11WjCIn1Bx8+WSc7CkPQ3UkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NcxXv4q/Mi3fvNTQjPcQvTGutBwRe9NgTxaduh2B3AEI+QHqnQoH+QScTFWAYDoduClBqFdD+TTq9bxSHWKmCyp2XqfJaczlYMIrLFayugNZqEtCxhTQUP5FiyFUTRd/CYWIFjpDPEUXSbhYnNE7i4r6UmS/+k5H61N7p8GaXyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=j9/3UNGJ; arc=fail smtp.client-ip=40.107.159.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KgcZ2BRk+9LYLn7GMD+sjFcd+E+aSIYih6ufocYhoSiWOwChUL0qAsL7u/l1S9Pem8I2geDQ+oWoDrqqKskq0CHhNy3LTrETJfj2WG/eYODqEzOYyGUfrJT5SRDjPR+MfA3y7ikVwylJlyGJxOjNGOQTfSc3Ja/rdlRRRKy4d8Cry3yYDYGV1f7cgzvZlrwxtYBd+TZFS3jEyKbLKIVT7UCE+MJMLAWhxXEUMNds8Lq5Ju8lH7zsWZ8i+gOLmA/3koHMboAkqMS4SEV/rQ3PGOBOu0soes4N+S5M6/BKtaF9FyBMFoh3I/zz4oi65ZJ8zDa7FNVjoqH1MKfbCHIfzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1212/XKsrrbaEhDPe1+NaKPYoyen2icCDX31K8TQq7Y=;
 b=dG9ueHAj+7MBs6Useo6ZqOv27UFh096WW/BIZQltsSO2aUlhydfEZ8gW0maQq212b1PogcnZ5rWRBj1ud4v75wJelsmtT6DXSZG3KsyZ+Woo/0x1DxfRmwaFeGTETRTOt1+tiBJMBooZfiQwwoXTUch5tOC2Qeb3YbOv4+kUMzrS+qBV3SfYfLjTlBG7yHhYqQtMSQKz34dSfJHnfjNJw16/C2nx2sT0Kd1F3nrPQKYWsSM/HBzBf3XQWI7pfEOGEurhbDVnm5L9aCjUaMscCN6NlXPZMiL6PDv5nVcm208RmavaRNELtrkORbltSopppeqwakAuj6xZygF1hU/P9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1212/XKsrrbaEhDPe1+NaKPYoyen2icCDX31K8TQq7Y=;
 b=j9/3UNGJiPNW8LQb73H14Jfza8TW6RDT3cacUdNptUx0yWHVK9x24oSPiTuX580Uwo/vq3ziRPEZzDKcgyQx7Nw3vS33Pf0AcbTuN01s9ZUx4Ll7bo/XPD1QhZO9HmynyHYRxjNCAA8ZFqYFi7jLCojPyylJKkwFa6JnUptfaIUJAvDU7LRkyd8gAfS4uHpO4BBXeuRdSuQGkTw9l7bXK4eYgDcbrdrj3e5Lre+aMvkMnSkWeEs+vHCH7D9XGYH79T7Bc+pQCsbbkZJtbAnpiobvoYblpv++yUuthBdxCIzMSfrcIVw9nSA0N9n9AUArL/gZ0d6tcnkAIvGUpYMCNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8426.eurprd04.prod.outlook.com (2603:10a6:102:1ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 05:38:26 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.022; Tue, 17 Mar 2026
 05:38:26 +0000
Date: Tue, 17 Mar 2026 13:40:31 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Andreas Kemnade <andreas@kemnade.info>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 01/15] dt-bindings: power: power-controller: Convert to
 yaml format
Message-ID: <abjpT+q9Z1EAsLsj@shlinux89>
References: <20260316-power-controller-v1-0-92c80e5e1744@nxp.com>
 <20260316-power-controller-v1-1-92c80e5e1744@nxp.com>
 <e1e91ada-4d21-4384-983a-676a3aa09bd7@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1e91ada-4d21-4384-983a-676a3aa09bd7@kernel.org>
X-ClientProxiedBy: MA5PR01CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8426:EE_
X-MS-Office365-Filtering-Correlation-Id: 484a5424-fbf5-4479-1b04-08de83e7687d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	fq6ewMrQmPJsxnrgPv4Ew9o7IhgW8SJbwu/mokBZMzozMTPyC2p9oFkpmI3rkFexNQO7o1RU1AHGENEzhcs6gRetT6ujzVIgaqiq/xwOABpw7D1aIcX3T8oaeHHxh433MwYsevBY2hWIT4Ez3HryL9o8actPgaFJtrpvjPPa5HUQGDx0pfOZrA3Uzv7d0Ho6mE3deCc61Sg4pW2hnDfyD53PS4SbxUbUWXmp3fCraobCFPq9FrUbEM+zHQ7789mVkmMzmFYdrQfmGzhS2mRMyTuE8A4WC2DXZCjlGVym3GK7Jq9cNgvS19G9A0kIOtQth0Bksvp3slKcmXj5sIG/8A+yCMI0be7+ja9GtSsAjNt00Y+GxU1s/xeIvrcIaQ91tzWwT9dOSbFJ4Mb8SqlHOdwu3MUkPnGATtXzPO8r1Z5PW6gwnQ2xN/p2p2wWAhNGBAVv1x4HsoQ88nw+0FCp/BU5NZT8CUez04FiZ35b5XT6L1Ocqqm9mJ8XkcXrBn9Gq43zKioOp5aDgY4wU9mq2jC9VrekP5zPgu6eV0iWIzpNrg1Iu9Bv0mokNLuWzI6qfvGCXVekM9keG0I9qtdECbWLOn8p8GFuZIuDUWtt1jnH+Lv5VtAFd+tJawqJsPjHMjrGrYP8lsc//6sCbo3wUr28+4xwpac2GZYiWoI1blaL2p9Z7tka6M6sfDhz/aEIoy2nQywe+k85qD7YugpauCmvxOs2LjWIEsHIJqe+vYP/rbsZbMAWWz5vMn/2I/cDv3OgsmpftbhZ5WJC5D/A5e3OrhMHnAcU1FmHv5z/HMo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m02ymvECko7baPjDRafnMli1g4F4SBfdIsSbpxbhUruITvPc/YDwWse7OTcH?=
 =?us-ascii?Q?mrIo3t2iQSO1NouBvsGUAUk9+GYw/rmrjuVhn0H+42V+K1Z9nqPGJufci7ez?=
 =?us-ascii?Q?TzqSLvinNBUVqfoMTImWjCSy4C4Kik327FaX617RP0CTjhwC5jASIn0k+nnT?=
 =?us-ascii?Q?YT9D0FSn8Lxvb6i/8ggMJyMqfIp8stxePFU4m32+QSJatRk9pXx/lKZGiq+w?=
 =?us-ascii?Q?mok8Q8CW+7IWyTQvvdxStgXyHwhf/+xt79f3tlKaEWtUYAR22beLlAVBgbXE?=
 =?us-ascii?Q?Xvxj4+BqW0vrUkYvkpYQFjbQYjb46JD2ae2mIwkEshHitfUfquHfGnSHS9eg?=
 =?us-ascii?Q?GOyHZxx/dljyOI+VK1BBpa2ufMn8Xuukqo9fF2D8WjqtcLNIRmdJ9l3BTxpb?=
 =?us-ascii?Q?IFfKpt2uVjGZEcQ8Ozpye94t8vhUZMINqjiEGsY45DkJG2KtCROxlZNdqVRV?=
 =?us-ascii?Q?qW9mHoSQRUkh9CUYhpwJD2Eowieh+ZhWsPWoC9hhimvVgv9auGN3ii68Ru90?=
 =?us-ascii?Q?1l3wW1PoyvStHHU57wJW0vwPaBAyQmSmejMUF5ZndZxsKq2VngpIPOjsO8Aq?=
 =?us-ascii?Q?H96AEKZkx/nUxF1sRWJQaeYrPQqKie3SNOgADtFNchFSyF+VdbDm8bPH6ie/?=
 =?us-ascii?Q?cvpoMLEDKIQwxiSOloxZla7ggIAihh3wtQjkIAg5mvNdyHwEpi2ghRR3/UfZ?=
 =?us-ascii?Q?RZusESWk1Zz58JklmrV2+uTK+q17QTzIDbSOta7fYskCRosZv7il4FT2Hu1+?=
 =?us-ascii?Q?Mnzzw9Wy36H0eI7D70bcR+VgJMRZihErQNLkzO+dwcO62rMCBb9ZPpoQwCWZ?=
 =?us-ascii?Q?YsOrAtEQ4x1WvLNf+5tSo7cNtOUYBKPrziqhi7sAyM7p7zvQ94WLcBS4Juzg?=
 =?us-ascii?Q?Yig4xCMnpWs2EiLHZISOKNogVGyYg+/ozIoynWEofXBx4YYDDQbYfyjM1Hdb?=
 =?us-ascii?Q?l6Hfq/4XS4MFk7cjyfqhVYAwpYihl13JzAGan7IACiE7wFt9BksCfDS6Awff?=
 =?us-ascii?Q?QocVw+1lPCdYoLXXJdl4d2/rximv1o1jBaxS9IbBATEqxdP4KnW2jO2zQN2i?=
 =?us-ascii?Q?vSf13H5YG7uiuY/si7Fee69/KRMBHaGD+Vq0+7UPpL64cpVxay8bvJ1YSqje?=
 =?us-ascii?Q?ALP/rqhU+3dM4U2sL6RCa/vpNTmH/pvXnrVdyWeRwdhRT5mb4Yc+jF7bbFF6?=
 =?us-ascii?Q?NKiiTFJntJewhmmEm/NDERYHhPf92JiWx7m5A5TiGYkmHaRAHZhk7yerQEHs?=
 =?us-ascii?Q?2cRCwuTi4wtmWScgVYMBfW0O7EbSFWkGQEZJI0rm6ZvKB2i19GgYUG2EdgvN?=
 =?us-ascii?Q?li6HcsEPd98S9Sdw7vRp7jxrhhmVPcg4UohB20A6EDds8cRuBR5IxYrWhP5/?=
 =?us-ascii?Q?htOnm8hFpI5I3HPLEfTemio3/SZg0jnJYLdehemig3VQ51HCCps0LQD33fIS?=
 =?us-ascii?Q?WwpYste/DK9jialJEd0TZdXggL1M2IWIezXp/xMZ9yogQhG8b7eROLKd60Rv?=
 =?us-ascii?Q?/pcYhRiw1+QFxbuUI82QiqTSq1vansgrQCTs6/YLFGT/09Ou07XZsGQDaOvm?=
 =?us-ascii?Q?fxPVZMbLi1JDEs7zJabN2gzpoSADQMxJ3DlkJKnoaXCspCaYX9qICUXhQOfH?=
 =?us-ascii?Q?g0bXh/N2WFFFr18wNSLkN1g0riq4draTMKHFMSDJ4F5BX/Swi+Ux4K05siwQ?=
 =?us-ascii?Q?QV2nBPGDLO54OrBbzbbW8oSftPjuAyw6lb08zyh2IJi+/Eqjcq7eGC7oc3bk?=
 =?us-ascii?Q?xA9VCE5u9Q=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 484a5424-fbf5-4479-1b04-08de83e7687d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 05:38:26.0375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4MZ9TipQUsywU6yxACA5zsJKnxyzOOUbZy8gDS5xIWZpGxkluP1p/CYvCVvV92LNYbuA0L1m+etkv18EA17T2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8426
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6228-lists,linux-rtc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 992DC2A405D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krzysztof,

On Mon, Mar 16, 2026 at 03:49:46PM +0100, Krzysztof Kozlowski wrote:
>On 16/03/2026 15:47, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>> 
>> Convert power-controller.txt to yaml format. Drop the example because
>> there is already one in regulator/active-semi,act8846.yaml.
>> 
>> +properties:
>> +  system-power-controller:
>> +    type: boolean
>> +    description:
>> +      Indicates that this device can be used to control the system power.
>
>Just like it was in case of other core properties, I think this should
>go to dtschema.

Thanks for giving a look. I just submited a PR
https://github.com/devicetree-org/dt-schema/pull/187

Thanks,
Peng

>
>Best regards,
>Krzysztof
>

