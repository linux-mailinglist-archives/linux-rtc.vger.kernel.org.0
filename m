Return-Path: <linux-rtc+bounces-2493-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E81E9C400C
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 15:00:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E17BA280EB4
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 14:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977B419E98E;
	Mon, 11 Nov 2024 13:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jv4xxbcs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2069.outbound.protection.outlook.com [40.107.21.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B2D19E97B;
	Mon, 11 Nov 2024 13:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731333592; cv=fail; b=MMntFUUa7s9aMo3j9AixprewTWd6lLij7FNTSfJEChc5pBzC64mvQ2+R0x0GXkDbzZsYVTYMlzboSPCugmxZSQDO4hquqer65XYGG++m00xK997jNaTn0nyWWkXKRteX0aboYT8D5E8XM9G3fJxS9CmLFF7yUM8SFTczpZ7BzvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731333592; c=relaxed/simple;
	bh=Ge+c8l39iKSoEZNRMHaXdEYvqwUhMwQQMkPBxcn3Hck=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=iZWSEZnjPX5PVtmq6WWbRlCbBkGRTBz3w94UFbKVnc1d10ztHtPNtqg/Vh3VVF8ykLIgDlSFfKDbEHE8CmltczKNWI+2F/6gKawzxHoEo4OWEdxOc3OfXWCK/+XGR5OvHOl9RqR3RUHNJtCQKsqCm7viEsTiUAwyN0hPKOW5vnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jv4xxbcs; arc=fail smtp.client-ip=40.107.21.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U99YCVeQKRjouFF3tbM5UNZuERPIo4Rj0s1Zwn1kNjoYuvEx/iT65N2CJjX1Fump0C0metiCoH6Syp6CFVuLjWuQFaUu57bHupwJaHIY3FTleJ1HcoAp+aoj+WQq/LGscCWQVdW5WO9JELKS7qH+xA0QrkpVksiuvUlXw0LDwiRaErC7mQIiFXgDABExycTTtjkUnOt0KQvSmlzH2YQc6DiJc/lSXhKttg1C2pp5GXmh7t97OnpBN0+rS/4fTnbLyb66WUH3q/FTgSCnV61/tnUbwfDKEiw8FzR//fb4FrwoqIw4GOnPakdumgli4xm1j8SyAb3VCnmfKQaQMkZwDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFqvOb0kafaQ/Rsqw3OiEgc3aZ5ogr0Z497eTktMCCM=;
 b=Y+jlrfcpB0gYgT2kBQvjc5CaEQaXxvAbuau3cr/XLFv2OHI+br31QrBMYUxwbNj1Yc6+aYr/dOI61qpdXJQDO9tlCCeRDlI2HgqK4bS9dNOZAa3p1I2NdOV0LYZrCGWY2zqpVPEk9Oa9KY7E5AFycrPH5WlWkqQpgwkv48F8B9u3JIJp6OC7DXqx+46EWdJNsXx3OL2peIO7RbegulVRHZDJjX9g6/Uh6rlkihY4teVVS4yfHqzf0v/ob2hCOWh7gg/uuGffy7SBLM4h6V1MyrXH92feA9d0KKoxJ7P3fyw4E88yd7gtrlMRFC3U9kVn9YNgoWWAI4Juq7Bj2MpQcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFqvOb0kafaQ/Rsqw3OiEgc3aZ5ogr0Z497eTktMCCM=;
 b=jv4xxbcsL7cqmwsBVBSQgyI5PEJmUrfnIZTtXmZ6HT+cuZ/nGJrDow8KmNJnrVmP2mvC5OHhmputF178xjTe38pHYaiwkVGQhBxtpY1KZK9UfnNVgvOj6WbDpKs9Nif/jBpATjTX6xf3SpRklvQcPZVAQGxFtwMrtKSGpQeGD2VIf1AqLBKNp1ECFnGJBVughhJbbjQq88FrHG4RSc297c8AY6hpzclMt1Xv6yaaNgP2ujuJ+K4icK57dAnFo9DbqVRbwq8/NJlZyDsQBF46bR50s9GBO5ddPAavgt5ccrx+4+5jzOclUBQr925BY9/USvxIWNjWmBTNzMU5IYCtVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by GVXPR04MB9927.eurprd04.prod.outlook.com (2603:10a6:150:118::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 13:59:44 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8137.018; Mon, 11 Nov 2024
 13:59:43 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v4 0/4] add NXP RTC driver support for S32G2/S32G3 SoCs
Date: Mon, 11 Nov 2024 15:59:36 +0200
Message-ID: <20241111135940.2534034-1-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P195CA0004.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::19) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|GVXPR04MB9927:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a5bad70-fca3-4ae3-a40b-08dd02591804
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0Z5VGJXSmhUSXhlbDNnMThZTnB1YmJxTUFEY1d3Qk9LNzRKc2pGcTZLOVlP?=
 =?utf-8?B?c0tWTkRHUHB4MldCc25RRkF4bHI0ZVRuL0xhQUtGbFFlekQ3dHNKSVJ3MUVI?=
 =?utf-8?B?TWtUTmZ3dHF5VXdManRrdGIxYzlsN1cxWGs3RzFvcHhEcGZvUVQ1UjF6L0Q1?=
 =?utf-8?B?bnVBK0ZKZ0l4dmtBc2xYTjh1ZHNPRmN6amY2elJTckEzZjJuZStmWDFpNkNS?=
 =?utf-8?B?aVV2V2k5OElTNzVyNU9lakRPYVlEVStSVEtTdW5ZY21yVU9RRU9YOEpSK1py?=
 =?utf-8?B?djIvNWVCaU5Ba3V4YUlvZnorbDdOZS9aR0Izc3FlUGxVNlIxRVIrRWJKVDl5?=
 =?utf-8?B?SlNMOUlyTFdlY1lOSUdpSEJxWHh1NU9tY0I2VWtQemw2MUlzL1FvTFh5MHVB?=
 =?utf-8?B?dnJqeTlDak9tSlhFVnlIdTVQMjd2TFNmRm1GYzN0RmlwQkM2V2RJcnVvcHc2?=
 =?utf-8?B?UlFOdmtjcytDM01aMWwyRlpDSytOS2tGbHFJQll2M0VKdkJWUEthWTVWaVdM?=
 =?utf-8?B?dmZjMVNETG1CMUxiMkRxWWlYekhEMExzQTJzcWJhbk5CU3NRbFVpRGk3enJH?=
 =?utf-8?B?R3dXYUJib2NpVFY5VzI2MUJyWjVSWCt4RDFDcUZlbC9UdVo4eG5sMHN3c252?=
 =?utf-8?B?c2oyOUpRa05DdFZNekFIdVo1ai8zbG1RMU44Ky9XcWR1TklxNUVoOHJpQi8v?=
 =?utf-8?B?ditkanFtSEVRdTEzeVBwd3FUMXZnSkJDTnd6bGhsS3Z6eHVUZlNkb0hUd3E2?=
 =?utf-8?B?RzZuays3blJ6RTdDRHd6cG1XbnJnTnRBVVViUUFNYzlsdEtIdlJPbDdkVnk1?=
 =?utf-8?B?RmE3ZzE5ZXlPQTdZVWpWT3ZIMGFIZTVXZHp0MyswZkxXWlZCYUhES2Z5Tm5u?=
 =?utf-8?B?NXdNR0FrUW5uVWtDYUF0QUd1VkVuWXRWR1RidGUzV3pibVdaMzdoNmZ1T2lW?=
 =?utf-8?B?U3VHSmpZQmtMTGNyME5hRDg0aTdTY0dyK05yV1JFdUgwNjkxZ1RQUmtDMXNa?=
 =?utf-8?B?ZXpKMFl5MndoUWx5dXl6bEtuakJrRy9tNmJSbW5IUTdEdjQyaU4xQm5IaExp?=
 =?utf-8?B?R1BnR29FNXpKVDhQWTFCeTBnclVpSEdzdnpWdVZsWjZqQlZHeUxOU3VURERQ?=
 =?utf-8?B?US9ZdDhFQ1JRRHduZGxWVUhleTlRUTNsMWdwYW1iVmVsVkNVZFlCT0lCeSsy?=
 =?utf-8?B?SHpYVS8rZlhtTzA4R3VzeE5HSzV3aFE0WUVpbURDcGN5NEpabGVVSE9UTExu?=
 =?utf-8?B?b0NIQ2M0LzVYUkdnS28rajgycGpyVUd1SzM0eVh4ZlNSNnMwTFhSRFRKdTZo?=
 =?utf-8?B?Rm1GTWJKREFOUWJIb1JMVS9mK3FkMWJkVnlaQURwNnJMU3dZL3hSZkpRMC8x?=
 =?utf-8?B?cmlTS0lVbHBNT0NpV3Z2NVpnNmkyQms5T0VrU2M4czVqdmpOd0pKV2tlNGNC?=
 =?utf-8?B?TVBEckt5VVpzTzJ4MTA3VXZJSzJOeVd1MWJZYmRNMEVSNEN3RXc4R0YxYkR0?=
 =?utf-8?B?YTU0MDRhMXkrSkttNTl3TlIvTFVacThIVEZiemMrdmdwMVlTc2RsVm9uVmhh?=
 =?utf-8?B?WElmMlJyaWVZZnQ0QmxjbU5pM2h5UVpFR1l4aXREaE4yeWgrMUhPNFRqWUp1?=
 =?utf-8?B?SEZJcmVkS2pVR3VBcWlJOVQwbjJKRFVGcTN4by95L3lad3A5QXVPMEVFdXpK?=
 =?utf-8?B?RnY3RHZyaVJZeEVzNWdkYnFnakFxQlRoeW1XYThuLzA4REs4aThHZ3dUN3ho?=
 =?utf-8?Q?zv0Q06WytoaEy6j6D8KS5BZ/+pFgEe0T0RNi/0M?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVVCeXhITk96VDNSRFdpaVVRVXBJQ0xKM01tWEo5TGdZZU45cU0rSmNjbmhr?=
 =?utf-8?B?R0xHOXM2OFlkeks3aHBVK2d4R1FKaU96MWFDSWVVWVpRYlVua2ptUEFWakw3?=
 =?utf-8?B?TExWTnlhSjhtZnJiTnF1Qm0zczBxa2tJSExvZWJYbERKYkZzamw3Ym41NEkx?=
 =?utf-8?B?c2YyNHN6VnZHZ0ZiNWc1QnhtZGtBc2g4Y2dpQjNCaDBTMi9lbEY0N1JmMkN3?=
 =?utf-8?B?cWpBenl6dHNpVE1lWlFQTGdENm9GemFSYkIvOTVyVVlFWVh2cXZGYXRVSCtZ?=
 =?utf-8?B?UkJKQUZPSlNEaEVsL0NpQ21Ic3M2bllqdmRzcm5yVjFsTXNGdUlEMGF4dkVs?=
 =?utf-8?B?QnJVeDJiTmdrSEpJV2pUaDY5ZlhudXQ0WjNrb2prWk9JUzIwNFpDSXZZYVZu?=
 =?utf-8?B?c0hlVjVVWlBsaWNhK2pCclFjdUlNV3FaTnZZbHU3RWIxbi9LN3FiVDU0OVpH?=
 =?utf-8?B?UUJxSEcrbnZ4K0hXMEJJSGo2b3JHdlB2dDBDcVZRUVZHazFTY1lNTGl2ZDZa?=
 =?utf-8?B?NkVKeUVvSzRYNG42VFRpYmxYRjg4NjdNU1NkZTBvSDZ5eTYreThIZmxCdCtU?=
 =?utf-8?B?SE1vcXkyc215YkNNcURmSTVyRG0vQXZxYi91RUdFSnNGWWw2QzBOVHBPYys3?=
 =?utf-8?B?bFdkNWRVZjRpRHpDZjRHeUFrL2lqWHNrQ1d6WDRSWm5zMzhaM0pHSHo5RHVT?=
 =?utf-8?B?OWNUOS8zMEdGSmh4eVdYaXFqZXF6bnUxTlNSRC9SWVZMWkdWVXRqVTR0WFdv?=
 =?utf-8?B?WEQyNGtCZ1d2VDJaK3BiTHpTaUpVQ3FJblpmaC9CbnQ5MXl2bzcza01aRG5D?=
 =?utf-8?B?UDJLR3ZhVldES2tjb1JZOHRrY2NBalk0S1ZuOUdhUmw5UGpkRmlmekREcS9w?=
 =?utf-8?B?MnRaK1BTd3ZKVkFQSlV5enlmRFJ5eVp3U1hWMTVHMXdYRHdsQmxwQ2luMjRM?=
 =?utf-8?B?UFh2UUtkQ1F1MFBmQ1dBT1JDdUh4WUpxN2p2R1MyUjhGa1BjeklLcXJMWUkr?=
 =?utf-8?B?TkxObnlhdjZ2ZGViNTVZUnAyM081QnBBN0ZSUW1rcy9SUWtHbnNFYlJ3MUxC?=
 =?utf-8?B?TDB4WEJsMHN0NkJoRTBZSmQrSDBvQlJaME1FUzgvc3lnZXV0ZXJtUEhBWVFR?=
 =?utf-8?B?YWxIRVRWcXFJV01qREhmbWFmU2ZnWk8ycnU5NzRNQVU4T0poRmFOMWtvaVRX?=
 =?utf-8?B?NDBWa3pRT0tJOHcrZ2tUcWZid1luaHdjTnhCVUFmeURTTmttTUpDdm9UYlpY?=
 =?utf-8?B?TlFNd2ZFL28yeHN1THlZMDhXeEIzRmcvN25Jb1FhbmUwb1c2TEFWaVdQMU4y?=
 =?utf-8?B?aThlZ2lXTEEvek53cHQ4RGNvRFp0cXJqcDNmWnp3aE9zR29XbHdpNUVpWHpv?=
 =?utf-8?B?MDhjaXNDRHp0QlZrVG1qNFZLVktYbmxNeHJnRFdOY0JidGVHTGRYdUZQZ1hW?=
 =?utf-8?B?QnNUUndLb0hsRmlHVzk2K2sySUVUVUd0NTY4MXdBQkd4Q2NJSXo2SUcyMWpF?=
 =?utf-8?B?SzhSbkRlREI2TTg0aXZJa0pvVWUxRUMwMXJmZjFnQ2xIUTIyYzFYOG1ybXVz?=
 =?utf-8?B?NmpKZXdSTlFuNDlDQmlkMlJtekFZN0VmYzBKNnZZNTd2V0xpSm9Fc2ZVRDcv?=
 =?utf-8?B?c2RlUGhPR2F0NVN2S1ZLQmpKUVhTcjdZci9yMmkwTWdjNHNiZjlGeXp3dmlq?=
 =?utf-8?B?aEhhanJ3RFhjSlI2akUvYnVKeVFocERRTElVM3NtcG9lRUpwSFRRS2ZQbk1T?=
 =?utf-8?B?dS9sUENPalplYjJUZHhTNlNxZmZOSDVGL0V4NDMyV3YrTEdTTkpWSWxMaTlK?=
 =?utf-8?B?Um1MbDNiWHNLbVNmQmVhWTlzUDUrU3BDS01YUFVKM05jNHpNaFdnMUVsNXpO?=
 =?utf-8?B?bm5sU2NZbVFNY3NLczE5STZEVXAzV0FaMXNJc3RaNkk5SmUvS2l4ZWJucnVE?=
 =?utf-8?B?bmlMUHBZbGhLMFNKZ3dDblRzR1pRYUNUWjFvNjBjVUtLdkg5T05vTnkydmNE?=
 =?utf-8?B?TGk4bllqbloyRjNpVFl6Ukc1NlNkdytySkN6NmdyUVRsNEp3REk1ZXZGNjZz?=
 =?utf-8?B?dGdiVUhHbGh4YThuL2pKVC9aaGpnYU9leVBBN2xST3RQREtjQzlDSGVBRU84?=
 =?utf-8?B?eGVwTmpBUGJTeEQydTVGR09xc00ydHR4YVhGRzZCUjJRRjhYRmM1NE8rZEF3?=
 =?utf-8?B?Vnc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a5bad70-fca3-4ae3-a40b-08dd02591804
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 13:59:43.7786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJUh9mf+sNs4gharQODyLXPaob9fBCsYmrz/kr8y66a31kK1sEhDmw3mf3wYkIf97fKQqGhdmrXQc+/JmGtbTOS4I+64mOrys8sxZEuB64s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9927

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

