Return-Path: <linux-rtc+bounces-2674-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EB19E67A2
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Dec 2024 08:10:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 996A31885E1E
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Dec 2024 07:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6E91DEFFC;
	Fri,  6 Dec 2024 07:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gRJSCssT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2065.outbound.protection.outlook.com [40.107.22.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960E71DE2A3;
	Fri,  6 Dec 2024 07:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733469015; cv=fail; b=Vfoh3vSDU/XKJxdFemlM2G2uXKSgj7BysEkTvvO4j/egbsGtC3VElHh/eGauh2vFFmzsMEiLmS2OR/1rCUqSbnRSaQWHHOtLWFQ/4wVGw5mLE0tFJrlUO4QCbvnMpkTVwXKxacJcHwYbz5BThfKGehi6geJ1iZftUSSOiNz6x3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733469015; c=relaxed/simple;
	bh=Lncw9LsIxsUXUwSJpO9iKczYcqLXxomzMDil8Vvic2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=py4LoDkXm4ycafnPdOPgZTcpXXK+me+lgb+sQJnsEJXyYJ4Wy5khUEYlkJR5/2QcZ/slCPcOibMOmDlnm133+qs5N/8nnB/1nxvTn0sxBFcQ0PQAZhcTvYPkeYu2GZeVtqxd7wyhg7Hh2/SO7BxTZs0GAArC8OfNuPsmEo6JeR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gRJSCssT; arc=fail smtp.client-ip=40.107.22.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gC+ajNGlKwrILYhW1E2jSwzpkVCIuJ6d1K85ZycrsUFN2V5v6F9Zh0svAl5lv7RMxNXZ8N65E0hJ29/zNp3jIjo4uaIICppSO2IqNe3o0QQLGCuwinF55F6KlUf9tVLhjiH9MNOay+YHIiLJpz2IVEANK5yykCnMk+8pPTQfh5hfh7d76gEW0VgD8t2I271lpVDkZt3penasdwdxQuhB9+WdqX2hMM3S7a93MfLx6d3Nqu5xFQ7CUeJHL9H/h/u3kbPpmVUoGqu3AIMyoObOaxrtvm6dCfk4WoshFC8upLDdyBr7MThbxaOYLsNwds/kEKsCUTgWifhXXP6xJYhlIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKARoNpE0GxOxfHvMG/i6bkrZQrZbpRLbjZ4E3asLTA=;
 b=oPgzQkTcwBnK5GhQcMnQZISsigCZPqxoAXiHclEDvYBoRtGieHSJL2fcAwicHZzQFOaOCVTZ876Xj0wMeD6CMXqFd0+ParvPIEU3TGRHS41UI8+7wNiPbgu5aRw96z5k08ByuhQQ1KLqZlEnwAZ27MPP/+nVJKz4WIINPUiSNxXi1vBiUhwwsm/G3JaXg+YkCEaht6QVfRidSxJmnqXH8uzz8kKPw6MP76C4R2WCSZ4L+ZskTHBrakHF32OKz7tabjCXr7hWhYVsyNHIlhBlFQTz+NUIq5vtv0WBUDShQJncmsY4160bZhO2yXl+p4NUKaX9kml0pGNUV2uqAA+aKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKARoNpE0GxOxfHvMG/i6bkrZQrZbpRLbjZ4E3asLTA=;
 b=gRJSCssT/qDmYu18Gg06Ha/Vmz5+WhziDKk79VsCjsn79PUh/N74DVh/coRByqvwHa+7m68TmHniD3xqCXmwM7TT3+38r8J075N0gM3RwRJ/Z4lkvpthPblG9zMjUr3lZ9U8nAzhPq1XAAgHJunI53RbFiOr/4ExWUuXcKRiRzO7n3UwoRkBk00stO+uc5kKka7YPElghBKlSI5c18L899g0G3mNPqgSbFvyC7N/gQCD2fu5Ixu+Bp7axWHdfgjRnSxWl1I2R2kXWxXnNJWc2FmHrdBw/8cd7yCgBHtSFixcprzxuUSuAzSamoQY/gEf11+KIb+pyowkrh5qPHnchA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DB9PR04MB9889.eurprd04.prod.outlook.com (2603:10a6:10:4ef::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.10; Fri, 6 Dec
 2024 07:10:05 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8207.017; Fri, 6 Dec 2024
 07:10:05 +0000
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
	NXP S32 Linux <s32@nxp.com>,
	imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v6 3/4] arm64: defconfig: add S32G RTC module support
Date: Fri,  6 Dec 2024 09:09:54 +0200
Message-ID: <20241206070955.1503412-4-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241206070955.1503412-1-ciprianmarian.costea@oss.nxp.com>
References: <20241206070955.1503412-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR06CA0082.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::23) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DB9PR04MB9889:EE_
X-MS-Office365-Filtering-Correlation-Id: 198d1ed0-9f42-4ae2-a8f7-08dd15c5029a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWVWNjA3QlpoY3lyTE50RHJlU3lUQVBnZC9hSXpZelczR2k3Qi9WMmI2ZGRn?=
 =?utf-8?B?K1U1bURLZkIzVm1wNHdGR1dYNmltaGFhMjZqTDVTTzBkOXZ2ODEyKzYxZzZW?=
 =?utf-8?B?SDR6blkxZEJQTnF5MlhWYmJoQTFGOVJqLzlMTXBvMVU1QW1wRUZ3bzZQcjJW?=
 =?utf-8?B?YlJDVy91WWgyNlBsUEFGb1BUM2tHVEFQRTFnKytvZnFuLy94cGZmbUQ2RG5i?=
 =?utf-8?B?NWVQRkhpK0tPVjFEY1N5ZEt4UGJTN2wzVGlZVlM5UmkzdjJnVFZsWnRBeUhn?=
 =?utf-8?B?WTVYeFRXTnRwS1JRTEFnYkNJVklrcWhxRzV5eXFxOThzMDRoRDdhWWxjRzY5?=
 =?utf-8?B?eTYrTDZZcXZQNDNjNDBHTGVDUDkvQkdIWlczVk5QMHljQy9YNkFvMGFQc0N0?=
 =?utf-8?B?ZWQzTEFOd1BsNlZjSHlWRFpiL2FKcStOZjBjOWZBQmIrU1VVQlZxYnJ3dzhl?=
 =?utf-8?B?THJCN3MveVlZN3l1RFl0MHphZXJETE80UGdVWFM3Y0dGQk1DOGdkbVVhd056?=
 =?utf-8?B?aVc2ZlBBZEhwcmpqa3VHblViU2hhdXdjeDhialpwdU00U3puNjRTeTBIVkl0?=
 =?utf-8?B?Nnd4cE5zcUxhTUhBcGxCRVpua0RoVWVLVG43UHFINm05ZkhLUjdFTmFvRGNG?=
 =?utf-8?B?T0QyMmNRemxIU1Jkc3duNDN1R3IwcFB2Nk1kbEtCM2szY1JoS1BmU0xhRlV3?=
 =?utf-8?B?cDhVR3JPUS9XbzRTUVljSlpYM245Q1lXNlFPRDZCWDdKclB4bUZWcmhNMzBs?=
 =?utf-8?B?VHlScGpJYXNSdDFTUCtyWnIxeFI3MEdXNXdhNW5SREcwT3RUYzNtOS9MV3Q2?=
 =?utf-8?B?L0U1MFg0UG1wU3RTajVLdSttVlp0YkdZdjNnSmpZMmdMa1oxMmZ6a0RvQ1JM?=
 =?utf-8?B?eElnanRyMnhqWHpHVi9oSm9CQTBKRmVtUjViTTBpNjVkaVY1YkZhTEMrZSts?=
 =?utf-8?B?VEQrL2lDalJPQ1BSV213dTlvQ2ZLbHVyZCtJYUZ6VFh6TUlhbUtVZVlpcmhO?=
 =?utf-8?B?Qkp3aWF3dElHUjNUZkhobGNxTmdENmh5ZlBTb1N4WW81RUN0T2Rsbkw0SW44?=
 =?utf-8?B?NHc4UWI2bVFEQXcyUkVkZW1RZGhWZCtRclZhQi9QTk8wQ1pmUC9nN3pna2Ny?=
 =?utf-8?B?V29xaVROWElUMGlUcDdpZVAxdFRiSms3ZUhwUzgra0pnWkJSQWZoN2Jjdm5G?=
 =?utf-8?B?VEVzZ0V1ZlYwdGRrMU93RHd1NjYzVkwrL0dWcmE4eC9RbHVySHRGTzhWeDZi?=
 =?utf-8?B?emJtY2dlZ0lKdWNjVUZMako5NXM3M25jSFZXSVFIUG1Ebkg4bVhTcWFOZlRQ?=
 =?utf-8?B?T1pyWmF5NWtUQzI0ck42QytNYjBBL2NudUkyMXJLVk1lWnM3K2tZa2pDakNr?=
 =?utf-8?B?bW14TWJ0cmZ5Yk5waEQ3Z1JNa2tkY1B5a1BYbS9uTGRtYUR3dy9qYnptTGV5?=
 =?utf-8?B?bEpiN2FFZ3dYcmRVQmY5U1BrOVBhZ0xrd1BCSGFDYkVQaW1UcXFLQTdaUWdm?=
 =?utf-8?B?ZjlBbkcvVGlpcmEzZHc5aXBNMGRHdFRZUG5LVmNaUnJMbXNlSWhySXlOMU95?=
 =?utf-8?B?UE95OFBlY0JPeEhEVWNGU2VtUU5NZ084aERYVXQ4LzhsKzBpRm5pczNIekNs?=
 =?utf-8?B?QXA0YWxlNHMyOWlLU21EOXFKU2pCVjFLQXpjZGp6U014cTJwd1VFSjl2K1pt?=
 =?utf-8?B?Z2RsM3ovVFdGaktubEluZDRSZVI5RDRJVG9UVjFGTGVSY0dSU0lDdlA1eWFp?=
 =?utf-8?B?YzE3UjFTTlBWWm1vQ0l4VGJJcXZkM091RGY1TUhSZUhXUmh0ZE5ua1Boc3g5?=
 =?utf-8?B?YWl3cmRBaDB5Uk9RZHdvUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGVOUlBWVVpSZUNacklJU0xGZGsrdkJtbDNZd1VUSDVwMkZJVDZ5YlRJaU9Z?=
 =?utf-8?B?L0VBYmdPV1NHVWlVWDdIVnBFK0FyR2RvdFFZY1IyTGQycDdEbDNUeWdIQWor?=
 =?utf-8?B?cHVJeHF3WlErK3l2K3ZtbWpvR2FoeDJwUmlJKzJiYWJXSU5pTVFBV2ZZa2Zx?=
 =?utf-8?B?WUpsdWZaL2wwR3AxWEpmZVVzNjRvb1lPbHM2c25PRVo1N1RyaElSWVVSMDFN?=
 =?utf-8?B?UU05QW9pb1pGNVRGR1FUWWVLbzhuYTJnT20zbUtFOTEzL0dqblpkL2NkVWwy?=
 =?utf-8?B?ZFN5amNzYkdzT2Nuc2dBQ0ZqdWRjTmo1VEdRd0k1dUVRaGdVaEhhQ2hkYVFm?=
 =?utf-8?B?SE4rem5UK0dmMk9oMjVTRWNkUTgwN0FmVHRXS1VxME1RRExuVVMvNTEvMGxX?=
 =?utf-8?B?TXVSVWRzcEtxZUVKNjNlU0FNUk5IOFNaWEp1L05EaTdNaDhMRVlMTjZBbW0w?=
 =?utf-8?B?UFdJY2VNQmlaYzE1Qk02ZFFKVEtkTCtudmpKVEZEc01rMVlZRXRTSTh5VGRa?=
 =?utf-8?B?N2trUDZxNk9RTmFEQ09WeCtCQ0hSaHJZaVlvdURuS2VOMENZZVhUL0hoeS80?=
 =?utf-8?B?NmI2Q0N6UDVwb2pLTWVHMzIvWGRpTWZ4NUI3REJDYk1sMXdOUHpRNU9OZzgv?=
 =?utf-8?B?YkRSWHJveWdBN1QvVm52SFQ4V1AyaTFhcTFaYXVtOE5zTStEU1lZWEhZNzdx?=
 =?utf-8?B?U3ZGUEV1SjdKTG9HTVRnR0V0MHRmR3BqcldHdCtmcXhUbnRxc2E0U3VZajZr?=
 =?utf-8?B?T3RPQlEyT2NjOHdTMzR6ZWl2Z2tGbGRDWXRrQ0owenZmMEZUaFI5VFgyZGEw?=
 =?utf-8?B?blZqQ1dUMExQWGtVUFZJak5lNDRSZVdKOFJYYkZ4VjFKU1BCTGw0WUdWdmx3?=
 =?utf-8?B?VXQvUENhdHhNNzZaOXYySU01SFp4NHptaXUxbTBjSFFxVm1SVGRqKzFZaWsx?=
 =?utf-8?B?VVVGOUpFN0RybW8rWjJFSDY1aEpYbkpqOUdHcitRV3p0dlR1aU5Pb1RYcXBX?=
 =?utf-8?B?em8yVXoraXBWTUVJazhPUEpzaXBYQ3JQUkdxWnZpRlZ4bjJ1eUZIQzNxQ1Uv?=
 =?utf-8?B?bWk1REJXMHlld3Vxc05Ock9VY2wwVlRSTndiMEE5S3BQOUJSVHNZNU9IQ0Fu?=
 =?utf-8?B?RUlkckYvc3FXNWxLQlIwdW13WWJacVhTZ0RVdi91eENKVHMyMUsvZ2lYelNR?=
 =?utf-8?B?NlI2ZnNHWUQwUENjOVRjSU5Ga0dBZGZYaTM2dUxta0JOaXFJMVRTQ0tJWElv?=
 =?utf-8?B?SzZMNmp5V01jMWJBT1grdlF4Q28xTkw1YU44Q1NCaTMwMGpqZ3JDNWtpLzdV?=
 =?utf-8?B?U1RJOW8vL2QyTWlZb1JTclhPbTIyWFE2eFdiRVZlSWNVTEVBTXBzNlJmNjUr?=
 =?utf-8?B?UHNhZVIwV0lvUk5Rdmladlp1NDFyV2tCcVZPRzRVZGtZRUhoOUdBNVhiQ2dh?=
 =?utf-8?B?UmVTckZaUDhYRi9MYllsMk8yZTFubEFCdThTVzRTYXBrWTM2RTJINHFUUVNX?=
 =?utf-8?B?L1AxeHpZMVUyc3dRQkVaQmwvMThMOVhmeUZPNllwNUdjTUJYbnpFUm1WL1pm?=
 =?utf-8?B?MzljNC9MelBkS0ZoMUhqdW9VVEIxSlpVbk8yNUpsTHFCNnlSVmhRQXRsTHo5?=
 =?utf-8?B?UHBmbmVGU2ZuWXhQekdwL015eGlYb01aMTFvbjdlTUgyR3pRR0ZOZ1kyQVlo?=
 =?utf-8?B?WHora1Nva2NsYTFVOTBkTEVuTGczTGlwN3dubHdyK0RKYk4zOTRYWSsram9F?=
 =?utf-8?B?YWNWSW01Q0VqbUZzU1dVUUZiZzdxOVZ4b1p5bG1URGN6S0tRMjlCVEtCVDcr?=
 =?utf-8?B?VHpUS09YT0FtQUM5V3gya1RodzA4cDMrM3pxSjRBNjJNOWc4dDJxaXpJRXBv?=
 =?utf-8?B?RHhBUjFWOW5hOUsvMVJrbnBvbEkxYWJQMTdKV0JUelJnQXVJSmxqTllvL1hn?=
 =?utf-8?B?dVI5cFh0Wml4REJlalJrWmgxczZzamNqWDZISG5mY09UaFNPQWRiNFVIMlpC?=
 =?utf-8?B?QWdJNHFDaG9zWlU1OUFFWG1aanVWUTRXemNLdGFJOHgxL0RiNU55Q3g5Vkpw?=
 =?utf-8?B?NnN5NW1VK3BOMzhMR2Z6Qi9ETVJQTG5XMGJKaWdpN1N6a2VXWk1BMGZ2NTZq?=
 =?utf-8?B?d0VjRm04aElRYW5YU2pXRUEzRC9acVp1eGhsZ2xod3hVa3c0VVYrNkVYZlRn?=
 =?utf-8?B?TFE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 198d1ed0-9f42-4ae2-a8f7-08dd15c5029a
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 07:10:05.4067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AbtSjx/a4do28zjcGsepCndiDUMJzdqOxTu1Fkc+syEk/zhJO/OYvrK8hM2r27RiHQT+s2OR73Lfo8j5zBh23QyErF3HDSFuFMh4H6+0PyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9889

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

The RTC hardware module present on S32G based SoCs tracks clock time
during system suspend and it is used as a wakeup source on S32G2/S32G3
architecture.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c62831e61586..d9d0ddd0d31e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1210,6 +1210,7 @@ CONFIG_RTC_DRV_DA9063=m
 CONFIG_RTC_DRV_EFI=y
 CONFIG_RTC_DRV_CROS_EC=y
 CONFIG_RTC_DRV_FSL_FTM_ALARM=m
+CONFIG_RTC_DRV_S32G=m
 CONFIG_RTC_DRV_S3C=y
 CONFIG_RTC_DRV_PL031=y
 CONFIG_RTC_DRV_SUN6I=y
-- 
2.45.2


