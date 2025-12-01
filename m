Return-Path: <linux-rtc+bounces-5498-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 55660C97665
	for <lists+linux-rtc@lfdr.de>; Mon, 01 Dec 2025 13:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9E0DF345C63
	for <lists+linux-rtc@lfdr.de>; Mon,  1 Dec 2025 12:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3639F311C31;
	Mon,  1 Dec 2025 12:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="wK6Cr0/F"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022083.outbound.protection.outlook.com [52.101.66.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2D830F553;
	Mon,  1 Dec 2025 12:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764593459; cv=fail; b=mCo49O9QHioPmcuaURneBTzPwzYoWiLLb/+BshV5QfIVecx37Lk0HparoXZ4OLAGQpwYhRHaQH0pp/E4/y4N/8sg1GmL4sS/Tz7RVDbjsCcG+EwXWMg6JbOks0oqcBNQ8ZeK6vA6YJLycLQkutypxyVhkE5/A0puzGT6sKVfnDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764593459; c=relaxed/simple;
	bh=e8cXtb002MG5vq/LNTbuNN4l2v6hlzA2cpgm4Hnaf7A=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ugU+kohZ/ncmJQL/qQWk0KiYSc1AiFVdRG3g1CQKCcvOmw17jhmr7iAzp9Yx0Mn49zwIAbdsmrTFjBYj0iqXrNsloaPIyGZPRfJsF8fMwVgZF3yF3+K0UFnGEHsGSRjgM4wVMVdwsJp+3xKxDF4V9OQtnajfMcwryf+vAQ4Med0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=wK6Cr0/F; arc=fail smtp.client-ip=52.101.66.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eIJ1r6sXi2qeLO5iu9Ijx9WK2mqK67/VOZ8kMlF9CXbKK0PllVeDKezpjDQWj9CHqFD1RbeH8uOQl9zT/Txm61udxwsx5QAdEax7n8yjXXPocmbAOr/YoJVQjdjT08iv1BrEKSlESSGos7rChCd5Mx5G3bNeIuEDqkbqsgPd8w68PellLUGiVRE8JiiUYCSIqxwAC36daySy+iNSPoz0XuXabjRtUSFO4+e58djaRgQr74j78QPdCEoq86buc0SHbsk3j6ePZNqCFWWwhNBHtEepvCjWm/On8ZCCy2hQn7GmGjG03+T/huauK/VAxepL/7OKuMsexAGcIx2JfbBKdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOEdUKjwg/Urlm5Zz+LxXXwVtWbdnpLiVnTvlC8INmM=;
 b=H/r8/mPmNWfOnbAdUfDYJB3YlGLZ1rQ4Dx18NiwHZ/CjXXd+RAxX3gYNAKSjDDozvYEjioJ8GM7a0oBayPU1plbO/8w+dlENiay8Uh3ldC3Wu6IVYdjK4Xjx54rLEHdV49wxlfAAAViUvsu5sknJ6w3yFatNi+i+TqVRW6vVpIwv0d6ry2c+W0HFQ4GukwR3CfhlIUtMf6b8zIV78Lgjz4n4qafpmEshUrW3p8n0hzPlVbSp8pFTT7lUqqmcUqcTkoP0KjfdHrMT4uS9xIo5MGKWTxYjqeg3+v1cpDWwJ7q9tR6QNsyKKwtbNWdUjBKqHxIRjFOfh986+V1J94W8jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOEdUKjwg/Urlm5Zz+LxXXwVtWbdnpLiVnTvlC8INmM=;
 b=wK6Cr0/Fuy0uzypGPnzTl9Y948AToDNdZsPLx8vKlxkcirjlbXYeZc4eQSXt8Hk8hQGPu1b77sKomrmgmqbCSB4oe/N0pBBs7FQu21w6lnrXwBSaH+Msm2hTDLtZ6JIV6AAcx4/mFQMTB6eXh24w1jRS2nvX1KZawkvNeiRjW9SWU4fsN7D0tLKprLZvkgKr301XJciWUcAGL7t8gO4G8Emd/jll+YCF5cLx3gWL+e7iTImt2VwIkypEwG19Jm7Zf1Kb8dRUekZWRuEl1HdQHBBZhz/M53Rs60RVT7tzT2zWg7TDzRS0BRQkW9TQOpXg51hWy5q3ODevgMnUeXc3bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by DU4PR06MB10410.eurprd06.prod.outlook.com (2603:10a6:10:61d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 12:50:42 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 12:50:42 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
Date: Mon, 01 Dec 2025 12:50:27 +0000
Subject: [PATCH 2/4] rtc: zynqmp: rework read_offset
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-zynqmp-rtc-updates-v1-2-33875c1e385b@vaisala.com>
References: <20251201-zynqmp-rtc-updates-v1-0-33875c1e385b@vaisala.com>
In-Reply-To: <20251201-zynqmp-rtc-updates-v1-0-33875c1e385b@vaisala.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tomas Melin <tomas.melin@vaisala.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764593441; l=1974;
 i=tomas.melin@vaisala.com; s=20251125; h=from:subject:message-id;
 bh=e8cXtb002MG5vq/LNTbuNN4l2v6hlzA2cpgm4Hnaf7A=;
 b=rnhwketjSRYpxO2xjr6prEn4jJ5tpnjnVsoPdzOqW7JQBcqPujJh6WPUz1zskL4qx8GBQsmVP
 acfh7M0J7nCDkOIJdiscMbK3qnIUsJwiy9mVb13QCGGdl6p74VnyScP
X-Developer-Key: i=tomas.melin@vaisala.com; a=ed25519;
 pk=6lMiecjZ+OeyZuxYsDm/ADy9D1JKvYrKdsYv58PMepU=
X-ClientProxiedBy: GVX0EPF0001A050.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::49f) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|DU4PR06MB10410:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e1f93ee-7021-4b71-78a2-08de30d83ccc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0dLTnBqc0N6RDVYVUtqV1d1c25DdGFjbjBkM0NxZ0w1THBQOW5HYnZXVnRC?=
 =?utf-8?B?SjdRS0VjWkdGa2o4WUNpZkU1VFN2T2liVXJhay9VVXROdE9TRzNjeXo4U0E4?=
 =?utf-8?B?TUkwbzBONFhxMWJBaUZRdDlhWFNOMFV3bXNiNFZ6SVlRcUlJeUtIcVNsK052?=
 =?utf-8?B?N0JESmRxK1RZOGkraGtrWDc3ejR1dDVSQ2lJb3JpdDZuaWh6RUx1S0M2ay9S?=
 =?utf-8?B?QlVBdkZmemZ5bzlLTmlUQXQ1ajBsR2h3bG00VTkrT0xRUkJsWG5GV0tiZ0JV?=
 =?utf-8?B?RitHc1EwNTVLclMwUVE0MkNVV3A5Q2xobnF3QmlaWXMwMkRCclZPaFBlSUhh?=
 =?utf-8?B?NzlTOXRIZTMwOWliMms2TDMzVjVzOXJqNzM2N1Q2RjFtOHRlQUdzWDVwWEhR?=
 =?utf-8?B?OEt5S3ZBTkNIUFlHM25NRXlkbjVLY2c3KzVPVnpsdmVwNFdhQWRzSjdseDZR?=
 =?utf-8?B?bldKNDUrai9RVTZ5Smx4d242RmUzTzVOZ2VpVGtqNkpEOUt3QitXNnMvZldT?=
 =?utf-8?B?TFVKOFVtUGFyVytWK2ZjVTc0b0ZxUlNZSjVYQUV0V0piQ0lFV01tNGNqTmho?=
 =?utf-8?B?VWNyNU9ndERuMkJmVHNibG9BelN3S0NQcU56V0gzKzE5UjhpK2RuZVdyZ1pp?=
 =?utf-8?B?c1Z3bXJwNHBsTFdpODViSVB5bFc0bForekx5STh5TThCSzErNTZrM21TVGU4?=
 =?utf-8?B?NWZpY1JZYVZvUjFTOXgrS2IvOGlYTHA2ZTNUZGpZOTlBTkVad0tOZnoyQmIv?=
 =?utf-8?B?U2Z3K1VQYUJuV2c3d2NlVjNJaW5UNXF2YlhUR09vdWZmbEtNaEJydmVaZFAv?=
 =?utf-8?B?M2hxVng3NmJZM2ZENS9ya2h2WW1peHdnUGlhSkQ2MEVobnJhWWlCRk5wZmoy?=
 =?utf-8?B?aFVIQVcwYVRlc000NDBENGsyOG43ak5DVHVEZXU3RjdQZTZxUndvWVlNNTJT?=
 =?utf-8?B?UlJiUTF2K0tzalFhVDRFQ045OGIxdFg1c2lnZ1dVVzhpclRuVE4xcHZidDhO?=
 =?utf-8?B?eXpBM1VFVVdRMUE2WWpGTkw0MklUSjJlTWZobGEwNmpXMkNMdmg1MGpzalg2?=
 =?utf-8?B?UGl0Mm1lb1FXZjlKNi9iS3lVSWNqRkcrNE9LUUUwUG1iUm1sWmRudlhuSm9q?=
 =?utf-8?B?R0hRZW9WN0FtdVhZWjczakRJMG1rSDBJQUtXOWtXTVgrRFkvWlhQUHBhamFw?=
 =?utf-8?B?V0VZdFNKVy9neEVRc1gxWU9qcFFzMk9kTFhGb1FCYkJQaXFiaERuQVFPdzZj?=
 =?utf-8?B?dC8xSjUwS0RRdll5VjJyQ0M2bUs5Q1BQbFZzWGRJdG1BdlFWSENMSHBoUDVG?=
 =?utf-8?B?bk4xTjk3TmFNR2NreWhWS3JIRTY2UXN3ajM4K3huRDhhbGdZT3p2a1lKdkRO?=
 =?utf-8?B?R1paTXRxZ0RBYit2Q3VkODh3NEFuT3lYWkppc1QwZVpaMmxHZ1FlRi9mWW1N?=
 =?utf-8?B?NmtUaG9jb0dzTkQ2LzJXNGhpLzNTL0ttTlhWRThkMXlNUGZjMDNuV2g1TG9V?=
 =?utf-8?B?OThEWjBVQitVci9lNHNDNEgxT3J1Z3pNelBFOFRtZldRcno5YmpwMzh6bzFH?=
 =?utf-8?B?eUh3d3BJOE5rbE11Q0NKdWZFa21vZkFyc3ovUTBBSVpGeVhSUXdUTVFmV2Z0?=
 =?utf-8?B?VXQvdGhKOVVpYmRlWGIzMmZRbDBZQW1qRUhzaTBtcWhPLzQ1U014NkhxajI4?=
 =?utf-8?B?ZVZ1MG9xdnIrd2syQks4S1BGNFNaMzBvQU84T3A1OG9xY1RNZ1BGMUphYVk3?=
 =?utf-8?B?MFUyZEVlTis5bnd4elM5QWRkdWNKRGFzU1h4OFVRTWplL1pHOFRVZnM1SzlH?=
 =?utf-8?B?cTVqS0ZHY2N0ZGp5VWE0QlFxZ2JjRWduZkJMN1BETnVwN2EySGcwY2tLc2hZ?=
 =?utf-8?B?N0NlcGNGZUV5by9xK3ZpTncxaDBTOWpXSzhsTUFQa2NUVHY5T0tlNjhpOStY?=
 =?utf-8?B?anZHRTJaUExHT01SWGxrcW9QYmtHSFJ5SXl3OHZ4ekFTSTQ2NzhMT3ZHQnlj?=
 =?utf-8?B?ZzZTMHJnZ2VvYUIvUjZqSTM1KzZpRDhIL2RUUmRMbzBLVU1UNXhjd1k2OWxj?=
 =?utf-8?Q?UV7/L5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K25nSXBZMFprejhlRVZ2a0N4U2tiNURnN1NWR1lUU0lHRjlYZENEY2pYc0Mv?=
 =?utf-8?B?a1VLVnZZMms5SnJJbGUzbisvOHFwcHo2RjUwMTUyZmc4N3oybU90MTNHSFgr?=
 =?utf-8?B?WDZjb01JbFA4SVQwRUJEZnpPU2JVbllFUUtPV2RNN1luNW16MXFTRnA0c2dK?=
 =?utf-8?B?dnpRQ1N2ckpGQzE4Ri80RndtVHpmZ1pmNmV6anFLNDhCbkdBSXRXanZSSklF?=
 =?utf-8?B?RDlxRkpMa0hKS3FxQlRXeDhvVlpjUVF4NHlkR3M0TnUrRk9tYzZNaW10T0sr?=
 =?utf-8?B?bnpBMjZoMi9mR0hiaXFiYlB2WnZTbnkvQ0ZjU2x2cFRWMk1lbnVKZ3JjWkUr?=
 =?utf-8?B?OVk5VTd2eGk4TS81Rjh5em45SnE5TFd0QTVrTkFGSmg0ZGE1SmRuYlJVMllE?=
 =?utf-8?B?VVIvcGFyK2ZsZkNSdjgwcDRXWU1wUXRDRXNmT09tRGxYZmtROEVoYkVXMlhw?=
 =?utf-8?B?SEd3RkMzaTl5bUdYaFlxNjRUYlhWd3RiRFhJbWgwT1BHbm83aEJMOTRJRGJs?=
 =?utf-8?B?VDBuZFhEc0xsYTFRSFowU0VKWXlpMUdremdoQXFJZWVmL3JQNEw0YzVhSDZV?=
 =?utf-8?B?clZKdmZQaWF0YWxlTjllSTZwWldhaloraWFkRTN1TFRjMzdOd1h4a1VGTjNQ?=
 =?utf-8?B?bGNzTng3ZTMwWlhZeW0wVExnSUt6bkVGWm96WHFqaEZRNUl3bzdXMHE1QVhi?=
 =?utf-8?B?TDVuRHNGeFZVOFc1cTJ5RVhPTlRVQXhrR2xQcktCRHE4RFdxSW1qbGNGQWtP?=
 =?utf-8?B?VTlKbkpLVkRrWjBNTDVRZnJPSGhQU0dXVXBWVEswVmtXWlYrWmhGRGlLNEU5?=
 =?utf-8?B?aTlxbDAvUmdpazJxR0VZNzNIVmxOQXA2dGhYZVR4MWM5ODl2RS9RS3kyRmtr?=
 =?utf-8?B?dW1YVTZPQVR6aERDMXB6cVh2bVU1blRSZ3l3RlV4djZzTnR5cGhJejZiajd5?=
 =?utf-8?B?WVh4c2VLYUlwQ0I5c2dEWHB5dm9PSzdYWnJGK3g5anRBWjZnblN4UmhwbEJy?=
 =?utf-8?B?UjdObjdGVjdKeGNyTFVjeWd0a0x4bzJHUDZ5ZG5MTXYrSFZ2cjBxVU9QVGZi?=
 =?utf-8?B?VkRHY2RCSjlPSUxNS2RoMnBOenJUdENYOEJuMDBuYmZ2MDZhNUdpODZrUXU3?=
 =?utf-8?B?UXlLWW55ckJKNmRmL293bUJSWmdZWmpydmxseE8rSVBiVEVDVHlncUdDbGNE?=
 =?utf-8?B?Vzd6QVB3cFd4NEk1a21mK3lHbjFock1kY1RQRG9IM2llOHlsOTFEZWFUbTdQ?=
 =?utf-8?B?UXpIbFdPWmFQT1ZUS0RzalA2bVRyYzJpekdNQ1l5d2FvTkdibVRnM045bzlX?=
 =?utf-8?B?djJRcmhWSU00TGVyVitDMm1kOUlZd2JqbEZkY2cxbHZEUFpDcWN2MVhTNXFO?=
 =?utf-8?B?cDFpTXQ3RFoxWTFPRnhBL1puZ0RYOE1UVzh6U3AyUGF4Q2F3bmpRN0VvUWZZ?=
 =?utf-8?B?bnp2ckJMaEhqMHUxM29aNWxWMllhMG1TMHZJVlR6NDRBT1FsNURKdTNSTy9s?=
 =?utf-8?B?ZjZuaTlSbDRDb01vZTMvQTVBZFlScEhHenkzVTNHUzM5QzFRZ1ZOWVdSV2w0?=
 =?utf-8?B?YURJcVQwdlIxOS9OMmF3dlRmMjNjQXFZNmNaek1SSHB6TVdrb09lZnZSMmYr?=
 =?utf-8?B?SWhQbTF0YWcrbUJJOHFuTmJKZWdjeEg5V2V5UWhPQ1BkNWlya1FLOTc0eXdE?=
 =?utf-8?B?bk1qejVreC9tbEVVSWlhSEsxNGJ1QTNXV3ZBa1VFZ2JRZktOK1NHWnNQY3JY?=
 =?utf-8?B?ckhwNnYrMEZQV053T0xGOFZJMlNlQ1BaUG9lbUVESEVSdmliRmZjVVlhL1N0?=
 =?utf-8?B?dk1NK3FYcEZaOXJQWElPTlNDalZvSTA1SEwxVTBzMXR4bnhCYjhRaXAvbkt1?=
 =?utf-8?B?Z1JsRlh6VkErelozRXRpelVGdXNuUzJPN2E4WVNBYjNOQWdMdXZsU21qK1Zw?=
 =?utf-8?B?VnptcnkzUE02MjNWV2E4YlIyaTFMNzBtWW1ZTnNpTWRxbEFIYS90NkNyWUVU?=
 =?utf-8?B?bWFiWHMrbU9TSksvUjJpaVZjVzRoZ2FpKzJoYzFPMTFlVHRrRXlhbVhNK1Qr?=
 =?utf-8?B?Y3g4dmhVcmpNcEkzVHNpOXVkWjBWVnQ5ek9yKzJDYnZ2WUJoUlpVMUg3K081?=
 =?utf-8?B?Qm5HaCtsUW5MZUxoanN3ckJITVplWnR6UlJtdG9BSDJUbkFBRXpiWmRYRFlE?=
 =?utf-8?B?QUE9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e1f93ee-7021-4b71-78a2-08de30d83ccc
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 12:50:42.4903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X5RzAUC3/9rfDC4ySB8WVyjo9SwC+ZTLuKPnIbbXYYB6VKKr71jQKP9ae0KdduSZx8Wjw+p2nkahWZTM5oQuSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR06MB10410

read_offset() was using static frequency for determining
the tick offset. It was also using remainder from do_div()
operation as tick_mult value which caused the offset to be
incorrect.

At the same time, rework function to improve readability.

Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
 drivers/rtc/rtc-zynqmp.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index 856bc1678e7d31144f320ae9f75fc58c742a2a64..7af5f6f99538f961a53ff56bfc656c907611b900 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -178,21 +178,28 @@ static void xlnx_init_rtc(struct xlnx_rtc_dev *xrtcdev)
 static int xlnx_rtc_read_offset(struct device *dev, long *offset)
 {
 	struct xlnx_rtc_dev *xrtcdev = dev_get_drvdata(dev);
-	unsigned long long rtc_ppb = RTC_PPB;
-	unsigned int tick_mult = do_div(rtc_ppb, xrtcdev->freq);
-	unsigned int calibval;
+	unsigned int calibval, fract_data, fract_part;
+	int max_tick, tick_mult;
+	int freq = xrtcdev->freq;
 	long offset_val;
 
+	/* ticks to reach RTC_PPB */
+	tick_mult = DIV_ROUND_CLOSEST(RTC_PPB, freq);
+
 	calibval = readl(xrtcdev->reg_base + RTC_CALIB_RD);
 	/* Offset with seconds ticks */
-	offset_val = calibval & RTC_TICK_MASK;
-	offset_val = offset_val - RTC_CALIB_DEF;
-	offset_val = offset_val * tick_mult;
+	max_tick = calibval & RTC_TICK_MASK;
+	offset_val = max_tick - freq;
+	/* Convert to ppb */
+	offset_val *= tick_mult;
 
 	/* Offset with fractional ticks */
-	if (calibval & RTC_FR_EN)
-		offset_val += ((calibval & RTC_FR_MASK) >> RTC_FR_DATSHIFT)
-			* (tick_mult / RTC_FR_MAX_TICKS);
+	if (calibval & RTC_FR_EN) {
+		fract_data = (calibval & RTC_FR_MASK) >> RTC_FR_DATSHIFT;
+		fract_part = DIV_ROUND_UP(tick_mult, RTC_FR_MAX_TICKS);
+		offset_val += (fract_part * fract_data);
+	}
+
 	*offset = offset_val;
 
 	return 0;

-- 
2.47.3