This patch series add support for the NXP
RTC hardware module present on S32G2/S32G3 SoCs.

The RTC module is used to enable Suspend to RAM (STR) support.
RTC tracks clock time during system suspend. It represents a
time-based wakeup source for the S32G2/S32G3 SoCs.

RTC is not battery-powered and it is not kept alive during
system reset.

Following is an example of Suspend to RAM trigger on
S32G2/S32G3 SoCs, using userspace tools such as rtcwake:
# rtcwake -s 2 -m mem
# rtcwake: assuming RTC uses UTC ...
# rtcwake: wakeup from "mem" using /dev/rtc0 at Wed Feb  6 06:28:36 2036
#

Changes in V4:
- Dropped 'assigned-*' clock management approach.
  Simplified RTC Runtime and Suspend/Standby clock configuration.
- Simplified error paths on probe function
- Removed node label from bindings example
- Several cosmetic coding style fixes

Changes in V3:
- Removed 'nxp,s32g3-rtc' compatible string
- Change to 'remove' callback from 'remove_new'
- Used 'dev.parent' from 'struct rtc_device' instead of
  defining a specific 'struct device' in driver data
- Fixed several errors reported by kernel test robot
- Removed 'assigned-clocks', 'assigned-clock-parents' and
  'assigned-clock-rates' from required properties in the
  binding documentation.
- Refactored S32G RTC driver such that a default clock source
  and divisors configuration will be applied in case 'assigned-clocks'
  and 'assigned-clock-parents' properties are missing.

Changes in V2:
- Removed 'clksel' support from dts bindings.
  Used clock parents support from CCF to better illustrate the
  RTC hardware IP from S32G2/S32G3.
- Removed frequency dividers support from dts bindings.
  Used assigned clock frequencies support from CCF instead.
- Reduced the interval while RTC is voluntarily disabled to a simple
  register write in order to avoid any race condition between a possbile
  rollover and 'suspend' callback execution flow.
- Updated bindings documentation with respect to clocking support.
- Fixed a potential unused variable warning reported
  by kernel test robot.
- Updated to usage of 'devm_rtc_allocate_device' and 'devm_rtc_register_device'
  instead of deprecated 'devm_rtc_device_register'.

Ciprian Marian Costea (4):
  dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
  rtc: s32g: add NXP S32G2/S32G3 SoC support
  arm64: defconfig: add S32G RTC module support
  MAINTAINERS: add NXP S32G RTC driver

 .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml |  78 ++
 MAINTAINERS                                   |   2 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/rtc/Kconfig                           |  11 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-s32g.c                        | 692 ++++++++++++++++++
 6 files changed, 785 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
 create mode 100644 drivers/rtc/rtc-s32g.c

-- 
2.45.2


